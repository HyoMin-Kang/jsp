<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<link rel="stylesheet" href="/cban/assets/blog.css">
<style>
@import url("http://fonts.googleapis.com/earlyaccess/notosanskr.css");
body {
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>

<div class="container">
      <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
          <div class="col-4 pt-1">
            <a class="text-muted" href="../manager/managerMain.jsp"><i class="fas fa-cog"></i></a>
          </div>
          <div class="col-4 text-center">
            <a class="blog-header-logo text-dark" href="shopMain.jsp">Bookstore</a>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <c:if test="${sessionScope.id eq null }"> <!-- 비로그인 상태 -->
            <a class="btn btn-sm btn-outline-secondary" href="insertMemberForm.jsp">Sign up</a>&nbsp;&nbsp;&nbsp;
            <a class="btn btn-sm btn-outline-primary" href="loginForm.jsp">Log in</a>
            </c:if>
            <c:if test="${sessionScope.id ne null }"> <!-- 로그인 상태 -->
            <a class="text-muted" href="cartList.jsp" data-toggle="tooltip" data-placement="bottom" title="장바구니"><i class="fas fa-shopping-cart"></i></a>&nbsp;&nbsp;&nbsp;
            <a class="text-muted" href="buyList.jsp" data-toggle="tooltip" data-placement="bottom" title="구매목록"><i class="fas fa-clipboard-list"></i></a>&nbsp;&nbsp;&nbsp;
            <div class="text-muted"><c:out value="${sessionScope.id}"/>님 환영합니다.</div>&nbsp;&nbsp;&nbsp;
            <a class="btn btn-sm btn-outline-primary" href="logout.jsp">Log out</a>
            </c:if>
          </div>
        </div>
      </header>
      
      <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between">
          <a class="p-2 text-muted" href="list.jsp">전체목록 보기</a>
          <a class="p-2 text-muted" href="list.jsp?book_kind=kor">국내도서</a>
          <a class="p-2 text-muted" href="list.jsp?book_kind=foreign">외국도서</a>
          <a class="p-2 text-muted" href="bestSeller.jsp">베스트셀러</a>
          <a class="p-2 text-muted" href="#">새로나온 책</a>
          <a class="p-2 text-muted" href="#">이벤트</a>
        </nav>
      </div>
</div>
