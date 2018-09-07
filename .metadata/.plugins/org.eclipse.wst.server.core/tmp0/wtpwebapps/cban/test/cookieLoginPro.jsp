<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.member.LogonDBBean"%>
<% request.setCharacterEncoding("utf-8");%>
<%
    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	String saveId = request.getParameter("saveId"); //checkbox
	Cookie cookie = null; //쿠키 저장
	
	LogonDBBean logon = LogonDBBean.getInstance();
    int check= logon.userCheck(id,passwd);
    
	if(check==1){
		if(saveId != null) { //체크박스 체크상태
			cookie = new Cookie("id", id);
			cookie.setMaxAge(60*60);
		}
		else {
			cookie = new Cookie("id", "");
			cookie.setMaxAge(0);
		}
		response.addCookie(cookie);
		response.sendRedirect("cookieMain.jsp");
	}else if(check==0){%>
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
	</script>
<%	}else{ %>
	<script>
	  alert("아이디가 맞지 않습니다.");
	  history.go(-1);
	</script>
<%}%>
