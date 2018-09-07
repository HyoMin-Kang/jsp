<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id ="";
   try{
	   id = (String)session.getAttribute("id"); //id변수의 값 할당
	   if(id==null || id.equals("")) //id가 널이거나 값이 할당되어 있지 않다면=로그인이 안되어 있다면
           response.sendRedirect("sessionLoginForm.jsp"); //로그인 페이지로 이동
	   else{
%>

<jsp:include page="/_inc/header.jsp" flush="false">
	<jsp:param name="title" value="세션을 사용한 간단한 회원인증"/>
</jsp:include>
<div class="container">
	<div class="alert alert-secondary" role="alert">
	  <b><%=id %></b>님이 로그인 하셨습니다. 
	</div>
	
    <form method="post" action="sessionLogout.jsp">
		<input type="submit" class="btn btn-danger" value="로그아웃">
    </form>
</div>
    
<jsp:include page="/_inc/footer.jsp" flush="false"/>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>