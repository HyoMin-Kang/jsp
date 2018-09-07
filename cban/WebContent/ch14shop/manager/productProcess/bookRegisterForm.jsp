<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "상품 등록";
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
			response.sendRedirect("../logon/managerLoginForm.jsp");
	 	}else{
%>

<jsp:include page="/_inc/header_inc2.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
	<form method="post" name="writeform" action="bookRegisterPro.jsp"  enctype="multipart/form-data">
		<div><a href="../managerMain.jsp"> 관리자 메인으로</a></div>
		
		<div class="form-group row">
			<label for="book_kind" class="col-sm-2 col-form-label">분류</label>
			<div class="col-sm-4">
	    		<select class="form-control" id="book_kind" name="book_kind">
					<option value="100">문학</option>
					<option value="200">외국어</option>
					<option value="300">컴퓨터</option>
	    		</select>
	  		</div>
		</div>
		<div class="form-group row">
			<label for="book_title" class="col-sm-2 col-form-label">제목</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" id="book_title" name="book_title" maxlength="100">
			</div>
		</div>
		<div class="form-group row">
			<label for="book_price" class="col-sm-2 col-form-label">가격</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="book_price" name="book_price" maxlength="11">
				<div class="input-group-append">
		        	<label class="input-group-text" for="book_price">원</label>
		        </div>
			</div>
		</div>
		<div class="form-group row">
			<label for="book_count" class="col-sm-2 col-form-label">수량</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="book_count" name="book_count" maxlength="6">
				<div class="input-group-append">
		        	<label class="input-group-text" for="book_count">권</label>
		        </div>
			</div>
		</div>
		<div class="form-group row">
			<label for="author" class="col-sm-2 col-form-label">저자</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="author" name="author" maxlength="40">
			</div>
		</div>
		<div class="form-group row">
			<label for="publishing_com" class="col-sm-2 col-form-label">출판사</label>
			<div class="col-sm-4">
				<input type="text" class="form-control" id="publishing_com" name="publishing_com" maxlength="30">
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
		             <option value="<%=i %>"><%=i %></option>
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
		             <option value="<%=i %>"><%=i %></option>
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
		             <option value="<%=i %>"><%=i %></option>
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
				<input type="file" class="form-control" id="book_image" name="book_image">
			</div>
		</div>
		<div class="form-group row">
			<label for="book_content" class="col-sm-2 col-form-label">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" id="book_content" name="book_content" rows="13" cols="40"></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label for="discount_rate" class="col-sm-2 col-form-label">할인율</label>
			<div class="input-group col-sm-4">
				<input type="text" class="form-control" id="discount_rate" name="discount_rate" maxlength="4">
				<div class="input-group-append">
		        	<label class="input-group-text" for="discount_rate">%</label>
		        </div>
			</div>
		</div>
		<div class="form-group">      
			<input type="button" class="btn btn-primary" value="책등록" onclick="checkForm(this.form)">
			<input type="reset" class="btn btn-secondary" value="다시작성">
		</div>
	</form>      
</div>

<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>

<% 
	}
} catch(Exception e){ e.printStackTrace(); }
%>