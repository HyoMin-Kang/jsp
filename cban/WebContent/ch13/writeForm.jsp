<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String title = "답글 작성";
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<% 
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  String strV = "";
  try{
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
	   ref=Integer.parseInt(request.getParameter("ref"));
	   re_step=Integer.parseInt(request.getParameter("re_step"));
	   re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>

<div class="container">
<h3><i class="fas fa-list-ol"></i> 글쓰기</h3>

<a class="btn btn-primary btn-sm" href="list.jsp" role="button"><i class="fas fa-pencil-alt"></i> 글목록</a>

<form class="form" method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<input type="hidden" name="re_step" value="<%=re_step%>">
	<input type="hidden" name="re_level" value="<%=re_level%>">
	
	<div class="card">
		<div class="card-header">
			<div class="row">
				<div class="col-md-6 offset-md-3 text-center">
						<%
							if (request.getParameter("num") == null)
									strV = "";
							else
									strV = "[답변] ";
						%>
						<input type="text" class="form-control"  size="40" maxlength="50" name="subject" value="<%=strV%>"  placeholder="글제목">
				</div>
				<div class="col-md-3 text-right"><input type="text" class="form-control" size="10" maxlength="10" name="writer" placeholder="작성자"></div>
			</div>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item text-right">
				<input type="text" class="form-control" size="40" maxlength="30" id="inputEmail" name="email" placeholder="이메일">
			</li>
			<li class="list-group-item">
				<textarea class="form-control" name="content" rows="13" cols="40" placeholder="글내용"></textarea>
			</li>
			<li class="list-group-item">
				<label for="inputPasswd">비밀번호</label>
				<input type="password" class="form-control" id="inputPasswd" name="passwd" placeholder="비밀번호" required="required">
			</li>
		</ul>
		<div class="card-footer">
			<button type="submit" class="btn btn-dark">글쓰기</button>
			<button type="reset" class="btn btn-dark">다시 작성</button>
			<button type="button" class="btn btn-dark" OnClick="window.location='list.jsp'">글목록</button>
		</div>
	</div>
</form>

</div>    

<script src="/cban/ch13/script.js"></script>

 <%
	}catch(Exception e){}
%>     

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>