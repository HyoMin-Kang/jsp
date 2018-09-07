<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String title = "게시글 삭제";
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
<h3><i class="fas fa-list-ol"></i> 글삭제</h3>

	<div class="card">
		<div class="card-header">
			글 삭제를 위해 비밀번호를 입력해 주세요.
		</div>
		<div class="card-body">
	    	<form method="POST" name="delForm" action="deletePro.jsp?pageNum=<%=pageNum%>"  onsubmit="return deleteSave()">
				<div class="form-group">
					<label for="inputPasswd">비밀번호 입력</label>
					<input type="password" class="form-control" id="inputPasswd" name="passwd" required="required">
					<input type="hidden" name="num" value="<%=num%>">
				</div>
					<button type="submit" class="btn btn-dark">글삭제</button>
	     				<button type="button" class="btn btn-dark" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">글목록</button>
	    	</form>
		</div>
	</div>

</div>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>