<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="ch12.member.LogonDBBean"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="member" class="ch12.member.LogonDataBean">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%
	member.setReg_date(new Timestamp(System.currentTimeMillis()));
	LogonDBBean logon = LogonDBBean.getInstance();
	String rs = logon.insertMember(member);
	
	if(rs.equals("ok")) {
%>
<jsp:getProperty name="member" property="id" />님 회원가입을 축하합니다.
<%
	}else if(rs.equals("error")) {
%>
<script>
	alert('아이디가 중복이거나 시스템 에러가 발생했습니다.');
	history.go(-1);
</script>
<%
	}
%>


