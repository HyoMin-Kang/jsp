<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "책 수정";
	String managerId ="";
	try{
	   managerId = (String)session.getAttribute("managerId");
	   if(managerId==null || managerId.equals("")){
	      response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
%>
<%
	int book_id = Integer.parseInt(request.getParameter("book_id"));
	String book_kind = request.getParameter("book_kind");
	try{
		ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
	    ShopBookDataBean book =  bookProcess.getBook(book_id); 
%>

<jsp:include page="/_inc/header_inc2.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
	<form method="post" name="writeform" action="bookUpdatePro.jsp"  enctype="multipart/form-data">
		<div>
			<a href="../managerMain.jsp"> 관리자 메인으로</a>
		    <a href="bookList.jsp?book_kind=<%=book_kind%>">목록으로</a>
	    </div>
		    
	  <div class="form-group row">
			<label for="book_kind" class="col-sm-2 col-form-label">분류</label>
			<div class="col-sm-4">
	    		<select class="form-control" id="book_kind" name="book_kind">
					<option value="100" <%if (book.getBook_kind().equals("100")) {%>selected<%} %>>문학</option>
					<option value="200" <%if (book.getBook_kind().equals("200")) {%>selected<%} %>>외국어</option>
					<option value="300" <%if (book.getBook_kind().equals("300")) {%>selected<%} %>>컴퓨터</option>
	    		</select>
	  		</div>
		</div>
		<div class="form-group row">
			<label for="book_title" class="col-sm-2 col-form-label">제목</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="book_title" name="book_title" maxlength="100" value="<%=book.getBook_title() %>">
				<input type="hidden" name="book_id" value="<%=book_id%>">
			</div>
		</div>
		<div class="form-group row">
			<label for="book_price" class="col-sm-2 col-form-label">가격</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="book_price" name="book_price" maxlength="11" value="<%=book.getBook_price() %>">
				<div class="input-group-append">
		        	<label class="input-group-text" for="book_price">원</label>
		        </div>
			</div>
		</div>
		<div class="form-group row">
			<label for="book_count" class="col-sm-2 col-form-label">수량</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="book_count" name="book_count" maxlength="6" value="<%=book.getBook_count() %>">
				<div class="input-group-append">
		        	<label class="input-group-text" for="book_count">권</label>
		        </div>
			</div>
		</div>
		<div class="form-group row">
			<label for="author" class="col-sm-2 col-form-label">저자</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="author" name="author" maxlength="40" value="<%=book.getAuthor()%>">
			</div>
		</div>
		<div class="form-group row">
			<label for="publishing_com" class="col-sm-2 col-form-label">출판사</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="publishing_com" name="publishing_com" maxlength="30" value="<%=book.getPublishing_com() %>">
			</div>
		</div>
		<div class="form-group row">
			<label for="publishing_year" class="col-sm-2 col-form-label">출판일</label>
			<div class="input-group col-sm-2">
				<select id="publishing_year" name="publishing_year" class="form-control">
		        <%
		        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
		        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
		           for(int i=lastYear;i>=2010;i--){
		        %>
		             <option value="<%=i %>" <%if (Integer.parseInt(book.getPublishing_date().substring(0,4))==i) {%>selected<%} %>><%=i %></option>
		        <%} %>
		        </select>
		        <div class="input-group-append">
		        	<label class="input-group-text" for="publishing_year">년</label>
		        </div>
	        </div>

			<div class="input-group col-sm-2">	        
		        <select id="publishing_month" name="publishing_month" class="form-control">
		        <%
		           for(int i=1;i<=12;i++){
		        %>
		             <option value="<%=i %>" <%if (Integer.parseInt(book.getPublishing_date().substring(5,7))==i) {%>selected<%} %>><%=i %></option>
		        <%} %>
		        </select>
				<div class="input-group-append">
		        	<label class="input-group-text" for="publishing_month">월</label>
		        </div>
        	</div>
        	
	        <div class="input-group col-sm-2">
		        <select id="publishing_day" name="publishing_day" class="form-control">
		        <%
		           for(int i=1;i<=31;i++){
		        %>
		             <option value="<%=i %>" <%if (Integer.parseInt(book.getPublishing_date().substring(8))==i) {%>selected<%} %>><%=i %></option>
		        <%} %>
		        </select>
				<div class="input-group-append">
		        	<label class="input-group-text" for="publishing_day">일</label>
		        </div>	    
		    </div>
		</div>
		<div class="form-group row">
			<label for="book_image" class="col-sm-2 col-form-label">이미지</label>
			<div class="col-sm-4">
				<input type="file" class="form-control" id="book_image" name="book_image"><%=book.getBook_image() %>
			</div>
		</div>
		<div class="form-group row">
			<label for="book_content" class="col-sm-2 col-form-label">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="book_content" name="book_content" rows="13" cols="40"><%=book.getBook_content() %></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label for="discount_rate" class="col-sm-2 col-form-label">할인율</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="discount_rate" name="discount_rate" maxlength="4" value="<%=book.getDiscount_rate() %>">
				<div class="input-group-append">
		        	<label class="input-group-text" for="discount_rate">%</label>
		        </div>
			</div>
		</div>
		<div class="form-group">      
			<input type="button" class="btn btn-warning" value="책수정" onclick="updateCheckForm(this.form)">  
	  		<input type="reset" class="btn btn-secondary" value="다시작성">
		</div>
	</form>   
</div>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>         

<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>

<% 
  }
}catch(Exception e){
	e.printStackTrace();
}
%>