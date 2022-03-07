/**
 * 
 */
$(function(){
	// 아이디 정규표현식: 아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리만 가능
	var idRegex = /^[a-z][a-z0-9]{5,12}$/;
	
	// 비밀번호 정규표현식: 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
	var pwdRegex = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; 
	
	// 비밀번호 유효성 체크
	$("#userPwd").on("keyup",function() {
		var pwd = $(this).val();
		if (!(pwdRegex.test(pwd))) {
			$("#check_pwd").text("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여 8~16자리까지만 가능합니다!!  :(").css("color", "red");
			// $("#registerBtn").attr("disabled", true);
		} else {
			$("#check_pwd").text("사용가능한 비밀번호 입니다!!  :)").css("color", "green");
		}
	});
	
	// 비밀번호 일치 확인
	$("#userPwd, #userPwdConfirm").on("keyup", function () {
		var pwd = $("#userPwd").val();
		var pwdConfirm = $("#userPwdConfirm").val();
		
		if (pwd != pwdConfirm) {
	 		$("#check_pwdConfirm").text("불일치!! :(").css("color", "red");
	 	} else if (pwd == "") {
	 		$("#check_pwdConfirm").text("");
	 	} else {
			$("#check_pwdConfirm").text("일치!! :)").css("color", "green");
	 	}
	});

	// 아이디 유효성 체크
	$("#userId").on("keyup", function() {
		var id = $(this).val();
		
		$.ajax({
			url : "/register/checkId",
			type : "post",
			data : {userId : id},
			success : function(result) {
				// 확인용: console.log("1=중복 // 0=정상 : "+ reuslt);							
				
				if (result == 1) {
					// 1 : 중복
					$("#check_id").text("사용중인 아이디입니다!!  :(").css("color", "red");
				} else {
					
					// 0 : 정상, 형식검사 시작
					if (idRegex.test(id)) {
						$("#check_id").text("사용가능한 아이디 입니다!!  :)").css("color", "green");
					} else if (id == "") {
						$("#check_id").text("아이디를 입력해주세요!!  :(").css("color", "red");
					} else if (!(idRegex.test(id))) {
						$("#check_id").text("아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(").css("color", "red");
					}
				}
						
			}, error : function() {
					console.log("실패");
				}
		});
	});
	
});
