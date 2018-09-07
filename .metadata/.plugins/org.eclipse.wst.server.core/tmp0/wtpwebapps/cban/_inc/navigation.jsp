<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = "";
	try {
		id = (String)session.getAttribute("id");
%>

<!-- navigation -->
<nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">216210089 강효민</a>
	<ul class="navbar-nav px-3">
<%
		if(id == null || id.equals("")) {
%>
		<li class="nav-item text-nowrap">
			<a class="nav-link" href="#">Log in</a>
		</li>
<%
		} else {
%>
		<li class="nav-item text-nowrap">
			<a class="nav-link" href="#">Log out</a>
		</li>
<%
		}
%>
	</ul>
</nav>
    
<div class="container-fluid">
	<div class="row">
		<nav class="col-md-2 d-none d-md-block bg-light sidebar">
			<div class="sidebar-sticky">
				<ul class="nav flex-column">
					<li class="nav-item">
					  <a class="nav-link active" href="#">
					    Home
					  </a>
					</li>
<% 
		if(id == null || id.equals("")) {
%>
					<li class="nav-item">
						<a class="nav-link" href="#">Sign Up</a>
					</li>
<% 
		} else {
%>
					<li class="nav-item">
						<a class="nav-link" href="#">Profile</a>
					</li>
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
					<li class="nav-item">
					  <a class="nav-link" href="#">
					    Board
					  </a>
					</li>
					<li class="nav-item">
					  <a class="nav-link" href="#">
					    Contact
					  </a>
					</li>
				</ul>
			</div>
		</nav>
	</div> <!-- end row -->
 </div> <!-- end container -->