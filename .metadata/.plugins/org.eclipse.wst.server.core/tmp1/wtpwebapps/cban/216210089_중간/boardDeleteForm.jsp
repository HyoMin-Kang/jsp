<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "khm.board.BoardDBBean" %>
<%@ page import = "khm.board.BoardDataBean" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "Delete";
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
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">Delete</h1>
		<div class="btn-toolbar mb-2 mb-md-0">
			<button type="button" class="btn btn-sm btn-secondary" onclick="document.location.href='board.jsp?pageNum=<%=pageNum%>'">글목록</button>
		</div>
	</div>
	
	<form method="post" name="delForm" action="boardDeletePro.jsp?pageNum=<%=pageNum%>"  onsubmit="return deleteSave()">
		<div class="form-group">
			<label for="inputPasswd">비밀번호 입력</label>
			<input type="password" class="form-control" id="inputPasswd" name="passwd" required="required">
			<input type="hidden" name="num" value="<%=num%>">
		</div>
		<button type="submit" class="btn btn-dark">글삭제</button>
	    <button type="button" class="btn btn-dark" onclick="document.location.href='board.jsp?pageNum=<%=pageNum%>'">글목록</button>
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
%>
<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>