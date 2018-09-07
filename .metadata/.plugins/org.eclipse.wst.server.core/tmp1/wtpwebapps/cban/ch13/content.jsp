<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "게시글";
	
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

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

<div class="container">
<h3><i class="fas fa-list-ol"></i> 글 내용 보기</h3>

<div class="card">
	<div class="card-header">
		<div class="row">
			<div class="col-md-3 text-left"><strong><%=article.getNum()%></strong>번째 글</div>
			<div class="col-md-6 text-center"><strong><%=article.getSubject()%></strong></div>
			<div class="col-md-3 text-right">작성자 <strong><%=article.getWriter()%></strong>님</div>
		</div>
	</div>
	<ul class="list-group list-group-flush">
		<li class="list-group-item text-right"><i class="fas fa-eye"></i> <%=article.getReadcount()%> <i class="far fa-clock"></i> <%= sdf.format(article.getReg_date())%></li>
		<li class="list-group-item"><%=article.getContent()%></li>
	</ul>
	<div class="card-footer">
		<button type="button" class="btn btn-dark" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">글수정</button>
		<button type="button" class="btn btn-dark" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">글삭제</button>
		<button type="button" class="btn btn-dark" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">답글쓰기</button>
		<button type="button" class="btn btn-dark" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">글목록</button>
	</div>
</div>

<%
 }catch(Exception e){} 
 %>
 
</div>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>