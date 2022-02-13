<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>


<style type="text/css">
.user-list-table {
  table-layout: fixed;
  width: 100%;
  font-size: 15px;
  border-collapse: collapse;
  border-top: 2px solid var(--color-black);
}

.user-list-table th,
.user-list-table td {
  text-align: center;
  vertical-align: middle;
  height: 45px;
}
.user-list-table th {
  font-weight: var(--weight-regular);
  border-bottom: 1px solid var(--color-black);
}

.user-list-table td {
  font-weight: var(--weight-light);
  padding: 0 3px;
  border-bottom: 1px solid var(--color-input-gray);
}

.user-list-table tr:last-child td {
  border-bottom: 1px solid var(--color-black);
}
.chart {margin: 5px 0;}

.sales-table > td {padding:2px 0 !important; text-align:center;}
</style>   

<body>

<button class="btn btn-primary" onclick="location.href='/host/addPromotionDiscount?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">할인 프로모션 추가</button>
<button class="btn btn-primary" onclick="location.href='/host/addPromotionOffer?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">증정 프로모션 추가</button>

<div>
	<button class="btn btn-primary" onclick="location.href='/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=A'">전체프로모션</button>
	<button class="btn btn-primary" onclick="location.href='/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=Y'">진행프로모션</button>
	<button class="btn btn-primary" onclick="location.href='/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=W'">승인대기프로모션</button>
	<button class="btn btn-primary" onclick="location.href='/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=N'">승인거절프로모션</button>
	<button class="btn btn-primary" onclick="location.href='/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=D'">종료프로모션</button>
</div>
<div> 			
	<table class="user-list-table">
		<colgroup>
			<col style="width: 5%" />
			<col style="width: 55%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 5%" />
			<col style="width: 5%" />
			<col style="width: 5%" />
			<col style="width: 5%" />
		</colgroup>
		<thead>
			<tr>
			    <th>상태</th>
			    <th>소개글 (할인 프로모션)</th>
			    <th>시작일</th>
			    <th>종료일</th>
			    <th>평일할인율</th>
			    <th>주말할인율</th>
			    <th>성수기할인율</th>
			    <th></th>
			</tr>
		</thead>
	
		<tbody>
			<c:choose>
				<c:when test="${empty promotionDiscountList}">
					<tr>
						<td></td>
						<td>등록된 할인 프로모션이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="promotionDiscountList" items="${promotionDiscountList}">
						<tr class="text-center">
							<c:choose>
								<c:when test="${promotionDiscountList.status eq 'Y'}">
									<td>진행중</td>
								</c:when>
								<c:when test="${promotionDiscountList.status eq 'W'}">
									<td>승인대기</td>
								</c:when>
								<c:when test="${promotionDiscountList.status eq 'N'}">
									<td>승인거절</td>
								</c:when>
								<c:when test="${promotionDiscountList.status eq 'D'}">
									<td>종료</td>
								</c:when>
							</c:choose>
							<td>${promotionDiscountList.introContent}</td>
							<td><fmt:formatDate value="${promotionDiscountList.startingDate}" pattern="yyyy.MM.dd"/></td>
							<td><fmt:formatDate value="${promotionDiscountList.endingDate}" pattern="yyyy.MM.dd"/></td>
							<td><fmt:formatNumber value="${promotionDiscountList.weekdaysDiscountRate}" type="percent"/></td>
							<td><fmt:formatNumber value="${promotionDiscountList.weekendDiscountRate}" type="percent"/></td>
							<td><fmt:formatNumber value="${promotionDiscountList.peakSeasonDiscountRate}" type="percent"/></td>
							<td><button class="btn btn-primary" onclick="location.href='/host/modifyPromotionDiscount?hostNo=${param.hostNo }&hostingType=${param.hostingType }&no=${promotionDiscountList.no}'">수정</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<div>
	<table class="user-list-table">
		<colgroup>
			<col style="width: 5%" />
			<col style="width: 40%" />
			<col style="width: 30%" />
			<col style="width: 10%" />
			<col style="width: 10%" />
			<col style="width: 5%" />
		</colgroup>
		<thead>
			<tr>
			    <th>상태</th>
			    <th>소개글 (증정 프로모션)</th>
			    <th>증정품</th>
			    <th>시작일</th>
			    <th>종료일</th>
			    <th></th>
			</tr>
		</thead>
	
		<tbody>
			<c:choose>
				<c:when test="${empty promotionOfferList}">
					<tr>
						<td></td>
						<td>등록된 증정 프로모션이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="promotionOfferList" items="${promotionOfferList}">
						<tr class="text-center">
							<c:choose>
								<c:when test="${promotionOfferList.status eq 'Y'}">
									<td>진행중</td>
								</c:when>
								<c:when test="${promotionOfferList.status eq 'W'}">
									<td>승인대기</td>
								</c:when>
								<c:when test="${promotionOfferList.status eq 'N'}">
									<td>승인거절</td>
								</c:when>
								<c:when test="${promotionOfferList.status eq 'D'}">
									<td>종료</td>
								</c:when>
							</c:choose>
							<td>${promotionOfferList.introContent}</td>
							<td>${promotionOfferList.content}</td>
							<td><fmt:formatDate value="${promotionOfferList.startingDate}" pattern="yyyy.MM.dd"/></td>
							<td><fmt:formatDate value="${promotionOfferList.endingDate}" pattern="yyyy.MM.dd"/></td>
							<td><button class="btn btn-primary" onclick="location.href='/host/modifyPromotionOffer?hostNo=${param.hostNo }&hostingType=${param.hostingType }&no=${promotionOfferList.no}'">수정</button></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
</body>
<script type="text/javascript">
activeMenu('프로모션');

</script>