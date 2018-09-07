<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "khm.board.BoardDBBean" %>
<%@ page import = "khm.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%!
    int pageSize = 10; //화면에 표시할 글 목록의 개수
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Board";
	String pageNum = request.getParameter("pageNum");
	
	String id = (String)session.getAttribute("id");

    if (pageNum == null) { //pageNum 값이 없으면 기본값 1로 지정
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum); //현재 페이지
    int startRow = (currentPage - 1) * pageSize + 1; //현 페이지 글목록에 표시할 시작 글번호
    int endRow = currentPage * pageSize; //현 페이지 글목록에 표시할 마지막 글번호
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();

    //검색어 처리
    String keyField = request.getParameter("keyField");
    String keyWord = request.getParameter("keyWord");
    
	count = dbPro.getArticleCount(keyField, keyWord);


    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize, keyField, keyWord); //글목록을 참조하기 위한 변수
    }

	number = count-(currentPage-1)*pageSize;
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>

<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">Board (게시글 수:<%=count%>)</h1>
		<div class="btn-toolbar mb-2 mb-md-0">
			<%
				if(id != null) {
			%>
				<a href="boardWriteForm.jsp" class="btn btn-sm btn-outline-secondary">글쓰기</a>
			<%} %>
		</div>
	</div>
          
	<% if (count == 0) { %>
	<div class="alert alert-danger" role="alert">게시판에 저장된 글이 없습니다.</div>
	<% } else {%>
	<div class="table-responsive">
		<table class="table table-striped table-hover">
			<colgroup>
			  	<col width="6%">
			  	<col width="10%">
			  	<col width="*%">
			  	<col width="8%">
			  	<col width="14%">
			  	<col width="8%">
			  	<col width="10%">
			</colgroup>      
			
	       <thead>
	    		<tr> 
					<th scope="col">번호</th> 
					<th scope="col">카테고리</th> 
					<th scope="col">제목</th> 
					<th scope="col">작성자</th>
					<th scope="col">작성일</th> 
					<th scope="col">조 회</th> 
					<th scope="col">IP</th>    
				</tr>
			</thead>
	    
			<tbody>
	        <%  
	   			for (int i = 0 ; i < articleList.size() ; i++) {
					BoardDataBean article = articleList.get(i);
			%>
				<tr>
	   				<td> <%=number--%></td>
	   				<td><%=article.getCategory() %></td>
	   		<%
				int wid=0; 
				if(article.getRe_level()>0){
					wid=10*(article.getRe_level());
			%>
					<td style="text-indent: <%=wid%>px"><i class="fas fa-reply fa-lg"></i>
			<%  }else{%>
					<td style="text-indent: <%=wid%>px">
			<%  }%>
					<a href="boardContent.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject()%></a> 
			<% if(article.getFile() != null) { %>
					<span><i class="fas fa-save"></i></span>
			<%	}%>
			
			<% if(article.getReadcount()>=20){%>
					<span class="badge badge-danger">HOT</span>
			<%	}%> 
					</td>
			    	<td><%=article.getWriter()%></td>
			    	<td><%=sdf.format(article.getReg_date())%></td>
			    	<td><%=article.getReadcount()%></td>
			    	<td><%=article.getIp()%></td>
	  			</tr>
			<%	}%>
			</tbody>
		</table>
	</div>
	<%	}%>
	
	<!-- search box -->	
	<form name="searchForm" action="board.jsp?keyField=<%=keyField %>&keyWord=<%=keyWord %>" method="get" class="form-inline" onsubmit="return searchCheck(searchForm)">
		<div class="input-group mb-2 mr-sm-2">
			<select class="form-control" name="keyField" onchange="selectField()">
				<option value="">선택하세요..</option>
			    <option value="writer">작성자</option>
			    <option value="subject">제목</option>
			    <option value="category">카테고리</option>
				<option value="content">내용</option>
				<option value="subject_content">제목+내용</option>
			</select>
		</div>
		<div class="input-group mb-2 mr-sm-2">
		    <select class="form-control" name="keyWord" id="inputCtg" disabled="disabled">
		    	<option value="">카테고리 선택..</option>
		    	<option value="자유글">자유글</option>
		    	<option value="질문글">질문글</option>
		    	<option value="정보글">정보글</option>
		    </select>
		    <input type="text" class="form-control" name="keyWord" id="inputKwd" placeholder="검색어 입력" disabled="disabled">
		    <div class="input-group-append">
 		 		<button type="submit" class="btn btn-outline-secondary"><i class="fas fa-search"></i> 검색</button>
 		 	</div>
		</div>
	</form>
	
	<!-- pagination -->
	<%
		if (keyField == null && keyWord == null) {
	%>
	<nav aria-label="Page navigation">
		<ul class="pagination justify-content-center">
			<%
				if (count > 0) {
					int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
					int startPage = 1;

					if (currentPage % 10 != 0)
						startPage = (int) (currentPage / 10) * 10 + 1;
					else
						startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

					int pageBlock = 5;
					int endPage = startPage + pageBlock - 1;
					if (endPage > pageCount)
						endPage = pageCount;

					if (startPage > 5) {
			%>
					<li class="page-item">
						<a class="page-link" href="board.jsp?pageNum=<%=currentPage - 1%>" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
						</a>
					</li>
			<%
					}

					for (int i = startPage; i <= endPage; i++) {
						if (i == currentPage) {
			%>
						<li class="page-item active">
							<a class="page-link" href="board.jsp?pageNum=<%=i%>"><%=i%> <span class="sr-only">(current)</span></a>
						</li>
			<%
						} else {
			%>
						<li class="page-item"><a class="page-link" href="board.jsp?pageNum=<%=i%>"><%=i%></a></li>
			<%
						}
					}

					if (endPage < pageCount) {
			%>
					<li class="page-item">
						<a class="page-link" href="board.jsp?pageNum=<%=startPage + 5%>" aria-label="Next">
							<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a>
					</li>
			<%
					}
				}
			%>
		</ul>
	</nav>
	<% 
	} else {
	%>
	<nav aria-label="Page navigation">
	<ul class="pagination justify-content-center">
		<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
				int startPage = 1;

				if (currentPage % 10 != 0)
					startPage = (int) (currentPage / 10) * 10 + 1;
				else
					startPage = ((int) (currentPage / 10) - 1) * 10 + 1;

				int pageBlock = 5;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount)
					endPage = pageCount;

				if (startPage > 5) {
		%>
				<li class="page-item">
					<a class="page-link" href="board.jsp?keyField=<%=keyField %>&keyWord=<%=keyWord %>&pageNum=<%=currentPage - 1%>" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
					</a>
				</li>
		<%
				}

				for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) {
		%>
					<li class="page-item active">
						<a class="page-link" href="board.jsp?keyField=<%=keyField %>&keyWord=<%=keyWord %>&pageNum=<%=i%>"><%=i%> <span class="sr-only">(current)</span></a>
					</li>
		<%
					} else {
		%>
					<li class="page-item"><a class="page-link" href="board.jsp?keyField=<%=keyField %>&keyWord=<%=keyWord %>&pageNum=<%=i%>"><%=i%></a></li>
		<%
					}
				}

				if (endPage < pageCount) {
		%>
				<li class="page-item">
					<a class="page-link" href="board.jsp?keyField=<%=keyField %>&keyWord=<%=keyWord %>&pageNum=<%=startPage + 5%>" aria-label="Next">
						<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
					</a>
				</li>
		<%
				}
			}
		%>
	</ul>
</nav>
	<%
	}
	%>

</div>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>