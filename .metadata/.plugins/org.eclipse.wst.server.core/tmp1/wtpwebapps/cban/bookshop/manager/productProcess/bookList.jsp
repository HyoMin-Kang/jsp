<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "등록된 책 목록";
	String managerId ="";
	try{
		managerId = (String)session.getAttribute("managerId");
		if(managerId==null || managerId.equals("")){
	       response.sendRedirect("../logon/managerLoginForm.jsp");
		}else{
%> 

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    List<ShopBookDataBean> bookList = null; 
    int number =0;
    String book_kind="";
    
    book_kind = request.getParameter("book_kind");
 
    ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
    int count = bookProcess.getBookCount();
    
    if (count > 0) {
    	bookList = bookProcess.getBooks(book_kind);
    }
%>

<jsp:include page="/_inc/header_inc2.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<%
   String book_kindName="";
if(book_kind.equals("100"))
	book_kindName="건강 취미";
 else if(book_kind.equals("110"))
	book_kindName="경제 경영";  
 else if(book_kind.equals("120"))
	book_kindName="문학";
 else if(book_kind.equals("130"))
	book_kindName="사회 정치";
 else if(book_kind.equals("140"))
	book_kindName="자기계발";
 else if(book_kind.equals("150"))
	book_kindName="자연과학";
 else if(book_kind.equals("160"))
	book_kindName="참고서";
 else if(book_kind.equals("200"))
	book_kindName="문학 소설"; 
 else if(book_kind.equals("110"))
	book_kindName="경제 경영";  
 else if(book_kind.equals("120"))
	book_kindName="인문 사회";
 else if(book_kind.equals("130"))
	book_kindName="예술 대중문화";
 else if(book_kind.equals("140"))
	book_kindName="취미 라이프스타일";
 else if(book_kind.equals("150"))
	book_kindName="컴퓨터";
 else if(book_kind.equals("160"))
	book_kindName="자연과학";
 else if(book_kind.equals("all"))
	book_kindName="전체";
 else if(book_kind.equals("kor"))
	book_kindName="국내 도서";
 else if(book_kind.equals("foreign"))
	book_kindName="외국 도서";
%>
<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<p><%=book_kindName%> 분류의 목록: 
<%if(book_kind.equals("all")){%> 
    <%=count%>개
<%}else{%>
    <%=bookList.size() %>개
<%} %>
</p>
<table>
<tr>
    <td align="right">
       <a href="bookRegisterForm.jsp">책 등록</a>
    </td>
</table>

<%
  if (count == 0) {
%>
<table>
<tr>
   <td align="center">
           등록된 책이 없습니다.
   </td>
</table>

<%} else {%>
<table class="table"> 
	<colgroup>
	  	<col width="4%">
	  	<col width="4%">
	  	<col width="*%">
	  	<col width="4%">
	  	<col width="4%">
	  	<col width="8%">
	  	<col width="12%">
	  	<col width="8%">
	  	<col width="6%">
	  	<col width="4%">
	  	<col width="8%">
	  	<col width="4%">
	  	<col width="4%">
	</colgroup>      
	
	<thead class="table-dark">
	    <tr> 
	      <th scope="col">번호</th> 
	      <th scope="col">책분류</th> 
	      <th scope="col">제목</th>
	      <th scope="col">가격</th> 
	      <th scope="col">수량</th> 
	      <th scope="col">저자</th>
	      <th scope="col">출판사</th>
	      <th scope="col">출판일</th>
	      <th scope="col">책이미지</th>
	      <th scope="col">할인율</th>
	      <th scope="col">등록일</th>
	      <th scope="col">수정</th>
	      <th scope="col">삭제</th>         
	    </tr>
    </thead>
<%  
    for (int i = 0 ; i <bookList.size() ; i++) {
      ShopBookDataBean book = 
    		  (ShopBookDataBean)bookList.get(i);
%>
   <tr>
      <td><%=++number%></td> 
      <td><%=book.getBook_kind()%></td> 
      <td>
           <%=book.getBook_title()%></td>
      <td><%=book.getBook_price()%></td> 
      <td>
      <% if(book.getBook_count()==0) {%>
         <font color="red"><%="일시품절"%></font>
      <% }else{ %>
         <%=book.getBook_count()%>
      <%} %>
      </td> 
      <td><%=book.getAuthor()%></td>
      <td><%=book.getPublishing_com()%></td>
      <td><%=book.getPublishing_date()%></td>
      <td><%=book.getBook_image()%></td>
      <td><%=book.getDiscount_rate()%></td>
      <td><%=sdf.format(book.getReg_date())%></td>
      <td>
         <a class="btn btn-sm btn-warning" href="bookUpdateForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">수정</a></td>
      <td>
         <a class="btn btn-sm btn-danger" href="bookDeleteForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>">삭제</a></td>    
   </tr>
<%}%>
</table>
<%}%>

<jsp:include page="/_inc/footer_inc2.jsp" flush="false"/>

<% 
   }
}catch(Exception e){
   e.printStackTrace();
}
%>