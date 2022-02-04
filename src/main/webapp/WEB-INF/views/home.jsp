<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<head>
	<link rel="stylesheet" href="../../resources/css/datepicker.min.css">
    <script src="../../resources/js/datepicker.js"></script>
    <script src="../../resources/js/datepicker.min.js"></script>
    <script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
</head>
<h1>홈페이지</h1>
<p><c:out value="${message }" /></p>
<div>
	<form id="form-search-stay" action="/accommo/list" method="get">
		<label class="" for="address">위치inputBox</label>
			<input id="type" type="hidden" name="opt1" value="address">
		    <input id="address" type="text" name="addressValue">
		
		
        <label class="" for="address">체크인/체크아웃inputBox</label>
	        <input id="type" type="hidden" name="opt2" value="checkInBox">
	        <input id="checkInBox" type="text" name="checkInBoxValue"> -
	        <input id="type" type="hidden" name="opt3" value="checkOutBox">
	        <input id="checkOutBox" type="text" name="checkOutBoxValue">
		
		<label class="" for="maxStandardNumber">인원inputBox</label>
			<input id="type" type="hidden" name="opt4" value="maxStandardNumber">
		    <input id="maxStandardNumber" type="text" name="maxStandardNumberValue">
		
		<button id="serachStay" type="button" class="">검색버튼</button>	
	</form>
</div>
<script type="text/javascript">
	$(function () {
		
		// 검색 폼트리거
		$("#serachStay").click(function() {
			var opt1 = $("input[name=opt1]").val();
			var addressValue = $(":input[name=addressValue]").val();
			var opt2 = $("input[name=opt2]").val();
			var checkInBoxValue = $(":input[name=checkInBoxValue]").val();
			var opt3 = $("input[name=opt3]").val();
			var checkOutBoxValue = $(":input[name=checkOutBoxValue]").val();
			var opt4 = $("input[name=opt4]").val();
			var maxStandardNumberValue = $(":input[name=maxStandardNumberValue]").val();
			$("#form-search-stay").trigger("submit");
		});
	});
		

   	datePickerSet($("#checkInBox"), $("#checkOutBox"));
	
   	// 달력생성함수 sDate:시작일 eDate:종료일
    function datePickerSet(sDate, eDate) {
	
            var sDay = sDate.val();
            var eDay = eDate.val();

            if (!isValidStr(eDay)) {
                sDate.datepicker({
                    maxDate: new Date(eDay)
                });
            }
            
            sDate.datepicker({
                language: 'ko',
                minDate: new Date(),
                autoClose: true,
                onSelect: function () {
                    datePickerSet(sDate, eDate);
                }
            });

            if (!isValidStr(sDay)) {
                eDate.datepicker({
                    minDate: new Date(sDay)
                });
            } 
            
            eDate.datepicker({
                language: 'ko',
                autoClose: true,
                onSelect: function () {
                    datePickerSet(sDate, eDate);
                }
            });
		
        //날짜 생성 여부
        function isValidStr(str) {
            if (str == null || str == undefined || str == "")
                return true;
            else
                return false;
        }
    }
</script>