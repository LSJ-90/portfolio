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
          <div> <button name="filterDate" value="1">일주일</button> 
           <button name="filterDate" value="2">3개월</button> 
           <button name="filterDate" value="3">6개월</button> 
           <button name="filterDate" value="4">1년</button>
          </div>
        </form>
		<table class="user-list-table">
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 13%;">
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
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

// 검색 폼트리거


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
					var data = "";
					var block = "";

					console.log(pagination);
					console.log(list);
					console.log(criteria);
					// 테이블의 row를 삽입하는 부분
					
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].no + "</td>";
						data += "<td>" + list[i].type + "</td>";
						data += "<td>" + list[i].amount + "</td>";
						data += "<td>" + list[i].toHostNo + "</td>";
						data += "<td>" + list[i].toUserNo + "</td>";
						data += "<td>" + list[i].accommoBookingNo + "</td>";
						data += "<td>" + list[i].activityBookingNo + "</td>";
						data += "<td>" + list[i].accumulatedMoney + "</td>";
						data += "<td>" + list[i].createdDate + "</td>";
						
						//if (list[i]['answerContent']!=null) {
				//	data += "<td>" + list[i].answerContent + "</td>";
				//		} else {
				//			data += "<td>답변없음</td>";
				//		}
				//		data += "</tr>";
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