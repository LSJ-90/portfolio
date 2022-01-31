<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>	
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
  <meta charset="UTF-8">
  <title>객실 정보</title>
</head>
<body>
<style>
.contents {margin-left: 200px; }
.roomInsert {margin-left: 1200px; }
</style>

  <div class="roomInsert">
  	<a href="/host/insertRoom?hostNo=${param.hostNo }&hostingType=${param.hostingType }">객실 등록</a>
  </div>

  <div>
    <ul>
      <li>객실 목록</li>
      <c:forEach var="roomListDto" items="${roomListDto }">
	      <li>
	        <a href="#">${roomListDto.name }</a>
	      </li>
      </c:forEach>
    </ul>
  </div>
  
  
  <div class="contents">
  	<c:forEach var="roomListDto" items="${roomListDto }">
	      <li>
	        <strong>객실이름 : ${roomListDto.name }</strong>
	        <p>객실번호 : ${roomListDto.no }</p>
	        <p>숙소번호 : ${roomListDto.accommoNo }</p>
	        <p>평일가격 : ${roomListDto.weekdaysPrice }</p>
	        <p>주말가격 : ${roomListDto.weekendPrice }</p>
	        <p>성수기가격 : ${roomListDto.peakSeasonPrice }</p>
	        <p>기준인원 : ${roomListDto.standardNumber }</p>
	        <p>최대인원 : ${roomListDto.maximumNumber }</p>
	        <p>추가인원가격 : ${roomListDto.pricePerPerson }</p>
	        <p>AMENITIES : ${roomListDto.amenity }</p>
	        <p>FEAURES : ${roomListDto.feature }</p>
	        <c:forEach var="image" items="${roomListDto.roomImages}">
	        	<img src="/resources/images/room/${image.image }" width="200" />
	        </c:forEach>
	        <button class="btn btn-primary">수정하기</button>
	      </li>
      </c:forEach>
  </div>

</body>
<script type="text/javascript">

</script>

