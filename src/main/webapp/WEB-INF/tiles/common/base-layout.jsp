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
    <!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- css -->  
    <link rel="stylesheet" href="../../resources/css/mypage_style.css" />
    <link rel="stylesheet" href="../../resources/css/style.css" />
    <!-- script -->
    
    <!-- ajax -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<!-- 카카오 api -->
  	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  	<!-- datepicker -->
	<link rel="stylesheet" href="../../resources/css/datepickerAdmin.min.css">
    <script src="../../resources/js/datepicker.js"></script>
    <script src="../../resources/js/datepicker.min.js"></script>
    <script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
    <!-- owl carousel -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  </head>
  <body>
      <tiles:insertAttribute name="header"/> 
      
      <tiles:insertAttribute name="body"/>

      <tiles:insertAttribute name="footer"/> 
  </body>
</html>