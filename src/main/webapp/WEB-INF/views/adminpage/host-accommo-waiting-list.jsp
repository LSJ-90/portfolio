<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>

 <main id="main">
      <article id="admin-user">
        <form class="search-user__form" id="form-search-user" method="get" action="withdrawal">
          <input type="hidden" name="page" value="1" />
          <ul class="search-bar">
     		 <li><button type="button" class="btn__search" id="btn-withdrawal-submit" onclick="">선택 승인</button><li>
     		 <li><button type="button" class="btn__search" id="btn-withdrawal" onclick="location.href='/admin/withdrawal'">승인 완료 목록</button><li>
	          <li>
		        <select class="search__select" name="opt">
					<option value="" selected disabled="disabled">검색조건</option>
					<option value="호스트번호">호스트번호</option>
					<option value="호스트이름">호스트이름</option>
				</select>
	          </li>
	          <li>
		        <input
		              type="text"
		              class="search-user"
		              name="value"
		              value=""
		          />
		          <button type="button" class="btn__search" id="btn-search-user">검색</button>
	          </li>
          </ul>
        </form>
		<form class="" id="withdrawal-approval" method="post" action="withdrawal-approval">
		<table class="user-list-table">
			<colgroup>
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 15%;">
				<col style="width: 15%;">
				<col style="width: 11%;">
				<col style="width: 8%;">
				<col style="width: 13%;">
				<col style="width: 16%;">
			
			</colgroup>
			<thead>
				<tr>
					<th class="style"><input type='checkbox' name='withdrawal'  value='selectall' class="selectAll"/>전체선택</th>
					<th class="style">호스트번호</th>
					<th class="style">호스트이름</th>
					<th class="style">금액</th>
					<th class="style">예금주</th>
					<th class="style">계좌번호</th>
					<th class="style">은행</th>
					<th class="style">승인</th>
					<th class="style">출금신청일</th>
				</tr>
			</thead>
				<tbody id="dataSection">
		
			</tbody>
		</table>
		</form>

		
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

$(document).ready(function() {
	getWithdrawal();
});

function getWithdrawal(page) {
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
			$.ajax({
				type: 'POST',
				url : "/admin/getWithdrawal.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					opt : opt,
					value : value
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
			
					var data = "";
					var block = "";
					

					// 테이블의 row를 삽입하는 부분
					
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td><input type='checkbox' name='withdrawal' value=" + list[i].withdrawalNo + "></td>";
						data += "<td>" + list[i].hostNo + "</td>";
						data += "<td>" + list[i].hostName + "</td>";
						data += "<td style='color:red'> +" + numberWithCommas(list[i].amount) + "원</td>";
						data += "<td>" + list[i].accountHolderName + "</td>";
						data += "<td>" + list[i].accountNumber + "</td>";
						data += "<td>" + list[i].bankName + "</td>";
						data += "<td>승인대기</td>";
						data += "<td>" + list[i].createdDate + "</td>";
						data += "</tr>";
					}
					$("#dataSection").html(data);
					
						
						

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
								+ (pagination['beginPage'] - 1)
								+ ")'> < </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawal("
								+ (pagination['endPage'] + 1)
								+ ")'>  > </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
					}
					
					$("#paginationBox").html(block);
				}
			})
}



$(function(){
    $("[type=checkbox][name=withdrawal]").on("change", function(){ //0
        var check = $(this).prop("checked"); //1
        //전체 체크
        if($(this).hasClass("selectAll")){ //2
            $("[type=checkbox][name=withdrawal]").prop("checked", check);

        //단일 체크
        }else{ //3
            var all = $("[type=checkbox][name=withdrawal].selectAll");
            var allcheck = all.prop("checked")
            if(check != allcheck){ //3-1
                var len = $("[type=checkbox][name=withdrawal]").not(".selectAll").length; //3-2
                var ckLen = $("[type=checkbox][name=withdrawal]:checked").not(".selectAll").length; //3-2
                if(len === ckLen){ //3-3
                    all.prop("checked", true);
                }else{
                    all.prop("checked", false);
                }
            }
        }
    });
});

function checkboxArr() {
    var checkArr = [];     // 배열 초기화
    $("input[name='withdrawal']:checked").each(function(i) {
        checkArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
    })
 
    $.ajax({
        url: 'approveWithdrawal'
        , type: 'post'
        , dataType: 'text'
        , data: {
        	withdrawalNoList: checkArr
        }
    });
}




$("#btn-withdrawal-submit").click(function(){
	
	checkboxArr();
	getWithdrawal();
});

//$(function(){
//$("input[name='withdrawal']:checked").val();
//})
</script>