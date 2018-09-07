<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	request.setCharacterEncoding("utf-8");
	String title = "게시판변경";
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }

	number = count-(currentPage-1)*pageSize;
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
<h3><i class="fas fa-list-ol"></i> 글목록(전체 글:<%=count%>)</h3>

<a class="btn btn-primary btn-sm" href="writeForm.jsp" role="button"><i class="fas fa-pencil-alt"></i> 글쓰기</a>

<% if (count == 0) { %>
<div class="alert alert-danger" role="alert">
  게시판에 저장된 글이 없습니다.
</div>

<% } else {%>
<table class="table table-hover table-bordered"> 
	<colgroup>
	  	<col width="8%">
	  	<col width="*%">
	  	<col width="10%">
	  	<col width="18%">
	  	<col width="8%">
	  	<col width="10%">
	</colgroup>
	
	<thead class="thead-dark">
    <tr> 
      <th scope="col">번호</th> 
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
   		
<%
	int wid=0; 
	if(article.getRe_level()>0){
		wid=10*(article.getRe_level());
%>
		<td style="text-indent: <%=wid%>px"> 
			<i class="fas fa-reply fa-lg"></i>
<%  }else{%>
		<td style="text-indent: <%=wid%>px">
<%  }%>
           
		<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%=article.getSubject()%></a> 
<% if(article.getReadcount()>=20){%>
		<span class="badge badge-danger">HOT</span><%}%> </td>
    	<td><a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    	<td><%= sdf.format(article.getReg_date())%></td>
    	<td><%=article.getReadcount()%></td>
    	<td><%=article.getIp()%></td>
  	</tr>
<%}%>
	</tbody>
</table>
<%}%>

<!-- pagination -->
<nav aria-label="Page navigation">
  <ul class="pagination justify-content-center">
<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
			startPage = (int)(currentPage/10)*10 + 1;
		else
			startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>	
			<li class="page-item">
				<a class="page-link" href="list.jsp?pageNum=<%= currentPage-1 %>" aria-label="Previous">
					<span aria-hidden="true">&laquo;</span>
					<span class="sr-only">Previous</span>
				</a>
			</li>
<%   }
      
        
        for (int i = startPage ; i <= endPage ; i++) {  
        	if (i == currentPage) {
%>        	    
				<li class="page-item active">
				   <a class="page-link" href="list.jsp?pageNum=<%= i %>"><%=i %> <span class="sr-only">(current)</span></a>
				 </li>
<% 
        	} else {
%>
        		<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a></li>
<%
        	}
		}
        
        if (endPage < pageCount) {  %>
			<li class="page-item">
				<a class="page-link" href="list.jsp?pageNum=<%= startPage + 10 %>" aria-label="Next">
					<span aria-hidden="true">&raquo;</span>
					<span class="sr-only">Next</span>
				</a>
			</li>
<%
        }
    }
%>
	</ul>
</nav>
</div>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>