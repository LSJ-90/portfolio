<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
	<link rel="stylesheet" href="../../../resources/css/datepickerAdmin.min.css">
    <script src="../../resources/js/datepicker.js"></script>
    <script src="../../resources/js/datepicker.min.js"></script>
    <script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
<style>
.cal-search {border: 1px solid black;}
</style>



 <main id="main">
      <article id="user-list">
        <form class="search-user__form" id="form-search-user" method="get" action="user-list">
          <input type="hidden" name="page" value="1" />
         	 <h3> 기간 조회하기 </h3>
              <label class="" for="address">기간별 검색</label>
		      <input class="cal-search" id="startDate" type="text" name="startDate" value="">-<input class="cal-search" id="endDate" type="text" name="endDate" value="">
	          <button type="button" class="btn__search" id="btn-search-user">검색</button>
	          <br/><br/><br/> 
          <div> 
	           <button type="button" name="filterDate" id="oneWeek">일주일</button> 
	           <button type="button" name="filterDate" id="oneMonth">1개월</button> 
	           <button type="button"name="filterDate" id="threeMonths">3개월</button> 
	           <button type="button"name="filterDate" id="sixMonths">6개월</button>
          </div>
        </form>
        <div class="row mb-3">
			<div class="col">
				<table class="user-list-table">
					<colgroup>
						<col style="width: 35%;">
						<col style="width: 35%;">
						<col style="width: 30%;">
					</colgroup>
					<thead>
						<tr>
							<th>총 입금액</th>
							<th>총 출금액</th>
							<th>총 순익</th>
						</tr>
					</thead>
					<tbody id="salesdataSection">
				
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<table class="user-list-table">
					<colgroup>
						<col style="width: 4%;">
						<col style="width: 12%;">
						<col style="width: 9%;">
						<col style="width: 9%;">
						<col style="width: 9%;">
						<col style="width: 13%;">
						<col style="width: 13%;">
						<col style="width: 13%;">
						<col style="width: 11%;">
					</colgroup>
					<thead>
						<tr>
							<th>No</th>
							<th>종류</th>
							<th>거래금액</th>
							<th>(환불)회원번호</th>
							<th>(출금)호스트번호</th>
							<th>(입금)숙소예약번호</th>
							<th>(입금)체험예약번호</th>
							<th>누적액</th>
							<th>거래일</th>
						</tr>
					</thead>
					<tbody id="dataSection">
				
					</tbody>
				</table>
			</div>
		</div>>
<!-- 페이지 내비게이션 표시 -->		

		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<div class="pagination">
					<ul id="paginationBox" class="pagination">
		
					</ul>
				</div>
			</div>
		</div>
      </article>
    </main>

<script type="text/javascript">
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ", ");
}


function getDateStr(myDate){
	return (myDate.getFullYear() + '-' + ('0' + (myDate.getMonth() + 1)).slice(-2) + '-' + ('0' + myDate.getDate()).slice(-2))
}

/* 오늘 날짜를 문자열로 반환 */
function today() {
  var d = new Date()
  return getDateStr(d)
}

/* 오늘로부터 1주일전 날짜 반환 */
function oneWeek() {
  var d = new Date()
  var dayOfMonth = d.getDate()
  d.setDate(dayOfMonth - 7)
  return getDateStr(d)
}

/* 오늘로부터 1개월전 날짜 반환 */
function oneMonth() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 1)
  return getDateStr(d)
}
/* 오늘로부터 3개월전 날짜 반환 */
function threeMonths() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 3)
  return getDateStr(d)
}
/* 오늘로부터 6개월전 날짜 반환 */
function sixMonths() {
  var d = new Date()
  var monthOfYear = d.getMonth()
  d.setMonth(monthOfYear - 6)
  return getDateStr(d)
}


