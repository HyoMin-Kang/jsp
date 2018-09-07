<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Write";
	
	String id = (String)session.getAttribute("id");
%>
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

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>

<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<form method="post" name="writeForm" action="boardWritePro.jsp" onsubmit="return writeSave(this)" enctype="multipart/form-data">
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="re_step" value="<%=re_step%>">
		<input type="hidden" name="re_level" value="<%=re_level%>">
		
		<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
			<h1 class="h2">Write</h1>
			<div class="btn-toolbar mb-2 mb-md-0">
				<a href="board.jsp" class="btn btn-sm btn-secondary">글목록</a>
			</div>
		</div>
		
		<table class="table table-bordered">
			<tr>
				<td>제목 <small style="color:red;">*</small></td>
				<td>
				<%
					if(request.getParameter("num")==null) {
						strV = "";
					} else {
						strV = "[답변] ";
					}
    			%>
    				<input type="text" class="form-control" name="subject" value="<%=strV%>" placeholder="제목 입력" required="required">
    			</td>
				<td>카테고리 <small style="color:red;">*</small></td>
				<td>
					<select class="form-control" name="category" required="required">
						<option value="">선택하세요...</option>
						<option value="자유글">자유글</option>
						<option value="질문글">질문글</option>
						<option value="정보글">정보글</option>
					</select>
				</td>
				
			</tr>
			
			<tr>
				<td>작성자 <small style="color:red;">*</small></td>
				<td><input type="text" class="form-control" name="writer" placeholder="이름 입력" required="required" value="<%=id%>" readonly="readonly"></td>
				<td>이메일</td>
				<td><input type="text" class="form-control" name="email" placeholder="이메일 입력" ></td>
			</tr>
			
			<tr>
				<td>내용 <small style="color:red;">*</small></td>
				<td colspan="3"><textarea class="form-control" name="content" rows="13" cols="40" required="required"></textarea></td>
			</tr>
			
			<tr>
				<td>첨부파일</td>
				<td><input type="file" class="form-control" name="file" accept="image/*"></td>
				<td>비밀번호 <small style="color:red;">*</small></td>
				<td><input type="password" class="form-control" maxlength="12" name="passwd" placeholder="최소 4자리 이상 입력해 주십시오." required="required"></td>
			</tr>
		</table>
		
		<div class="text-center">
			<button type="submit" class="btn btn-dark">글쓰기</button>		
			<button type="reset" class="btn btn-secondary">초기화</button>	
		</div>		
				
	</form>
</div>
<%
	}catch(Exception e){}
%>     

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>