<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/jstlHeader.jsp"%>
<%@ include file="/WEB-INF/views/view/boardpage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<script type="text/javascript">
	function membersUpdateCheck() {

		var password = $("#password").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		var userId = $("#userId").val();

		if (!password) {
			alert("비밀번호입력은 필수입니다.");
			$("#password").focus();
			return false;
		} else if (!phone) {
			alert("전화번호 입력은 필수 입니다.");
			$("#phone").focus();
			return false;

		} else {
			membersUpdate(password, phone, email, userId);
		}

	}

	function membersUpdate(password, phone, email, userId) {

		$.ajax({

			url : "/jquery/membersUpdate",
			type : 'POST',
			data : {
				password : password,
				phone : phone,
				email : email,
				userId : userId

			},
			success : function(data) {

				if (data == 1) {
					alert("회원정보 수정이 완료되었습니다.");
					location.href = "/view/dashboard";
				} else {

					alert("글 수정 실패");

				}
			},
			error : function() {
				console.log("error");
			}

		})

	}
</script>
</head>
<body>
<body style="background-color: ffffff">
	<form id="registerform">

		회원정보 수정


		<div class="fieldlabel">
			<label for="password">*패스워드</label>
		</div>
		<div class="formfield">
			<input type="password" id="password" name="password" maxlength="20"
				autocomplete="off">
		</div>










		<div class="fieldlabel">
			<label for="phone">*전화번호</label>
		</div>
		<div class="formfield">
			<input type="text" value="${result.phone}" id="phone" name="phone"
				maxlength="20" value="">
		</div>

		<div class="fieldlabel">
			<label for="email">*이메일</label>
		</div>
		<div class="formfield">
			<input type="text" value="${result.email}" id="email" name="email"
				size="20" maxlength="20" value="" autocomplete="off">
		</div>
		<input type="hidden" name="userId" id="userId"
			value="${result.userId}">





		<div class="btnfield">
			<input type="button" value="수정" onclick="membersUpdateCheck()" /> 
			<input type="button" value="메인으로" onclick="javascript:location.href='dashboard'"  />

		</div>
	</form>
</body>
</html>