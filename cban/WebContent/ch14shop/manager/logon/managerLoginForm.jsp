<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String title = "매니저 로그인";
%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=title %></title>
<link rel="stylesheet" href="/cban/assets/bootstrap-4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/cban/assets/bootstrap-4.1.0/css/signin.css">
<style>
@import url("http://fonts.googleapis.com/earlyaccess/notosanskr.css");
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>

<form name="loginForm" class="form-signin text-center" method="post" action="managerLoginPro.jsp">
	<h1 class="h3 mb-3 font-weight-normal">매니저 로그인</h1>
	
	<label for="inputId" class="sr-only">ID</label>
	<input class="form-control" id="inputId" name="id" type="text" placeholder="ID" required="required" autofocus="autofocus">
	<label for="inputPwd" class="sr-only">Password</label>
	<input class="form-control" id="inputPwd" name="passwd" type="password" placeholder="Password" required="required">
	
	<button type="submit" class="btn btn-lg btn-dark btn-block">로그인</button>	
	<p class="mt-5 mb-3 text-muted">&copy; 2018 KHM</p>
</form>
	
<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>