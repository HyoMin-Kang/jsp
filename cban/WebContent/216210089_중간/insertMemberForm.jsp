<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = "Sign up";
%>

<jsp:include page="/_inc/header_inc.jsp" flush="false">
	<jsp:param name="title" value="<%=title %>"/>
</jsp:include>

<jsp:include page="/_inc/navigation.jsp" flush="false"/>

<div class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
		<h1 class="h2">Sign up</h1>
	</div>
          
	<form name="insertMember" method="post" action="insertMemberPro.jsp" onsubmit="return formSubmit();">
		<div class="form-group row">
			<label for="inputId" class="col-md-2 col-form-label">아이디</label>
			<div class="col-md-8">
				<input type="text" class="form-control" id="inputId" name="id" placeholder="Enter ID" required="required">
			</div>
			<div class="col-md-2">
				<Button type="button" class="btn btn-outline-dark btn-block" onClick="confirmId(document.getElementById('inputId'));">중복 확인</Button>
			</div>
		</div>

		<div class="form-group row">
			<label for="inputPasswd" class="col-md-2 col-form-label">비밀번호</label>
			<div class="col-md-10">
				<input type="password" class="form-control" id="inputPasswd" name="passwd" placeholder="Password" required="required">
			</div>
		</div>
 
		<div class="form-group row">
			<label for="inputName" class="col-md-2 col-form-label">이름</label>
			<div class="col-md-10">
				<input type="text" class="form-control" id="inputName" name="name" placeholder="Name" required="required">
			</div>
		</div>
		
		<div class="form-group row">
			<label class="col-md-2 col-form-label">주소</label>
			<div class="col-md-10">
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="inputPostcode" name="postcode" placeholder="Postcode" readonly="readonly">
					<div class="input-group-append">
						<button type="button" class="btn btn-outline-secondary" onclick="execDaumPostcode()">우편번호 찾기</button>
					</div>
				</div>
				<input type="text" class="form-control" id="inputAddress" name="address" placeholder="Address" required="required">
			</div>
		</div>

		<div class="form-group row">
			<label class="col-md-2 col-form-label">자동 가입 방지</label>
			<div class="col-md-10">
				<div id="html_element"></div>
			</div>
		</div>
		
		<button type="submit" class="btn btn-dark" id="checkId">Submit</button>
		<button type="reset" class="btn btn-secondary">Reset</button>
	</form>
</div>

<!-- address api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('inputPostcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('inputAddress').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('inputAddress').focus();
            }
        }).open();
    }
</script>

<!-- reCaptcha -->
<script src='https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit' async defer></script>
<script>
	var onloadCallback = function() {
		grecaptcha.render('html_element', {
	          'sitekey' : '6Ldu9VUUAAAAANn65F6UQgOt0cO2R9oTchhjmiJi'
	    });
	};
	var onReturnCallback = function() {
		var url = 'https://www.google.com/recaptcha/api/siteverify';
	};
</script>
<script>
	function formSubmit() {
		if (grecaptcha.getResponse() == '') {
			alert('자동 가입 방지 체크를 확인해주세요.');
			return false;
		} else {
			return true;
		}
	}
</script> 

<script>
function confirmId(id) {
	if(id.value.length==0) {
		alert('ID를 입력해 주세요.');
		inputId.focus();
		return false;
	}
	
	//중복 확인 새창
	url = 'idCheck.jsp?id=' + id.value;
	open(url, 'ID 중복 체크', 'height=200, width=320, menubar=no, scrollbars=no, toolbar=no, location=no, status=no, resizable=no');
}
</script>

<jsp:include page="/_inc/footer_inc.jsp" flush="false"/>