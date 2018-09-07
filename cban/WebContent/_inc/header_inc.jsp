<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageTitle = request.getParameter("title");	
%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><%=pageTitle %></title>
<link rel="stylesheet" href="/cban/assets/bootstrap-4.1.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/cban/assets/bootstrap-4.1.0/css/signin.css">
<link rel="stylesheet" href="/cban/assets/dashboard.css">
<style>
@import url("http://fonts.googleapis.com/earlyaccess/notosanskr.css");
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