$("#oneWeek").click(function(){
	$(":input[name=startDate]").val(oneWeek());
	$(":input[name=endDate]").val(today());
	$(":input[name=page]").val("1");
	getTransaction();
});
$("#oneMonth").click(function(){
	$(":input[name=startDate]").val(oneMonth());
	$(":input[name=endDate]").val(today());
	$(":input[name=page]").val("1");
	getTransaction();
});
$("#threeMonths").click(function(){
	$(":input[name=startDate]").val(threeMonths());
	$(":input[name=endDate]").val(today());
	$(":input[name=page]").val("1");
	getTransaction();
});

$("#sixMonths").click(function(){
	$(":input[name=startDate]").val(sixMonths());
	$(":input[name=endDate]").val(today());
	$(":input[name=page]").val("1");
	getTransaction();
});

         


$("#btn-search-user").click(function() {
	var startDate = $(":input[name=startDate]").val();
	var endDate = $(":input[name=endDate]").val();
	if (startDate && endDate) {
	$(":input[name=page]").val("1");
	getTransaction();
	} else {
		alert("기간을 입력하세요");					
	}
});
	
$(function () {
	
	getTransaction();
	datePickerSet($("#startDate"), $("#endDate"));
});
	

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


function getTransaction(page) {
	var startDate = $(":input[name=startDate]").val();
	var endDate = $(":input[name=endDate]").val();
	
			$.ajax({
				type: 'POST',
				url : "/admin/getTransaction.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					startDate : startDate,
					endDate : endDate
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					const criteria = result['criteria'];
					const totalDeposit = result['totalDeposit'];
					const totalWithdrawal = result['totalWithdrawal'];
					const totalsales = result['totalsales'];
					var data = "";
					var block = "";
					var saledata = "";

					saledata +="<tr>";
					saledata +="<td>" + numberWithCommas(totalDeposit) +"원</td>";
					saledata +="<td>" + numberWithCommas(totalWithdrawal) +"원</td>";
					saledata +="<td>" + numberWithCommas(totalsales) +"원</td>";
					saledata +="<tr>";
					
					$("#salesdataSection").html(saledata);
					
				
					// 테이블의 row를 삽입하는 부분
					
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].no + "</td>";
						if (list[i]['type'] == '1') {
							data += "<td style='color:red'>게스트입금</td>";
						data += "<td style='color:red'> +" + numberWithCommas(list[i].amount) + "원</td>";
						} else if (list[i]['type'] == '2') {
								data += "<td style='color:blue'>호스트출금</td>";
						data += "<td style='color:blue'> -" + numberWithCommas(list[i].amount) + "원</td>";
						} else {
							data += "<td style='color:green'>게스트환불</td>";
						data += "<td style='color:green'> -" + numberWithCommas(list[i].amount) + "원</td>";
						}
						if (list[i]['toUserNo'] == '0') {
						data += "<td> - </td>";
						}
						else {
							data += "<td>" + list[i].toUserNo + "</td>";
						}
						if (list[i]['toHostNo'] == '0') {
						data += "<td> - </td>";
						}
						else {
							data += "<td>" + list[i].toHostNo + "</td>";
						}
						if (list[i]['accommoBookingNo'] == '0') {
						data += "<td> - </td>";
						}
						else {
							data += "<td>" + list[i].accommoBookingNo + "</td>";
						}
						if (list[i]['activityBookingNo'] == '0') {
						data += "<td> - </td>";
						}
						else {
							data += "<td>" + list[i].activityBookingNo + "</td>";
						}
						data += "<td style='color:red'>" + numberWithCommas(list[i].accumulatedMoney) + "원</td>";
						data += "<td>" + list[i].createdDate + "</td>";
					data += "</tr>";
					}
					$("#dataSection").html(data);
					
					
					
					
					

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getTransaction("
								+ (pagination['beginPage'] - 1)
								+ ")'> < </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getTransaction("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getTransaction("
								+ (pagination['endPage'] + 1)
								+ ")'>  > </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
					}
					
					$("#paginationBox").html(block);
				}
			})
}



</script>