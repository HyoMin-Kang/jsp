<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 가입</title>
<link rel="stylesheet" href="/cban/assets/bootstrap-4.0.0/css/bootstrap.min.css">
</head>

<body>
<div class="container">
<form name="insertMember" method="post" action="insertMemberPro.jsp">
	<h3>회원 가입</h3>
	
	<div class="form-group row">
		<label for="inputId" class="col-md-2 col-form-label">ID</label>
		<div class="col-md-8">
			<input type="text" class="form-control" id="inputId" name="id" placeholder="Enter ID">
		</div>
		<div class="col-md-2">
			<Button type="button" class="btn btn-outline-dark btn-block" onClick="confirmId(document.getElementById('inputId'));">중복 확인</Button>
		</div>
	</div>
	
	<div class="form-group row">
		<label for="inputPasswd" class="col-md-2 col-form-label">Password</label>
		<div class="col-md-10">
			<input type="password" class="form-control" id="inputPasswd" name="passwd" placeholder="Password">
		</div>
	</div>
  
	<div class="form-group row">
		<label for="inputName" class="col-md-2 col-form-label">Name</label>
		<div class="col-md-10">
			<input type="text" class="form-control" id="inputName" name="name" placeholder="Name">
		</div>
	</div>

	<button type="submit" class="btn btn-outline-dark" id="checkId">Submit</button>
	<button type="reset" class="btn btn-outline-secondary">Reset</button>
</form>
</div>
  
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="/cban/assets/bootstrap-4.0.0/js/bootstrap.min.js"></script>
<script src="/cban/assets/fontawesome-free-5.0.9/svg-with-js/js/fontawesome-all.js"></script>

<script>
function confirmId(id) {
	if(id.value.length==0) {
		alert('ID를 입력해 주세요.');
		inputId.focus();
		return false;
	}
	
	url = 'idCheck.jsp?id=' + id.value;
	open(url, 'ID 중복 체크', 'height=200, width=300, menubar=no, scrollbars=no, toolbar=no, location=no, status=no, resizable=no');
}
</script>
</body>
</html>