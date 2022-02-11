<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<main id="main">
  <article class="host-main">
  	<div class="row">
	  	<div class="col">
	  		<h1>숙소</h1>
	  		<button class="btn btn-outline-dark" onclick="location.href='/host/modify?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">호스트 수정</button>
			<button class="btn btn-outline-dark" onclick="location.href='/mypage/hostingList'">호스팅 리스트</button>
			<button class="btn btn-outline-dark" onclick="location.href='/host/addAccInfo?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">부대시설 안내 및 기타 안내 사항 등록</button>
	 	</div>
	</div>
	
  	<div class="row">
	  	<div class="col-6">
	  		<img src="/resources/images/hostMainImage/${accMainDto.mainImage}" width="600">
	 	</div>
	 	<div class="col-6">
	  		<h1>호스트 기본 정보</h1>
	  		<table class="table table-bordered" border="1"  align = "center" >
				    <tr align = "center">
					<td>체크인</td>
					<td>${accMainDto.accCheckInTime}</td>
					<td>체크아웃</td>
					<td>${accMainDto.accCheckOutime}</td>
					<td colspan="2">연락처</td>
					<td>${savedHost.tel}</td>
				    </tr>
				    <tr align = "center">
					<td>주소</td>
					<td colspan="6">${accMainDto.accAddress}</td>
				    </tr>
				    <tr align = "center">
					<td colspan="7">객실정보</td>
				    </tr>
				    <tr align = "center">
					<td>객실</td>
					<td>평일</td>
					<td>주말</td>
					<td>성수기</td>
					<td>기준인원</td>
					<td>최대인원</td>
					<td>기준인원 초과시 인당가격</td>
				    </tr>
				      <c:forEach var="room" items="${roomList }" varStatus="loop">
					<tr align = "center">
		            <td>${room.name }</td>
		            <td><fmt:formatNumber value="${room.weekdaysPrice}" pattern="#,###" /></td>
		            <td><fmt:formatNumber value="${room.weekendPrice}" pattern="#,###" /></td>
		            <td><fmt:formatNumber value="${room.peakSeasonPrice}" pattern="#,###" /></td>
		            <td>${room.standardNumber }</td>
		            <td>${room.maximumNumber }</td>
		            <td><fmt:formatNumber value="${room.pricePerPerson}" pattern="#,###" /></td>
         			 </tr>            
        		   </c:forEach>
				</table>
	 	</div>
	</div>
	
	<div class="row">
	 	<div class="col-12">
	  		<h1>오늘 체크인 게스트</h1>
	  		<c:if test="${empty todayCheckInList }">
	  	<h4>체크인 예정인 게스트가 없습니다.</h4>
	  	</c:if> 
	  	<c:if test="${not empty todayCheckInList }"> 	
	  		 <table class="table table-bordered" border="1">
        <colgroup>
          <col style="width: 27%" />
          <col style="width: 20%" />
          <col style="width: 20%" />
          <col style="width: 20%" />
          <col style="width: 10%" />
        </colgroup>
        <thead>
          <tr>
            <th>객실</th>
            <th>기간</th>
            <th>게스트</th>
            <th>연락처</th>
            <th>추가인원</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="checkIn" items="${todayCheckInList }" varStatus="loop">
			<tr>
            <td>${checkIn.roomName }</td>
            
            <td><fmt:formatDate value="${checkIn.checkInDate }" pattern="yyyy-MM-dd" type="date"/> ~ 
            <fmt:formatDate value="${checkIn.checkOutDate }" pattern="yyyy-MM-dd" type="date"/></td>
            <td>${checkIn.roomUserName }</td>
            <td>${checkIn.roomUserTel }</td>
            <td>${checkIn.extraPeople }</td>
          </tr>            
           </c:forEach>
        </tbody>
         </table>
      </c:if>
	  		<h1>오늘 체크아웃 게스트</h1>
	  	<c:if test="${empty todayCheckOutList}">
	  	<h4>체크아웃 예정인 게스트가 없습니다.</h4>
	  	</c:if> 
	  	<c:if test="${not empty todayCheckOutList}"> 	
	  		
	  		 <table class="table table-bordered" border="1">
        <colgroup>
          <col style="width: 27%" />
          <col style="width: 20%" />
          <col style="width: 20%" />
          <col style="width: 20%" />
          <col style="width: 10%" />
        </colgroup>
        <thead>
          <tr>
            <th>객실</th>
            <th>기간</th>
            <th>게스트</th>
            <th>연락처</th>
            <th>추가인원</th>
          </tr>
        </thead>
        <tbody>
             <c:forEach var="checkOut" items="${todayCheckOutList }" varStatus="loop">
			<tr>
            <td>${checkOut.roomName }</td>
             <td><fmt:formatDate value="${checkOut.checkInDate }" pattern="yyyy-MM-dd" type="date"/> ~ 
            <fmt:formatDate value="${checkOut.checkOutDate }" pattern="yyyy-MM-dd" type="date"/></td>
            <td>${checkOut.roomUserName }</td>
            <td>${checkOut.roomUserTel }</td>
            <td>${checkOut.extraPeople }</td>
          </tr>            
           </c:forEach>
        </tbody>
      </table>
      </c:if>
	 	</div>
	 </div>
	
	<div class="row">
	  	<div class="col-12">
	  		<h1>최근 3일간 리뷰 today (+ ${todayReviewCount })</h1>
	  		 <table class="table table-bordered" border="1">
        <colgroup>
          <col style="width: 27%" />
          <col style="width: 43%" />
          <col style="width: 20%" />
          <col style="width: 10%" />
        </colgroup>
        <thead>
          <tr>
            <th>청결도 / 의사소통 / 정확도 / 위치</th>
            <th>내용</th>
            <th>작성일</th>
            <th>답변여부</th>
          </tr>
        </thead>
        <tbody id="dataSection">
          
        </tbody>
      </table>
      
	<!-- 숙소 페이지네이션 -->      
      <div id="pagination">
        <ul class="pagination__list" id="paginationBox">
          
        </ul>
      </div>
	 	</div>
	  	<div class="col-12">
	  		<h1>최근 3일간 예약내역 today (+ ${todayBookingCount })</h1>
	  		 <table class="table table-bordered" border="1">
        <colgroup>
          <col style="width: 8%" />
          <col style="width: 15%" />
          <col style="width: 7%" />
          <col style="width: 10%" />
          <col style="width: 7%" />
          <col style="width: 8%" />
        </colgroup>
        <thead>
          <tr>
            <th>객실이름</th>
            <th>기간</th>
            <th>예약자</th>
            <th>연락처</th>
            <th>예약상태</th>
            <th>추가인원</th>
          </tr>
        </thead>
        <tbody id="dataSection1">
          
        </tbody>
      </table>
      
	<!-- 숙소 페이지네이션 -->      
      <div id="pagination">
        <ul class="pagination__list" id="paginationBox1">
          
        </ul>
      </div>
	 	</div>
	</div>
  
    
  </article>
