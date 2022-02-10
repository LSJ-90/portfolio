<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>객실 정보</title>
</head>
<style>
.contents {margin-left: 200px; }
.roomInsert {margin-left: 1200px; }
</style>
<body>


	<div class="roomInsert">
		<a href="/host/insertRoom?hostNo=${param.hostNo }&hostingType=${param.hostingType }">객실 등록</a>
	</div>

	<div>
	  <ul>
	    <li>객실 목록</li>
	    <c:forEach var="roomListDto" items="${roomListDto }">
	     <li>
	       <a href="#" class="roomNo" id="${roomListDto.no}">${roomListDto.name }</a>
	     </li>
	    </c:forEach>
	  </ul>
	</div>
  
  
  <div class="contents" id="contents">
  	<c:forEach var="roomListDto" items="${roomListDto }" varStatus="status">
  		<c:if test="${status.first}">
  			<li id="${roomListDto.no }" class="${roomListDto.no}">
  				<strong>객실이름 : ${roomListDto.name }</strong>
		        <p class="no">객실번호 : ${roomListDto.no }</p>
		        <p>숙소번호 : ${roomListDto.accommoNo }</p>
		        <p>평일가격 : <fmt:formatNumber value="${roomListDto.weekdaysPrice }" pattern="##,###"/>원</p>
		        <p>주말가격 : <fmt:formatNumber value="${roomListDto.weekendPrice }" pattern="##,###"/>원</p>
		        <p>성수기가격 : <fmt:formatNumber value="${roomListDto.peakSeasonPrice }" pattern="##,###"/>원</p>
		        <p>기준인원 : ${roomListDto.standardNumber }명</p>
		        <p>최대인원 : ${roomListDto.maximumNumber }명</p>
		        <p>추가인원가격 : <fmt:formatNumber value="${roomListDto.pricePerPerson }" pattern="##,###"/>원</p>
		        <p>AMENITIES : ${roomListDto.amenity }</p>
		        <p>FEAURES : ${roomListDto.feature }</p>
		        <c:forEach var="image" items="${roomListDto.roomImages}">
		        	<img src="/resources/images/room/${image.image }" width="200" />
		        </c:forEach>
		        <button class="btn btn-primary" onclick="location.href='/host/roomModify?hostNo=${param.hostNo }&hostingType=${param.hostingType }&roomNo=${roomListDto.no}'">수정하기</button>
  			</li>
  		</c:if>
  		<c:if test="${!status.first}">
  			<li id="${roomListDto.no }" class="${roomListDto.no } d-none">
  				<strong>객실이름 : ${roomListDto.name }</strong>
		        <p class="no">객실번호 : ${roomListDto.no }</p>
		        <p>숙소번호 : ${roomListDto.accommoNo }</p>
		        <p>평일가격 : <fmt:formatNumber value="${roomListDto.weekdaysPrice }" pattern="##,###"/>원</p>
		        <p>주말가격 : <fmt:formatNumber value="${roomListDto.weekendPrice }" pattern="##,###"/>원</p>
		        <p>성수기가격 : <fmt:formatNumber value="${roomListDto.peakSeasonPrice }" pattern="##,###"/>원</p>
		        <p>기준인원 : ${roomListDto.standardNumber }명</p>
		        <p>최대인원 : ${roomListDto.maximumNumber }명</p>
		        <p>추가인원가격 : <fmt:formatNumber value="${roomListDto.pricePerPerson }" pattern="##,###"/>원</p>
		        <p>AMENITIES : ${roomListDto.amenity }</p>
		        <p>FEAURES : ${roomListDto.feature }</p>
		        <c:forEach var="image" items="${roomListDto.roomImages}">
		        	<img src="/resources/images/room/${image.image }" width="200" />
		        </c:forEach>
		        <button class="btn btn-primary" onclick="location.href='/host/roomModify?hostNo=${param.hostNo }&hostingType=${param.hostingType }&roomNo=${roomListDto.no}'">수정하기</button>
  			</li>
  		</c:if>
      </c:forEach>
  </div>

</body>
<script type="text/javascript">
activeMenu('객실관리');

$(function() {
 	$('.roomNo').on('click', function(e){
		var atagId = this.id;
		
		var li = $('#contents').find('li')
		$.each(li, function(index, item){
			if(atagId == item.id){
				$(item).attr('class', '');
			} else {
				$(item).attr('class', 'd-none');
			}
		});
	});
})
</script>

