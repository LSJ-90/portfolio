<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>TestTiles</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 이승준: 부트스트랩 설정 link 디자인 적용 시 삭제 S -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 	<!-- 이승준: 부트스트랩 설정 link 디자인 적용 시 삭제 E -->
 	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
  </head>
   <body>
      <tiles:insertAttribute name="header"/> 
      <tiles:insertAttribute name="navbar"/>
      
      <tiles:insertAttribute name="body"/>

      <tiles:insertAttribute name="footer"/> 
  </body>
</html>