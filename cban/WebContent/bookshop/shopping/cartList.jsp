<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.CartDataBean" %>
<%@ page import = "ch14.bookshop.shopping.CartDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "Book Shopping Mall";
	String book_kind = request.getParameter("book_kind");
	String buyer = (String)session.getAttribute("id");
	
	List<CartDataBean> cartLists = null;
	CartDataBean cartList = null;
	int count = 0;
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
   count = bookProcess.getListCount(buyer);

   if(count == 0){
%>

<div class="container">
   <h3 class="pb-3 mb-4 font-italic border-bottom">장바구니</h3>
   <div class="alert alert-primary" role="alert">장바구니에 담긴 물품이 없습니다.</div>
   <input type="button" class="btn btn-sm btn-outline-secondary" value="쇼핑계속" onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
</div>
<%
   }else{
     cartLists = bookProcess.getCart(buyer);
 %>
 <div class="container">
   <form name="cartform">
   <div class="blog-main">
   <h3 class="pb-3 mb-4 font-italic border-bottom">장바구니</h3>
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
     cartList = (CartDataBean)cartLists.get(i);
%>
     
     <tr> 
       <td width="50"><%=++number %></td> 
       <td  width="300" align="left">
         <img src="/cban/imageFile/<%=cartList.getBook_image()%>" border="0" width="30" height="50" align="middle">
             <%=cartList.getBook_title()%>
       </td> 
       <td width="100"><%=NumberFormat.getInstance().format(cartList.getBuy_price())%></td>
       <td width="150">
          <input type="text" name="buy_count" size="5" value="<%=cartList.getBuy_count()%>">
		<% 
			String url = "updateCartForm.jsp?cart_id="+cartList.getCart_id()+"&book_kind="+book_kind + "&buy_count="+cartList.getBuy_count();
		%>
          <input type="button" class="btn btn-sm btn-outline-secondary" value="수정" onclick="javascript:window.location='<%=url%>'">
       </td> 
       <td align="center"  width="150">
          <%total += cartList.getBuy_count()*cartList.getBuy_price();%>
            <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getBuy_price()) %>
          <input type="button" class="btn btn-sm btn-outline-secondary" value="삭제" onclick="javascript:window.location='cartListDel.jsp?list=<%=cartList.getCart_id()%>&book_kind=<%=book_kind%>'">
       </td>
     </tr>
<%}%>
     <tr>
       <td colspan="5" align="right"><b>총 금액 : <%=NumberFormat.getInstance().format(total)%></b></td>
     </tr>
     <tr>
       <td colspan="5">
         <input type="button" class="btn btn-sm btn-outline-primary" value="구매하기" onclick="javascript:window.location='buyForm.jsp'">
         <input type="button" class="btn btn-sm btn-outline-secondary" value="쇼핑계속" onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
         <input type="button" class="btn btn-sm btn-outline-secondary" value="장바구니비우기" onclick="javascript:window.location='cartListDel.jsp?list=all&book_kind=<%=book_kind%>'">
       </td>
     </tr>
   </table>
   </div> <!-- /.blog-main -->
   </form>
</div>
<%
  } 
}
%>

<jsp:include page="../module/footer.jsp" flush="false"/>