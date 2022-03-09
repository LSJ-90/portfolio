/**
 * 카카오로그인 스크립트
 */
$(function() {
	// 카카오 로그인 버튼을 클릭할 때 실행할 이벤트 핸들러 함수를 등록한다.
	$('#btn-kakao-login').click(function(event){
		// a태그는 클릭이벤트가 발생하면 페이지를 이동하는 기본동작이 수행되는데, 그 기본동작이 실행되지 않게 한다.
		event.preventDefault();
		// 카카오 로그인 실행시 오류메세지를 표시하는 경고창을 화면에 보이지 않게 한다.
		$("#alert-kakao-login").addClass("d-none");
		// 사용자키를 전달해서 카카오 로그인 서비스를 초기화한다.
		Kakao.init("82b4c2a96aab2017df298cdff9bd58ee");
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기
		Kakao.Auth.login({
			success: function(auth) {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response) {
						// 사용자 정보를 가져와서 폼에 추가한다.
						var account = response.kakao_account;
						
						$('#form-kakao-login input[name=id]').val(response.id);
						$('#form-kakao-login input[name=name]').val(account.profile.nickname);
						$('#form-kakao-login input[name=email]').val(account.email);
						//$('#form-kakao-login input[name=age]').val(account.age_range);
						$('#form-kakao-login input[name=gender]').val(account.gender);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector("#form-kakao-login").submit()
					},
					fail: function(error) {
						// 경고창에 에러 메세지를 표시한다.
						$("#alert-kakao-login").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생하였습니다.");
					}
				});
			},
			fail: function(error) {
				// 경고창에 에러 메세지를 표시한다.
				$("#alert-kakao-login").removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생하였습니다.");
			}
		});		
	})
});