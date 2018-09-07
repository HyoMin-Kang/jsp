<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Log in";
%>
<%
	Cookie[] cookies = request.getCookies();
	String id = "";
	if (cookies != null) { //쿠키가 존재하면
		for (int i=0; i<cookies.length; i++) {
			if ( cookies[i].getName().equals("id")) {
				id = cookies[i].getValue(); //찾은 쿠키값 가져오기
			}
		}
	}
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>
    
	<form name="loginForm" class="form-signin text-center" method="post" action="sessionLoginPro.jsp">
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			
			<label for="inputId" class="sr-only">ID</label>
			<input class="form-control" id="inputId" name="id" type="text" placeholder="ID" required="required" autofocus="autofocus" value="<%=id %>">
			<label for="inputPwd" class="sr-only">Password</label>
			<input class="form-control" id="inputPwd" name="passwd" type="password" placeholder="Password" required="required">
			
			<div class="custom-control custom-checkbox custom-control-inline">
				<input class="custom-control-input" type="checkbox" name="saveId" id="loginCheck1"<% if(id.isEmpty()==false) out.print(" checked=\"checked\"");%>>
				<label class="custom-control-label" for="loginCheck1">아이디 저장</label>
			</div>
			
			<button type="submit" class="btn btn-lg btn-dark btn-block">log in</button>
			<a href="index.jsp" class="btn btn-lg btn-outline-dark btn-block">이전 화면으로 돌아가기</a>
			<a href="insertMemberForm.jsp" target="_blank"><i class="fas fa-external-link-alt"></i> 회원 가입하기</a>
			
			<p class="mt-5 mb-3 text-muted">&copy; 2018 KHM</p>
	</form>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>