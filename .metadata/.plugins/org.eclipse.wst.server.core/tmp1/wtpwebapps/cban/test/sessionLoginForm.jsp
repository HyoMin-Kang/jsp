<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!doctype html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
<link rel="stylesheet" href="/cban/assets/bootstrap-4.0.0/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="/cban/assets/bootstrap-4.0.0/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">

	<form name="loginForm" class="form-signin" method="post" action="sessionLoginPro.jsp">
			<h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
			
			<label for="inputId" class="sr-only">ID</label>
			<input class="form-control" id="inputId" name="id" type="text" placeholder="ID" required="required" autofocus="autofocus" value="<%=id %>">
			<label for="inputPwd" class="sr-only">Password</label>
			<input class="form-control" id="inputPwd" name="passwd" type="password" placeholder="Password" required="required">
			
			<div class="custom-control custom-checkbox custom-control-inline">
				<input class="custom-control-input" type="checkbox" name="saveId" id="loginCheck1"<% if(id.isEmpty()==false) out.print(" checked=\"checked\"");%>>
				<label class="custom-control-label" for="loginCheck1">아이디 저장</label>
			</div>
			<div class="custom-control custom-checkbox custom-control-inline">
				<input class="custom-control-input" type="checkbox" name="autoLogin" id="loginChech2">
				<label class="custom-control-label" for="loginChech2">자동 로그인</label>
			</div>
			
			<button type="submit" class="btn btn-lg btn-outline-dark btn-block">log in</button>
			<a href="insertMemberForm.jsp" target="_blank"><i class="fas fa-external-link-alt"></i> 회원 가입하기</a>
			
			<p class="mt-5 mb-3 text-muted">&copy; 2018 KHM</p>
	</form>
  
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="/cban/assets/bootstrap-4.0.0/js/bootstrap.min.js"></script>
<script src="/cban/assets/fontawesome-free-5.0.9/svg-with-js/js/fontawesome-all.js"></script>
</body>
</html>