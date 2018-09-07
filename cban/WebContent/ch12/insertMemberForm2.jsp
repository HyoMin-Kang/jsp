<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link rel="stylesheet" href="/cban/assets/bootstrap-4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="card">
		<div class="card-body">
	    <h2 class="card-title"><i class="fas fa-edit"></i> 회원가입폼</h2>
	
		<form method="post" action="insertMemberPro.jsp">
			<div class="form-group row">
				<label for="id" class="col-sm-2 col-form-label">아이디</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id" placeholder="아이디 입력" name="id" maxlength="50" required>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="passwd" class="col-sm-2 col-form-label">패스워드</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="passwd"	placeholder="패스워드 입력" name="passwd" maxlength="16" required>
				</div>
			</div>
			
			<div class="form-group row">
				<label for="name" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name"
						placeholder="이름 입력" name="name" maxlength="10" required>
				</div>
			</div>
	
			<div class="form-group row">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary"><i class="fas fa-check-circle"></i> Sign in</button>
					<button type="reset" class="btn btn-danger"><i class="fas fa-times-circle"></i> Reset</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="/cban/assets/bootstrap-4.0.0/js/bootstrap.min.js"></script>
<script src="/cban/assets/fontawesome-free-5.0.9/svg-with-js/js/fontawesome-all.js"></script>

</body>
</html>