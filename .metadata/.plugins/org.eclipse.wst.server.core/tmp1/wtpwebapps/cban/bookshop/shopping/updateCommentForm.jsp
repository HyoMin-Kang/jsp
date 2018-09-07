<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.shopping.CommentDBBean" %>
<%@ page import = "ch14.bookshop.shopping.CommentDataBean" %>
	
<% request.setCharacterEncoding("utf-8"); %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int book_id = Integer.parseInt(request.getParameter("book_id"));

	CommentDBBean dbPro = CommentDBBean.getInstance(); 
	CommentDataBean comment =  dbPro.getComment(num);
%>
<div>
	<b><font color="blue">댓글 수정</font></b>
	<hr>
	
	<form name="updatecomment" method="post">
		<div>
			별점
			<select name="star">
				<option value="5"<%if(comment.getStar() == 5){out.print(" selected=\"selected\"");}%>>★★★★★</option>
				<option value="4"<%if(comment.getStar() == 4){out.print(" selected=\"selected\"");}%>>★★★★☆</option>
				<option value="3"<%if(comment.getStar() == 3){out.print(" selected=\"selected\"");}%>>★★★☆☆</option>
				<option value="2"<%if(comment.getStar() == 2){out.print(" selected=\"selected\"");}%>>★★☆☆☆</option>
				<option value="1"<%if(comment.getStar() == 1){out.print(" selected=\"selected\"");}%>>★☆☆☆☆</option>
			</select>
		</div>
		<div>
			내용
			<textarea rows="2" cols="40" class="form-control" name="content" maxlength="100"><%=comment.getContent() %></textarea>
		</div>
		<hr>
		<input type="button" value="취소" onclick="cancelUpdate()">
		<input type="submit" value="수정" onclick="saveUpdate()">
	</form>
</div>

<script>
	function saveUpdate() {
		opener.name='updateCmt';
		document.updatecomment.target = opener.name;
		document.updatecomment.action = 'updateCommentPro.jsp?num=<%=num%>&book_id=<%=book_id%>';
		document.updatecomment.submit();
		self.close();
	}
	function cancelUpdate() {
		self.close();
	}
</script>