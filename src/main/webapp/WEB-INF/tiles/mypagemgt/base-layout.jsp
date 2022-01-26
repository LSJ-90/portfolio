<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOGE :: 호게</title>
    <!-- font -->
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@100;300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Abel&display=swap" rel="stylesheet">   
    <script src="https://kit.fontawesome.com/d94ff6bbbc.js" crossorigin="anonymous"></script>
    <!-- css -->  
    <link rel="stylesheet" href="../../resources/css/style.css" />
    <link rel="stylesheet" href="../../resources/css/mypage_style.css" />
    <!-- script -->
    <!-- <script src="main.js" defer></script> -->
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<!-- 카카오 api -->
  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  </head>
  <body>
	<tiles:insertAttribute name="header" />
	<main id="main">
		<article class="mypage">
			
			<!--  myheaer 타일즈 설정 하다 오류가 발생하여 잠시 설정 보류 -->
			<header class="section__header">
				<h1 class="section__title">MY PAGE</h1>
				<p class="section__text">마이페이지</p>
			</header>
			
			<div class="mypage__info">
				<p class="info__title">${LOGIN_USER.name}님반가워요!</p>
				<p class="info__count">호게와 함께 0번의 여행을 했어요.</p>
			</div>
			
			<!--  hostApply 타일즈 설정 하다 오류가 발생하여 잠시 설정 보류 -->
			<div class="host">
				<a href="/host/applyForm" class="host__registration"> <img
					src="../../resources/images/main/login_icon.png" alt=""
					class="host__icon" /> 호스트 등록
				</a>
				<!--  
			  호스트 등록 후
			  <a href="/host/main" class="host__change">
			    <img src="../../resources/images/main/login_icon.png" alt="" class="host__icon" />
			    호스트 페이지
			  </a>
			  -->
			</div>
		
			<div class="mypage-wrap">
				<tiles:insertAttribute name="sideNav" />
				<tiles:insertAttribute name="body" />
 			</div>
 		</article>
	</main>
	
	<tiles:insertAttribute name="footer" />
</body>
</html>