<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "khm.board.BoardDBBean" %>
<%@ page import = "khm.board.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Content";
	String id = (String)session.getAttribute("id");
%>
<%
   int num = Integer.parseInt(request.getParameter("num"));
   String pageNum = request.getParameter("pageNum");

   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	try{
		BoardDBBean dbPro = BoardDBBean.getInstance(); 
		BoardDataBean article =  dbPro.getArticle(num);
  
	  	int ref=article.getRef();
	  	int re_step=article.getRe_step();
	  	int re_level=article.getRe_level();
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>

<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2"><%=article.getSubject() %> <a href="board.jsp?keyField=category&keyWord=<%=article.getCategory() %>" class="badge badge-secondary"><%=article.getCategory() %></a></h1>
		<div class="btn-toolbar mb-2 mb-md-0">
			<button type="button" class="btn btn-sm btn-secondary" onclick="document.location.href='board.jsp?pageNum=<%=pageNum%>'">글목록</button>
		</div>
	</div>
	
	<table class="table">
		<tr>
			<td><%=article.getWriter() %>님 (<%=article.getIp() %>)</td>
			<td class="text-right"><i class="fas fa-eye"></i> <%=article.getReadcount()%> <i class="far fa-clock"></i> <%= sdf.format(article.getReg_date())%></td>
		</tr>
		<tr>
			<td colspan="2"><%=article.getContent().replace("\r\n", "<br>") %></td> <!-- 줄바꿈 처리 -->
		</tr>
		<%
			if(article.getFile() != null) {
		%>
		<tr>
			<td colspan="2"><img src="/cban/upload/<%=article.getFile()%>" width="250px"></td>
		</tr>
		<tr>
			<td colspan="2">첨부된 파일 : <a href="fileDownload.jsp?fileName=<%=article.getFile() %>"><%=article.getFile() %></a></td>
		</tr>
		<%
			}
			if(id.equals(article.getWriter())) {
		%>
			<tr>
				<td colspan="2" class="text-center">
					<button type="button" class="btn btn-dark" onclick="document.location.href='boardUpdateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">글수정</button>
					<button type="button" class="btn btn-dark" onclick="document.location.href='boardDeleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">글삭제</button>
					<button type="button" class="btn btn-dark" onclick="document.location.href='boardWriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">답글쓰기</button>
				</td>
			</tr>
		<%
			} else if(!id.equals(article.getWriter())) {
		%>
			<tr>
				<td colspan="2" class="text-center">
					<button type="button" class="btn btn-dark" onclick="document.location.href='boardWriteForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">답글쓰기</button>
				</td>
			</tr>	
		<%
			}
		%>
		
	</table>

</div>

<%
 	}catch(Exception e){} 
 %>
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="/cban/assets/bootstrap-4.1.0/js/bootstrap.min.js"></script>
<script src="/cban/assets/fontawesome-free-5.0.9/svg-with-js/js/fontawesome-all.js"></script>
<script src="/cban/assets/script.js"></script>

<script>
$(document).ready(function() {
	$('#likeBtn').click(function() {
		
	});
});
</script>

</body>
</html>