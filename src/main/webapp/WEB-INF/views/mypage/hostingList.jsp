<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<meta charset="UTF-8">
<title>호스트 신청</title>
</head>
<body>
	<div class="container ">
		<div class="row mb-3 ">
			<div class="col text-center">
				<h3>H O S T P A G E</h3>
				<h5>호스트 페이지</h5>
			</div>
		</div>
		<div class="row mb-3 d-flex justify-content-center">
			<div class="col-6 text-center">
				<c:forEach var="accListDto" items="${accListDto }" >
					<div class="mb-3">
						<label class="form-label">${accListDto.accName }</label>
					</div>
					<div>
						<a href="/host/detail?hostNo=${accListDto.accNo}?hostingType=${accListDto.hostingType }">
							<img src="/resources/images/hostMainImage/${accListDto.mainImage}" class="img-thumbnail">
						</a>
					</div>
				</c:forEach>
				<c:forEach var="actListDto" items="${actListDto }" >		
					<div class="mb-3">
						<label class="form-label">${actListDto.actName }</label>
					</div>
					<div>
						<a href="/host/detail?hostNo=${actListDto.actNo}?hostingType=${actListDto.hostingType }">
							<img src="/resources/images/hostMainImage/${actListDto.mainImage}" class="img-thumbnail">
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>


    


