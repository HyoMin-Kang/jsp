<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "khm.board.BoardDBBean" %>
<%@ page import = "khm.board.BoardDataBean" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Update";
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
	    BoardDBBean dbPro = BoardDBBean.getInstance(); 
	    BoardDataBean article =  dbPro.updateGetArticle(num);

		String id = (String)session.getAttribute("id");
	    if(id != null && id.equals(article.getWriter())) {
%>


<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>

<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<form method="post" name="writeform" action="boardUpdatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave(this)" enctype="multipart/form-data" accept="image/*">
		<input type="hidden" name="num" value="<%=article.getNum()%>">
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Update</h1> 
			<div class="btn-toolbar mb-2 mb-md-0">
				<a href="board.jsp" class="btn btn-sm btn-secondary">목록으로</a>
			</div>
		</div>
		
		<table class="table table-bordered">
			<tr>
				<td>제목 <small style="color:red;">*</small></td>
				<td><input type="text" class="form-control" name="subject" value="<%=article.getSubject()%>" placeholder="제목 입력" required="required"></td>
				<td>카테고리 <small style="color:red;">*</small></td>
				<td>
					<select class="form-control" name="category" required="required">
						<option value="">선택하세요...</option>
						<option value="자유글"<%if(article.getCategory().equals("자유글")){out.print(" selected=\"selected\"");}%>>자유글</option>
						<option value="질문글"<%if(article.getCategory().equals("질문글")){out.print(" selected=\"selected\"");}%>>질문글</option>
						<option value="정보글"<%if(article.getCategory().equals("정보글")){out.print(" selected=\"selected\"");}%>>정보글</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>작성자 <small style="color:red;">*</small></td>
				<td><input type="text" class="form-control" name="writer" value="<%=article.getWriter() %>" placeholder="이름 입력" required="required" readonly="readonly"></td>
				<td>이메일</td>
				<td><input type="text" class="form-control" name="email" value="<%=article.getEmail() %>" placeholder="이메일 입력" ></td>
			</tr>
			<tr>
				<td>내용 <small style="color:red;">*</small></td>
				<td colspan="3"><textarea class="form-control" name="content"  rows="13" cols="40" required="required"><%=article.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" class="form-control" name="file" accept="image/*"><%=article.getFile() %></td>
				<td>비밀번호 <small style="color:red;">*</small></td>
				<td><input type="password" class="form-control" maxlength="12" name="passwd" placeholder="최소 4자리 이상 입력해 주십시오." required="required"></td>
			</tr>
		</table>
		
		<div class="text-center">
			<button type="submit" class="btn btn-dark">글쓰기</button>		
			<button type="reset" class="btn btn-secondary">초기화</button>	
		</div>		
				
	</form>
</div>

<%
	    } else {
 %>
	    	<script>
				alert('올바르지 않은 접근입니다.');
				history.go(-1);
			</script>
<%
	    }
	}catch(Exception e){}
%>      
    
<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>