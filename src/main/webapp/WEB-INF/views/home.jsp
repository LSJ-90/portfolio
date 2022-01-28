<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<head>
	<link rel="stylesheet" href="../../resources/css/datepicker.min.css">
    <script src="../../resources/js/jquery-3.1.1.min.js"></script>
    <script src="../../resources/js/datepicker.min.js"></script>
    <script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
</head>
<h1>홈페이지</h1>
<p><c:out value="${message }" /></p>
<div>
	<h3>위치inputBox</h3>
	<label class="" for="location">
	    <input id="location" type="text" value="">
	</label>
	
	<div class="double">
        <h3>체크인/체크아웃inputBox</h3>
        <input id="datepicker1" type="text"> -
        <input id="datepicker2" type="text">
    </div>
	
	<h3>인원inputBox</h3>
	<label class="" for="people">
	    <input id="people" type="text" value="">
	</label>
</div>
<script>
    datePickerSet($("#datepicker1"), $("#datepicker2"), true);

    function datePickerSet(sDate, eDate, flag) {

        if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
            var sDay = sDate.val();
            var eDay = eDate.val();

            if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { 		
                var sdp = sDate.datepicker().data("datepicker");
                sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  

                var edp = eDate.datepicker().data("datepicker");
                edp.selectDate(new Date(eDay.replace(/-/g, "/")));
            }

            if (!isValidStr(eDay)) {
                sDate.datepicker({
                    maxDate: new Date(eDay.replace(/-/g, "/"))
                });
            }
            sDate.datepicker({
                language: 'ko',
                autoClose: true,
                onSelect: function () {
                    datePickerSet(sDate, eDate);
                }
            });

            if (!isValidStr(sDay)) {
                eDate.datepicker({
                    minDate: new Date(sDay.replace(/-/g, "/"))
                });
            }
            eDate.datepicker({
                language: 'ko',
                autoClose: true,
                onSelect: function () {
                    datePickerSet(sDate, eDate);
                }
            });
        } 

        function isValidStr(str) {
            if (str == null || str == undefined || str == "")
                return true;
            else
                return false;
        }
    }
</script>