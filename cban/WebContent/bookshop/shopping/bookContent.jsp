<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import = "ch14.bookshop.shopping.CommentDBBean" %>
<%@ page import = "ch14.bookshop.shopping.CommentDataBean" %>
<%@ page import = "java.text.NumberFormat" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("utf-8");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String title = "Book Shopping Mall";
	String book_kind = request.getParameter("book_kind");
	String book_id = request.getParameter("book_id");
	String id = "";
	int buy_price=0;
	
	int num = 0;
    int count = 0;
    
    String order = request.getParameter("order");
	if(order == null) {
		order = "newest";
	}
    
    List<CommentDataBean> commentList = null; 
    CommentDBBean dbPro = CommentDBBean.getInstance();
    count = dbPro.getCommentCount(Integer.parseInt(book_id));
    if (count > 0) {
    	commentList = dbPro.getComments(Integer.parseInt(book_id), order);
    }
    
	try{
	  if(session.getAttribute("id")==null)
	    id="not";
	  else
	    id= (String)session.getAttribute("id");    
	}catch(Exception e){}
%>

<%
ShopBookDataBean bookList = null;

ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
 
bookList = bookProcess.getBook(Integer.parseInt(book_id));
     
if(book_kind == null) {
	book_kind = "all";
}

%>
<%
	//상품 정보를 쿠키에 담기
	Cookie cookie = new Cookie("item"+book_id, URLEncoder.encode(bookList.getBook_title(),"UTF-8"));
	cookie.setMaxAge(60*60*24); //하루동안 쿠키 저장
	response.addCookie(cookie);
%>

<jsp:include page="../module/header.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<div class="container">
<div class="row">
<div class="col-md-8 blog-main">
<h3 class="pb-3 mb-4 font-italic border-bottom">Book details</h3>

<form name="inform" method="post" action="cartInsert.jsp">
	<div class="blog-post">
		<h3 class="blog-post-title"><b><%=bookList.getBook_title() %></b></h3>
		
	  	<table class="table">
			<tr> 
				<td rowspan="6"><img src="/cban/imageFile/<%=bookList.getBook_image()%>" border="0" width="150" height="200"></td> 
			</tr>
			<tr><td>저자 : <%=bookList.getAuthor()%></td></tr>
  				<tr><td>출판사 : <%=bookList.getPublishing_com()%></td></tr> 
			<tr><td>출판일 : <%=bookList.getPublishing_date()%></td></tr>
			<tr>
				<td>
				정가 : <%=NumberFormat.getInstance().format(bookList.getBook_price())%>원<br>
     				<%buy_price = (int)(bookList.getBook_price()*((double)(100-bookList.getDiscount_rate())/100)) ;%>
           		판매가 : <b><font color="red"><%=NumberFormat.getInstance().format((int)(buy_price))%>원</font></b>
  					</td> 
			</tr>
			<tr><td>수량 : <input type="text" size="5" name="buy_count" value="1"> 개
 <%
	if(id.equals("not")){
		if(bookList.getBook_count()==0){
 %>
        <b>일시품절</b>
<%  
		}           
	}else{ 
		if(bookList.getBook_count()==0){
%>
         <b>일시품절</b>
                           
<%}else{ %>	 
		       <input type="hidden" name="book_id" value="<%=book_id %>">
		       	<input type="hidden" name="book_image" value="<%=bookList.getBook_image()%>">
		       	<input type="hidden" name="book_title" value="<%=bookList.getBook_title() %>">
		       	<input type="hidden" name="buy_price" value="<%=buy_price %>">
		       	<input type="hidden" name="book_kind" value="<%=book_kind %>">              
				<input type="submit" class="btn btn-sm btn-outline-primary" value="장바구니에 담기">
<%	
		}
	}
%>
					<input type="button" class="btn btn-sm btn-outline-secondary" value="목록으로" onclick="javascript:window.location='list.jsp?book_kind=<%=book_kind%>'">
					<input type="button" class="btn btn-sm btn-outline-secondary" value="메인으로" onclick="javascript:window.location='shopMain.jsp'">
				</td>
			</tr>   
			<tr>
		    	<td colspan="2"><%=bookList.getBook_content()%></td>
			</tr> 
	  	</table>
	</div> <!-- /.blog-post -->
