<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>회원 가입</title>
<script type="text/javascript">
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function address() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('addr1').value = data.zonecode;
						document.getElementById("addr2").value = roadAddr;
						document.getElementById("addr4").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("addr3").value = extraRoadAddr;
						} else {
							document.getElementById("addr5").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}

	function signUpValidation() {

		var userId = $("#userId").val();
		var password = $("#password").val();
		var userPwCheck = $("#passwordCheck").val();
		var nickName = $("#nickname").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var gender = $("#gender").val();
		var birth = $("#birth").val();
		var name = $("#name").val();
		if (!userId) {
			alert("아이디 입력은 필수입니다.");
			$("#userId").focus();
		} else if (!password) {
			alert("비밀번호 입력은 필수입니다.");
			$("#password").focus();
		} else if (!userPwCheck) {
			alert("비밀번호 확인 입력은 필수입니다.");
			$("#passwordCheck").focus();
		} else if (password != userPwCheck) {
			alert("비밀번호가 맞지 않습니다.");
			$("#userPwCheck").focus();
		} else if (!nickName) {
			alert("별명 입력은 필수입니다.");
			$("#nickname").focus();
		} else if (!email) {
			alert("이메일 입력은 필수입니다.");
			$("#email").focus();
		} else {
			signUp()
		}

	}

	function signUp() {

		$.ajax({

			url : "/jquery/signUp",
			type : 'POST',
			data : $("#registerform").serialize(),
			success : function(data) {
				if (data == 1) {
					alert("회원가입이 완료됐습니다.^^");
					location.href = "/user/login"
				} else if (data == 2) {
					alert("이미 존재하는 아이디입니다.");
					return false;
				} else if (data == 3) {
					alert("이미 존재하는 별명입니다.");
					return false;
				}
			}

		})
	}
</script>
</head>
<body style="background-color: ffffff">
	<form id="registerform">
		<div class="fieldlabel">
			<label for="name">*이름</label>
		</div>
		<div class="formfield">
			<input type="text" id="name" name="name" maxlength="20" value="">
		</div>

		<div class="fieldlabel">
			<label for="userId">*아이디</label>
		</div>
		<div class="formfield">
			<input type="text" id="userId" name="userId" maxlength="20" value="">
		</div>



		<div class="fieldlabel">
			<label for="password">*패스워드</label>
		</div>
		<div class="formfield">
			<input type="password" id="password" name="password" maxlength="20"
				autocomplete="off">
		</div>

		<div class="fieldlabel">
			<label for="passwordCheck">패스워드확인</label>
		</div>
		<div class="formfield">

			<input type="password" id="passwordCheck" name="passwordCheck"
				maxlength="20" autocomplete="off">
		</div>



		<div class="fieldlabel">
			<label for="nickname">*별명</label>
		</div>
		<div class="formfield">
			<input type="text" id="nickname" name="nickname" maxlength="20"
				value="">
		</div>

		<div class="fieldlabel">
			<label for="address">*주소</label>
		</div>
		<div class="formfield">
			<input type="text" id="nickname" name="nickname" maxlength="20"
				value="">

		</div>
		<div class="formfield">
			<input class="form-control" style="width: 30%; display: inline;"
				placeholder="우편번호" name="addr1" id="addr1" type="text"
				readonly="readonly">
			<button type="button"  class="btn btn-default"
				onclick="address();">
				<i class="fa fa-search"></i> 우편번호 찾기 
			</button>
		</div>
		<div class="formfield">
			<input class="form-control" style="width: 30%; display: inline;" placeholder="도로명 주소"
				name="addr2" id="addr2" type="text" readonly="readonly" />
		</div>
		<div class="formfield">
			<input class="form-control" style="width: 30%; display: inline;" placeholder="상세주소" name="addr3"
				id="addr3" type="text" />
		</div>

		<div class="fieldlabel">
			<label for="phone">*전화번호</label>
		</div>
		<div class="formfield">
			<input type="text" id="phone" name="phone" maxlength="20" value="">
		</div>

		<div class="fieldlabel">
			<label for="email">*이메일</label>
		</div>
		<div class="formfield">
			<input type="text" id="email" name="email" size="20" maxlength="20"
				value="" autocomplete="off"><span>@</span> <input
				id="domain" list="domains" name="domain" placeholder="도메인입력/선택">
			<datalist id="domains">
				<option value="naver.com">
				<option value="daum.net">
				<option value="gmail.com">
				<option value="yahoo.co.kr">
			</datalist>
		</div>

		<div class="fieldlabel">
			<label for="gender">*성별</label>
		</div>
		<div class="formfield">
			<input type="radio" id="male" name="gender" value="1"> <label
				for="male">남성</label><br> <input type="radio" id="female"
				name="gender" value="0"> <label for="female">여성</label><br>

		</div>

		<div class="fieldlabel">
			<label for="birth">*생년월일</label>
		</div>
		<div class="formfield">
			<input type="text" id="birth" name="birth" maxlength="20" value="">
		</div>



		<div class="btnfield">
			<input type="button" onclick="signUpValidation()" value="회원가입">
		</div>
	</form>
</body>
</html>