</main>
	
<script type="text/javascript">
const accNo = ${accMainDto.accNo};
getMainBookingList();
getMainAccReviewList();
function getMainAccReviewList(page) {
	
	
			$.ajax({
				type: 'POST',
				url : "/host/getMainAccReviewList.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					no : accNo
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					var data = "";
					var block = "";

					console.log(pagination);
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].cleanlinessStar + " / " + list[i].communicationStar +" / " + list[i].accuracyStar + " / " + list[i].locationStar + "</td>";
						data += "<td>" + list[i].content + "</td>";
						data += "<td>" + list[i].createdDate + "</td>";
						if (list[i]['answered'] == 'N') {
						data += "<td>미완료</td>";
						} else {
							data += "<td>완료</td>";
						} 
						data += "</tr>";
					}
					$("#dataSection").html(data);

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' onclick='getMainAccReviewList("
								+ (pagination['beginPage'] - 1)
								+ ")'> <i class='fas fa-chevron-left'></i> </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> <i class='fas fa-chevron-left'></i> </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' onclick='getMainAccReviewList("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' onclick='getMainAccReviewList("
								+ (pagination['endPage'] + 1)
								+ ")'> <i class='fas fa-chevron-right'></i> </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> <i class='fas fa-chevron-right'></i> </a></li>";
					}
					
					$("#paginationBox").html(block);
				}
			})
}
function getMainBookingList(page) {
	
	
			$.ajax({
				type: 'POST',
				url : "/host/getMainBookingList.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					no : accNo
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					var data = "";
					var block = "";

					console.log(pagination);
					console.log(list);
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].roomName + "</td>";
						data += "<td>" + list[i].checkInDate+ "~" + list[i].checkOutDate + "</td>";
						data += "<td>" + list[i].roomUserName; + "</td>";
						data += "<td>" + list[i].roomUserTel + "</td>";
						if (list[i]['status'] == 1) {
						data += "<td>예약중</td>";
						} else if (list[i]['status'] == 2) {
							data += "<td>예약취소</td>";
						} else {
							data += "<td>종료</td>";
						}
						data += "<td>" + list[i].extraPeople  + "</td>";
						data += "</tr>";
					}
					$("#dataSection1").html(data);

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' onclick='getMainBookingList("
								+ (pagination['beginPage'] - 1)
								+ ")'> <i class='fas fa-chevron-left'></i> </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> <i class='fas fa-chevron-left'></i> </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' onclick='getMainBookingList("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' onclick='getMainBookingList("
								+ (pagination['endPage'] + 1)
								+ ")'> <i class='fas fa-chevron-right'></i> </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> <i class='fas fa-chevron-right'></i> </a></li>";
					}
					
					$("#paginationBox1").html(block);
				}
			})
}


</script>
	
	