<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="khm.member.LogonDBBean"%>

<% request.setCharacterEncoding("utf-8"); %>
<%
	String id = request.getParameter("id");
	LogonDBBean logon = LogonDBBean.getInstance();
	int check = logon.confirmId(id);
	
	if(check == 1) {  //해당 아이디 있음
%>
	<b><%= id %></b>은(는) 이미 사용중인 아이디입니다.<br>
	다른 아이디를 입력해 주세요.
	<form method="post" action="idCheck.jsp">
		<input type="text" name="id">
		<input type="submit" value="중복 확인">
	</form>
	<%
	} else { //해당 아이디 없음
	%>
	입력하신 <b><%=id %></b>는 사용 가능합니다.<br>
	<input type="button" value="사용하기" onclick="setId()">
	<input type="button" value="취소" onclick="cancelId()">
	<%
	}
	%>
	
<script>
	function setId() {
		opener.document.insertMember.id.value='<%=id%>';
		self.close();
	}
	function cancelId() {
		opener.document.insertMember.id.value='';
		self.close();
	}
</script>