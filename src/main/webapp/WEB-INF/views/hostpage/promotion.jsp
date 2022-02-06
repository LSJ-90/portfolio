<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로모션 페이지</title>
</head>
<body>
<button class="btn btn-primary" onclick="location.href='/host/addPromotionDiscount?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">할인 프로모션 추가</button>
<button class="btn btn-primary" onclick="location.href='/host/addPromotionOffer?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">증정 프로모션 추가</button>
</body>
</html>