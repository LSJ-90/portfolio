<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 타임테이블</title>
</head>
<body>

<button class="btn btn-primary" onclick="location.href='/activity/addTimeTable?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">타임테이블 등록</button>

<div>
	<button class="btn btn-primary" onclick="location.href='/activity/mainTime?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=A'">전체타임테이블</button>
	<button class="btn btn-primary" onclick="location.href='/activity/mainTime?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=N'">진행타임테이블</button>
	<button class="btn btn-primary" onclick="location.href='/activity/mainTime?hostNo=${param.hostNo }&hostingType=${param.hostingType }&status=Y'">종료된타임테이블</button>
</div>
<div> 			
<c:choose>
	<c:when test="${empty timeList}">
		<h1>등록된 타임테이블이 없습니다.</h1>
	</c:when>
	<c:otherwise>
		<table>
			<colgroup>
				<col style="width: 5%" />
				<col style="width: 10%" />
				<col style="width: 50%" />
				<col style="width: 20%" />
				<col style="width: 15%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
				    <th>상태</th>
				    <th>체험시간</th>
				    <th>예약인원/최대인원</th>
				    <th></th>
				</tr>
			</thead>
		
			<tbody>
				<c:forEach var="timeList" items="${timeList}">
					<tr class="text-center">
						<td></td>
						<c:choose>
							<c:when test="${timeList.closed eq 'N'}">
								<td>진행중</td>
							</c:when>
							<c:when test="${timeList.closed eq 'Y'}">
								<td>종료</td>
							</c:when>
						</c:choose>
						<td><fmt:formatDate value="${timeList.time}" pattern="yy년 M월 d일 kk시mm분"/></td>
						<td>${timeList.soFarBookedNumberOfPeople} / ${actMainDto.actMaximumNumber}</td>
						<td><button class="btn btn-primary" onclick="location.href='/activity/modifyTime?hostNo=${param.hostNo }&hostingType=${param.hostingType }&no=${timeList.no}'">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
	</c:choose>
</div>



</body>
</html>