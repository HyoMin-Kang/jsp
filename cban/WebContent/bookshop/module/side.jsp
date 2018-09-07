<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookie = request.getCookies();	
%>
<aside class="col-md-4 blog-sidebar">
	<div class="p-3 mb-3 bg-light rounded">
		<h4 class="font-italic">Category</h4>
		<ul class="list-unstyled">
			<li><a href="../shopping/list.jsp?book_kind=all">전체목록보기</a></li>
			<li><a href="../shopping/list.jsp?book_kind=kor">국내도서</a>
				<ul>
					<li><a href="../shopping/list.jsp?book_kind=100">건강 취미</a></li>
					<li><a href="../shopping/list.jsp?book_kind=110">경제 경영</a></li>
					<li><a href="../shopping/list.jsp?book_kind=120">문학</a></li>
					<li><a href="../shopping/list.jsp?book_kind=130">사회 정치</a></li>
					<li><a href="../shopping/list.jsp?book_kind=140">자기계발</a></li>
					<li><a href="../shopping/list.jsp?book_kind=150">자연과학</a></li>
					<li><a href="../shopping/list.jsp?book_kind=160">참고서</a></li>
				</ul>
			</li>
			<li><a href="../shopping/list.jsp?book_kind=foreign">외국도서</a>
				<ul>
					<li><a href="../shopping/list.jsp?book_kind=200">문학 소설</a></li>
					<li><a href="../shopping/list.jsp?book_kind=210">경제 경영</a></li>
					<li><a href="../shopping/list.jsp?book_kind=220">인문 사회</a></li>
					<li><a href="../shopping/list.jsp?book_kind=230">예술 대중문화</a></li>
					<li><a href="../shopping/list.jsp?book_kind=240">취미 라이프스타일</a></li>
					<li><a href="../shopping/list.jsp?book_kind=250">컴퓨터</a></li>
					<li><a href="../shopping/list.jsp?book_kind=260">자연과학</a></li>
				</ul>
			</li>
		</ul>
	</div>
	
	<div class="p-3 mb-3 bg-light rounded">
		<h4 class="font-italic">History</h4>
		<ol class="list-unstyled">
<%
	if(cookie != null) {
		for(int i=0; i<cookie.length; i++) {
			String name = cookie[i].getName(); //전송된 쿠키이름 얻어오기
			if(name.indexOf("item") != -1) { //쿠키 이름에 item이 포함된다면
				String value = cookie[i].getValue();
				String item = URLDecoder.decode(value, "UTF-8");
%>	
			<li><a href="../shopping/bookContent.jsp?book_id=<%=name.substring(4) %>&book_kind=all"><%=item %></a></li>
<%
			}
		}
	}
%>
		</ol>
	</div>
</aside>