</form>
	
<div class="blog-post">
<form name="writecomment" method="post" action="writeCommentPro.jsp">
		<div>
			한줄평(<%=count %>) 
			<div class="btn-group">
			<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				정렬
			</button>
			<div class="dropdown-menu">
				<a class="dropdown-item" href="bookContent.jsp?book_id=<%=book_id%>&book_kind=<%=book_kind%>&order=newest">최신순</a>
			    <a class="dropdown-item" href="bookContent.jsp?book_id=<%=book_id%>&book_kind=<%=book_kind%>&order=highest">별점 높은 순</a>
			    <a class="dropdown-item" href="bookContent.jsp?book_id=<%=book_id%>&book_kind=<%=book_kind%>&order=lowest">별점 낮은 순</a>
			</div>
			</div>
		</div>
		<hr>

		<div class="form-group">
			<label for="inputStar">별점</label>
			<select class="form-control" name="star" id="inputStar">
				<option value="5">★★★★★</option>
				<option value="4">★★★★☆</option>
				<option value="3">★★★☆☆</option>
				<option value="2">★★☆☆☆</option>
				<option value="1">★☆☆☆☆</option>
			</select>
		</div>
		<div class="form-group">
			<label for="inputContent">내용</label>
			<textarea rows="2" class="form-control" name="content" id="inputContent" maxlength="100"></textarea>
			<small class="form-text text-muted">한줄평은 100자까지 작성이 가능합니다.</small>
		</div>
		<input type="hidden" name="writer" value="<%=id %>">
		<input type="hidden" name="ref" value="<%=book_id%>">
		<input type="submit" class="btn btn-sm btn-outline-primary align-right" value="작성"><br><br>
</form>
		
<%
if(commentList != null && commentList.size() > 0) {
	for(int i=0; i<commentList.size(); i++) {
		CommentDataBean comment = commentList.get(i);			
%>
<form name="updatecomment" method="post" action="updateCommentPro.jsp">
		<table class="table">
			<tr>
				<td><b>작성자</b></td>
				<td><%=comment.getWriter() %></td>
				<td><b>작성일</b></td>
				<td><%=sdf.format(comment.getReg_date()) %></td>
				<td><b>별점</b></td>
				<td><img src="/cban/imageFile/rating<%=comment.getStar()%>.png" width="100"></td>
<% 
		if(id.equals(comment.getWriter())) {
%>
				<td>
					<button type="button" class="btn btn-sm btn-outline-secondary" onclick="updateOpen(<%=comment.getNum()%>, <%=book_id%>);">수정</button>
					<button type="button" class="btn btn-sm btn-outline-danger" onclick="document.location.href='deleteCommentPro.jsp?book_id=<%=book_id %>&num=<%=comment.getNum()%>&id=<%=id%>'">삭제</button>
				</td>
<%
		} else {
%>
				<td>
					<button type="button" class="btn btn-sm btn-outline-secondary" disabled="disabled">수정</button>
					<button type="button" class="btn btn-sm btn-outline-danger" disabled="disabled">삭제</button>
				</td>
<%
		}
%>
			</tr>		
			<tr>
				<td colspan="7"><%=comment.getContent() %></td>
			</tr>
		</table>
<%
	}
}
%>
</form>
</div> <!-- /.blog-post -->


</div> <!-- /.blog-main -->
<jsp:include page="../module/side.jsp" flush="false" /> <!-- aside -->
</div> <!-- /.row -->

</div> <!-- /.container -->

<script>
function updateOpen(comment_num, book_id) {
	url = 'updateCommentForm.jsp?num=' + comment_num + '&book_id=' + book_id;
	window.open(url, '댓글 수정', 'height=200, width=400, scrollbars=no, resizable=no');
}
</script>
<jsp:include page="../module/footer.jsp" flush="false"/>