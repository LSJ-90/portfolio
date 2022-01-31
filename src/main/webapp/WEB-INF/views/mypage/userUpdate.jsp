<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
		
<div class="mypage__content">
	<header class="section__header">
		<h1 class="section__title">회원정보수정</h1>
	</header>
	
	<c:if test="${not empty error }">
		<div class="mb-3 alert alert-danger">${error }</div>
	</c:if>
	
	<article class="login">
		<div class="form__wrap">
			<!-- 회원 기본정보 수정폼 -->
			<form action="/mypage/userupdate" class="" method="post" enctype="multipart/form-data">
				<!--  자리를 어디에 둬야 할까... -->
				<div class="">profile photo작업중
					<input type="file" class="form__id" id="" name="image" title=""  accept="">
				</div>
					<!-- <div>
						<img src="../../resources/images/3287250505288logofake"/>
					</div> -->
				<!--  제목들은 왼쪽으로 정렬되어야할까... -->
				<div class="login__id">이름::
					<input type="text" class="form__id" id="userName" name="name" value=<c:out value="${LOGIN_USER.name}"/> />
				</div>
				<div class="login__id">아이디::
					<c:out value="${LOGIN_USER.id}"/>
				</div>
				<div class="login__id">전화번호::
					<input type="text" class="form__id" id="userTel" name="tel" value=<c:out value="${LOGIN_USER.tel}"/> />
				</div>
				<div class="login__id">이메일::
					<!-- type을 email로 줘야 할까...? -->
					<input type="text" class="form__id" id="userEmail" name="email" value=<c:out value="${LOGIN_USER.email}"/> />
				</div>
				<div class="login__id">포인트::
					<!-- type을 email로 줘야 할까...? -->
					<c:out value="${LOGIN_USER.pnt}"/>
				</div>
				<!-- 모달창 -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">회원정보 변경동의</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<p>수정하신 기본정보가 변경됩니다. 진행하시겠습니까?</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
			</form>
			
			<!-- 회원 비밀번호 수정폼 -->
			<form action="/mypage/userpwdupdate" class="" method="post">
				<div class="login__pwd">비밀번호
					<input type="password" class="form__pwd" name="pwd" placeholder="비밀번호" />
				</div>
				<div class="login__pwd">변경할 비밀번호
					<input type="password" class="form__pwd" name="changePwd" placeholder="변경할 비밀번호" />
				</div>
				<div class="login__pwd">변경할 비밀번호 확인
					<input type="password" class="form__pwd" name="confirmPwd" placeholder="변경할 비밀번호 확인" />
				</div>
				<!-- 모달버튼 -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#examplepwdModal">
			 			비밀번호 변경
				</button>
				<!-- 모달창 -->
				<div class="modal fade" id="examplepwdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경동의</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<p>수정하신 비밀번호가 변경됩니다. 진행하시겠습니까?</p>
				      	<p>***진행이 완료되면 로그인 페이지로 이동합니다.***</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">Save changes</button>
				      </div>
				    </div>
				  </div>
				</div>
			</form>
		</div>
		
		
		<div>
			<!-- 회원정보 저장 모달버튼 -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
		 			회원정보 저장
			</button>
			<!-- 회원탈퇴 모달버튼 버튼 디자인을 작게 할까..? 색을 다르게 입힐까? -->
			<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleDeleteModal">
		 			회원탈퇴
			</button>
		</div>
		
		<!-- 회원 탈퇴 폼 -->
		<form action="/mypage/userdelete" class="" method="post">
			
			<!-- 모달창 -->
			<div class="modal fade" id="exampleDeleteModal" tabindex="-1" aria-labelledby="exampleDeleteModal" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">회원탈퇴 동의</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			      	<p>회원탈퇴를 진행하시겠습니까?</p>
			      	<p>***진행이 완료되면 모든 회원정보를 잃습니다.***</p>
			      	<p>비밀번호를 입력해주세요.</p>
			      	<input type="password" class="form__pwd" name="pwd" placeholder="비밀번호" required/> 
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			       	<button type="submit" class="btn btn-primary">YES</button>
			      </div>
			    </div>
			  </div>
			</div>
		</form>
	</article>
</div>