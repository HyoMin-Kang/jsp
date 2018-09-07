<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.BuyDataBean" %>
<%@ page import = "ch14.bookshop.shopping.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	String title = "Book Shopping Mall";
	String buyer = (String)session.getAttribute("id");
	
	List<BuyDataBean> buyLists = null;
	BuyDataBean buyList = null;
	int count = 0;
	int number = 0;
	int total = 0;
	long compareId=0;
	long preId=0;
%>

<jsp:include page="../module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<%
if(session.getAttribute("id")==null){
   response.sendRedirect("shopMain.jsp");        
}else{
   BuyDBBean buyProcess = BuyDBBean.getInstance();
   count = buyProcess.getListCount(buyer);

   if(count == 0){
%>
	<div class="container">
	  <h3 class="pb-3 mb-4 font-italic border-bottom">구매 목록</h3>
	  <div class="alert alert-primary" role="alert">구매한 목록이 없습니다.</div>
	  <input type="button" class="btn btn-sm btn-outline-secondary" value="메인으로" onclick="javascript:window.location='shopMain.jsp'">
	</div>
<%
  }else{ //count != 0
    buyLists = buyProcess.getBuyList(buyer);
%>
	<div class="container">
	  <h3 class="pb-3 mb-4 font-italic border-bottom">구매 목록</h3>
	<table class="table"><tr><td>
<%
    for(int i=0;i<buyLists.size();i++){
       buyList = buyLists.get(i);
    	 
		if(i<buyLists.size()-1){
    	  BuyDataBean compare = buyLists.get(i+1);
    	  compareId = compare.getBuy_id();
    		 
    	  BuyDataBean pre = buyLists.get(buyLists.size()-2);
    	  preId = pre.getBuy_id();
		}  	 
%>
   <table class="table"> 
   		<colgroup>
   			<col>
   			<col>
   			<col>
   			<col>
   			<col>
   		</colgroup>
		<thead class="thead-light"> 
			<tr>
			   <th style="text-align: center">번호</th>
			   <th>책이름</th> 
			   <th>판매가격</th>
			   <th>수량</th> 
			   <th>금액</th>
			</tr>
		</thead>
		<tr> 
			<td><%=buyList.getBuy_id()%></td> 
			<td align="left">
		   		<img src="/cban/imageFile/<%=buyList.getBook_image()%>" border="0" width="30" height="50" align="middle">
				<%=buyList.getBook_title()%>
			</td> 
			<td><%=NumberFormat.getInstance().format(buyList.getBuy_price())%>원</td>
			<td><%=buyList.getBuy_count()%></td> 
			<td>
			   <%total += buyList.getBuy_count()*buyList.getBuy_price();%>
				<%=NumberFormat.getInstance().format(buyList.getBuy_count()*buyList.getBuy_price()) %>원
		 	</td>
		</tr>
<%
    if(buyList.getBuy_id() != compareId || (i == buyLists.size()-1) && preId != buyList.getBuy_id()) {
%> 
      <tr>
       <td colspan="5" align="right">
         <b>총 금액 : <%=NumberFormat.getInstance().format(total)%>원</b></td>
      </tr>
     </table>
<% 
      compareId = buyList.getBuy_id();
       total = 0;
   }else{
%>
	</td></tr></table>
<%
   }
 } //end of for
%>
<input type="button" class="btn btn-sm btn-outline-secondary" value="메인으로" onclick="javascript:window.location='shopMain.jsp'">
</div> <!-- /.container -->
<%
 } //end of else
}
%>

<jsp:include page="../module/footer.jsp" flush="false"/>
