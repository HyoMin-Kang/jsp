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

<jsp:include page="../module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>
    
<main role="main" class="container">
<h3 class="pb-3 mb-4 font-italic border-bottom">로그인</h3>
	<form name="loginForm" class="text-center" method="post" action="loginPro.jsp">			
		<div class="form-row justify-content-md-center">
			<div class="col-md-4 mb-3">
				<label for="id" class="sr-only">ID</label>
				<input type="text" class="form-control" id="id" name="id" placeholder="ID" autofocus="autofocus" required="required" value="<%=id %>">
			</div>
		</div>
		<div class="form-row justify-content-md-center">
			<div class="col-md-4 mb-3">
				<label for="passwd" class="sr-only">PASSWORD</label>
				<input type="password" class="form-control" id="passwd" name="passwd" placeholder="PASSWORD" required="required">
			</div>
		</div>
		<div class="custom-control custom-checkbox custom-control-inline">
			<input class="custom-control-input" type="checkbox" name="saveId" id="loginCheck1"<% if(id.isEmpty()==false) out.print(" checked=\"checked\"");%>>
			<label class="custom-control-label" for="loginCheck1">아이디 저장</label>
		</div>
		
		<div class="form-row justify-content-md-center">
			<div class="col-md-4 mb-3">
				<button type="submit" class="btn btn-dark btn-block">로그인</button>
				<button type="button" class="btn btn-outline-dark btn-block" onclick="history.go(-1);">이전 화면으로 돌아가기</button>
			</div>
		</div>
		<a href="insertMemberForm.jsp" target="_blank"><i class="fas fa-external-link-alt"></i> 회원 가입하기</a>
		
		<p class="mt-5 mb-3 text-muted">&copy; 2018 KHM</p>
	</form>
</main>

<jsp:include page="../module/footer.jsp" flush="false"/>