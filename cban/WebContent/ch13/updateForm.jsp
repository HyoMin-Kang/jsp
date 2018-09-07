<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "게시글 수정";
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
      BoardDBBean dbPro = BoardDBBean.getInstance(); 
      BoardDataBean article =  dbPro.updateGetArticle(num);

%>

<div class="container">
<h3><i class="fas fa-list-ol"></i> 글수정</h3>

<form class="form" method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
	<div class="card">
		<div class="card-header">
			<div class="row">
				<div class="col-md-3 text-left"><strong><%=article.getNum()%></strong>번째 글</div>
				<div class="col-md-6 text-center"><input type="text" class="form-control" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>" placeholder="글제목"></div>
				<div class="col-md-3 text-right"><input type="text" class="form-control" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>" placeholder="작성자"></div>
				<input type="hidden" name="num" value="<%=article.getNum()%>">
			</div>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item text-right">
				<input type="text" class="form-control" size="40" maxlength="30" id="inputEmail" name="email" value="<%=article.getEmail()%>" placeholder="이메일">
			</li>
			<li class="list-group-item">
				<textarea class="form-control" name="content" rows="13" cols="40" placeholder="글내용"><%=article.getContent()%></textarea>
			</li>
			<li class="list-group-item">
				<label for="inputPasswd">비밀번호</label>
				<input type="password" class="form-control" id="inputPasswd" name="passwd" placeholder="비밀번호" required="required">
			</li>
		</ul>
		<div class="card-footer">
			<button type="submit" class="btn btn-dark">글수정</button>
			<button type="reset" class="btn btn-dark">글수정 취소</button>
			<button type="button" class="btn btn-dark" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">글목록</button>
		</div>
	</div>
</form>

</div>

<script src="/cban/ch13/script.js"></script>

<%
	}catch(Exception e){}
%>      
      
<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>