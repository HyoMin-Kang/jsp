<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.CartDataBean" %>
<%@ page import = "ch14.bookshop.shopping.CartDBBean" %>
<%@ page import = "ch14.bookshop.shopping.CustomerDataBean" %>
<%@ page import = "ch14.bookshop.shopping.CustomerDBBean" %>
<%@ page import = "ch14.bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "Book Shopping Mall";
	String book_kind = request.getParameter("book_kind");
	String buyer = (String)session.getAttribute("id");
	
	List<CartDataBean> cartLists = null;
	List<String> accountLists = null;
	CartDataBean cartList = null;
	CustomerDataBean member= null;
	int number = 0;
	int total = 0;
%>

<jsp:include page="../module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<%
if(session.getAttribute("id")==null){
	response.sendRedirect("shopMain.jsp");        
}else{
	CartDBBean bookProcess = CartDBBean.getInstance();
    cartLists = bookProcess.getCart(buyer);
    
    CustomerDBBean memberProcess = CustomerDBBean.getInstance();
    member = memberProcess.getMember(buyer);
    
    BuyDBBean buyProcess = BuyDBBean.getInstance();
    accountLists = buyProcess.getAccount();
%>
<div class="container">
	<h3 class="pb-3 mb-4 font-italic border-bottom">구매하기</h3>

	<form name="inform" method="post" action="updateCart.jsp">
	<table class="table"> 
	<thead class="thead-light"> 
	  <tr> 
	    <th>번호</th> 
	    <th>책이름</th> 
	    <th>판매가격</th>
	    <th>수량</th> 
	    <th>금액</th>
	  </tr>   
	</thead>	
<%
  for(int i=0;i<cartLists.size();i++){
     cartList = cartLists.get(i);
%>
     <tr> 
       <td><%=++number %></td> 
       <td>
         <img src="/cban/imageFile/<%=cartList.getBook_image()%>" border="0" width="30" height="50" align="middle">
           <%=cartList.getBook_title()%>
       </td> 
       <td><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
       <td><%=cartList.getBuy_count()%></td> 
       <td>
          <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
          <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
      </td>
    </tr>
<%
  }
%>
  <tr>
    <td colspan="5" align="right"><b>총 구매금액 : <%=NumberFormat.getInstance().format(total)%></b></td>
  </tr>
</table>
</form>
<%} 
 %>
<br>
<form method="post" action="buyPro.jsp" name="buyinput">
<h2>주문자 정보</h2>
	<div class="form-group row">
 		<label for="inputEmail3" class="col-sm-2 col-form-label">성명</label>
	 	<div class="col-sm-10">
	 		<input type="text" class="form-control" value="<%=member.getName()%>" readonly="readonly">
	  </div>
	</div>
  
	<div class="form-group row">
	  	<label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
	  	<div class="col-sm-10">
	    	<input type="text" class="form-control" value="<%=member.getTel()%>" readonly="readonly">
  		</div>
	</div>

	<div class="form-group row">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">주소</label>
	    <div class="col-sm-10">
	    	<input type="text" class="form-control" value="<%=member.getAddress()%>" readonly="readonly">
	  	</div>
	</div>

	<div class="form-group row">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">결제 계좌</label>
	    <div class="col-sm-10">
	      <select name="account" class="form-control">
			<%
				for(int i=0;i<accountLists.size();i++){
				 String accountList = accountLists.get(i);
			%>
				<option value="<%=accountList %>"><%=accountList %></option>
			<%}%>
	      </select>
	  	</div>
	</div>
   
<h2>배송지 정보</h2>
	<div class="form-group row">
	    <label for="inputEmail3" class="col-sm-2 col-form-label">성명</label>
	    <div class="col-sm-10">
	    	<input type="text" class="form-control" name="deliveryName" value="<%=member.getName()%>">
	  	</div>
	</div>
	
	<div class="form-group row">
	   <label for="inputEmail3" class="col-sm-2 col-form-label">전화번호</label>
	   <div class="col-sm-10">
	   		<input type="text" class="form-control" name="deliveryTel" value="<%=member.getTel()%>">
	  	</div>
	</div>
	
	<div class="form-group row">
	   <label for="inputEmail3" class="col-sm-2 col-form-label">주소</label>
	   <div class="col-sm-10">
	   		<input type="text" class="form-control" name="deliveryAddress" value="<%=member.getAddress()%>">
	  	</div>
	</div>
	
	<div class="form-group">
       <input type="submit" class="btn btn-sm btn-outline-primary" value="확인" >
       <input type="button" class="btn btn-sm btn-outline-secondary" value="취소" onclick="javascript:window.location='shopMain.jsp'">   
    </div>   
  </form>
</div> <!-- /.container -->

<jsp:include page="../module/footer.jsp" flush="false"/>