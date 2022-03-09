/**
 * 회원가입 페이지 유효성검사 스크립트
 */

// 아이디 정규표현식: 아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리만 가능
const idRegexp = /^[a-z][a-z0-9]{5,12}$/;

// 비밀번호 정규표현식: 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합
const pwdRegexp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/; 

var isTrue;

function registerForm_check() {
    if (check_id() != true) { // 아이디 검사
        alert("[아이디 입력 오류] 올바른 아이디를 입력해 주세요.");
        $("#userId").focus();
        return false;
    }
 	if (check_pwd() != true) { // 비밀번호 검사
        alert("[비밀번호 입력 오류] 올바른 비밀번호를 입력해 주세요.");
        $("#userPwd").focus();
        return false;
    }
	if (check_pwdConfirm() != true) { // 비밀번호 일치검사
        alert("[비밀번호 확인 오류] 비밀번호가 일치하지 않습니다. 확인해주세요.");
        $("#userPwdConfirm").focus();
        return false;
    }
	/*
	if (re_url.test(url.val()) != true) { // URL 검사
        alert("[이름 입력 오류] 올바른 이름을 입력해 주세요.");
        url.focus();
        return false;
    } 
	if (re_mail.test(mail.val()) != true) { // 이메일 검사
        alert("[Email 입력 오류] 올바른 이메일 주소를 입력해 주세요.");
        mail.focus();
        return false;
    } 
	
	if (re_tel.test(tel.val()) != true) { // 전화번호 검사
        alert("[Tel 입력 오류] 올바른 전화번호를 입력해 주세요.");
        tel.focus();
        return false;
    }
	*/

	$("#userRegisterForm").submit();
}

function check_id() {
	const id = $("#userId").val();
	$.ajax({
		url : "/register/checkId",
		type : "post",
		data : {userId : id},
		async: false, // 동기식으로 변경, 응답을 모두 완료한 후 
		success : function(result) {
			// 확인용: console.log("1=중복 // 0=정상 : "+ reuslt);							
			// 1 : 중복
			if (result == 1) {
				$("#check_id").text("사용중인 아이디입니다!!  :(").css("color", "red");
				isTrue = false;
			} else {
				// 0 : 정상, 형식검사 시작
				if (!(idRegexp.test(id))) {
					$("#check_id").text("아이디는 영문으로 시작하여, 소문자와 숫자를 사용해 6~12자리까지만 가능합니다!! :(").css("color", "red");
					isTrue = false;
				}
				if (idRegexp.test(id)) {
					$("#check_id").text("사용가능한 아이디 입니다!!  :)").css("color", "green");
					isTrue = true;
				}
				if (id == "") {
					$("#check_id").text("아이디를 입력해주세요!!  :(").css("color", "red");
					isTrue = false;
				}
			}
		}, error : function() {
				console.log("실패");
		}
	});
	
	return isTrue;						
}

function check_pwd() {
	const pwd = $("#userPwd").val();
	if (!(pwdRegexp.test(pwd))) {
		$("#check_pwd").text("8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합하여 8~16자리까지만 가능합니다!!  :(").css("color", "red");
		isTrue = false;
	} 
	if (pwdRegexp.test(pwd)) {
		$("#check_pwd").text("사용가능한 비밀번호 입니다!!  :)").css("color", "green");
		isTrue = true;
	}
	if (pwd == "") {
		$("#check_pwd").text("비밀번호를 입력해주세요!!  :(").css("color", "red");
		isTrue = false;
	}
	
	return isTrue;
}

function check_pwdConfirm() {
	const pwd = $("#userPwd").val();
	const pwdConfirm = $("#userPwdConfirm").val();
	if (pwd != pwdConfirm) {
 		$("#check_pwdConfirm").text("불일치!! :(").css("color", "red");
		isTrue = false;
 	} else {
		$("#check_pwdConfirm").text("일치!! :)").css("color", "green");
		isTrue = true;
 	}

	return isTrue;
}

$(function(){
	// 아이디 유효성 체크
	$("#userId").on("keyup", function() {
		check_id();
		console.log(check_id());
	});
	
	// 비밀번호 유효성 체크
	$("#userPwd").on("keyup",function() {
		check_pwd();
		console.log("체크:" + check_pwd());
	});
	
	// 비밀번호 일치 확인
	$("#userPwdConfirm").on("keyup", function () {
		check_pwdConfirm();
		console.log("확인:" + check_pwdConfirm());
	});
});