<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- navigation -->
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">216210089 강효민</a>
	<ul class="navbar-nav px-3">
	<c:if test="${sessionScope.id eq null }">
		<li class="nav-item text-nowrap">
			<a class="nav-link" href="sessionLoginForm.jsp">Log in</a>
		</li>
	</c:if>
	<c:if test="${sessionScope.id ne null }">
		<li class="nav-item text-nowrap">
			<a class="nav-link" href="sessionLogout.jsp"><c:out value="${sessionScope.id}"/>님 환영합니다. Log out</a>
		</li>
	</c:if>
	</ul>
</nav>
    
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item">
					  <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
					</li>
					<c:if test="${sessionScope.id eq null }">
					<li class="nav-item">
						<a class="nav-link" href="insertMemberForm.jsp"><i class="fas fa-user-plus"></i> Sign up</a>
					</li>
					</c:if>
					<c:if test="${sessionScope.id ne null }">
					<li class="nav-item">
						<a class="nav-link" href="#"><i class="fas fa-user-circle"></i> Profile</a>
					</li>
					</c:if>
					<li class="nav-item">
					  <a class="nav-link" href="board.jsp"><i class="fas fa-edit"></i> Board</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" href="contact.jsp"><i class="fas fa-envelope-open"></i> Contact us</a>
					</li>
				</ul>
			</div>
		</nav>
	</div> <!-- end row -->
 </div> <!-- end container -->
