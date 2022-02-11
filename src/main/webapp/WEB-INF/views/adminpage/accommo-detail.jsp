<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!-- 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 -->	
 <style>

#mainImg { width: 1100px; height:500px;}
</style>
<main id="main">
    <article id="admin-user">
    	<div class="row">
    		<div class="col-12">
    			 <img
	              src="../../resources/images/hostMainImage/${host.mainImage }"
	              id="mainImg"
	            />
    		</div>
    		<div class="col-12">
		    	 <h1 class="section__title">호스트 기본정보</h1>
		    	 <form>
		 		<table class="user-list-table mt-2 mb-5">
					<colgroup>
		            <col style="width: 8%" />
		            <col style="width: 10%" />
		            <col style="width: 8%" />
		            <col style="width: 16%" />
		            <col style="width: 10%" />
		            <col style="width: 10%" />
		            <col style="width: 10%" />
		          </colgroup>
		          <thead>
		            <tr>
		              <th>호스트번호</th>
		              <th>호스트이름</th>
		              <th>회원번호</th>
		              <th>연락처</th>
		              <th>등급</th>
		              <th>승인</th>
		              <th>승인상세</th>
		            </tr>
		          </thead>
					<tbody>
						<tr class="text-middle">
							<td>${host.no }</td>
							<td>${host.name }</td>
							<td>${host.userNo }</td>
							<td>${host.tel }</td>
							<td>${host.gradeName }</td>
							<td>
							<select class="search__select" name="approval">
		            			   <option value="${host.status }" selected disabled="disabled">
		            			   <c:if test="${host.status == 'Y'}">
		            			   승인완료
		            			   </c:if>
		            			   <c:if test="${host.status == 'N'}">
		            			   승인반려
		            			   </c:if>
		            			   <c:if test="${host.status == 'W'}">
		            			   승인대기
		            			   </c:if>
		            			   <c:if test="${host.status == 'D'}">
		            			   호스팅종료
		            			   </c:if>
		            			   <c:if test="${host.status == 'R'}">
		            			   강제종료
		            			   </c:if>
		            			   </option>
		           				   <option value="Y">승인완료</option>
		            			   <option value="N">승인반려</option>
             					   <option value="R">강제종료</option>
							</select>
							</td>
							<td><input type="text" class="search-user" name="statusDetail" value="${host.statusDetail }" /></td>
						</tr>
					</tbody>
				</table>
					 </form>
				  <button type="button" class="btn__search" id="btn-search-userQnA" onclick="modifyStatus()">
	          		변경
	        	</button>
				
				 <h1 class="section__title">출금 정보</h1>
		 		<table class="user-list-table mt-2 mb-3">
					<colgroup>
		            <col style="width: 25%" />
		            <col style="width: 25%" />
		            <col style="width: 25%" />
		            <col style="width: 25%" />
		          </colgroup>
		          <thead>
		            <tr>
		              <th>현재 누적금액</th>
		              <th>예금주</th>
		              <th>계좌번호</th>
		              <th>은행명</th>
		            </tr>
		          </thead>
					<tbody>
						<tr class="text-middle">
							<td><fmt:formatNumber value="${host.accumulatedMoney }" pattern="#,###" />원</td>
							<td>${host.accountHolderName }</td>
							<td>${host.accountNumber }</td>
							<td>${host.bankName }</td>
						</tr>
					</tbody>
				</table>
    		</div>
    	</div>
    	
    
    	
    	<div class="row mt-2">
    	 <h1 class="section__title">숙소정보</h1>
    		<div class="col-12">
    		<table class="user-list-table" border="1"  align = "center" >
				    <tr align = "center">
					<td>체크인</td>
					<td>${accMainDto.accCheckInTime}</td>
					<td>체크아웃</td>
					<td>${accMainDto.accCheckOutime}</td>
					<td colspan="2">연락처</td>
					<td>${host.tel}</td>
				    </tr>
				    <tr align = "center">
					<td>주소</td>
					<td colspan="6">${accMainDto.accAddress}</td>
				    </tr>
    		</table>
    		
    		</div>
    		
    	</div>	
    	<c:if test="${not empty roomList}">
    	<div class="row mt-5">
    	 <h1 class="section__title">객실리스트</h1>
    		<div class="col-12">
				 <table class="user-list-table" border="1"  align = "center" >
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
					 <c:if test="${not empty room.roomImages}">
         			 <tr align = "center">
         			 <c:forEach var="image" items="${room.roomImages}" varStatus="status">
						<td><a href="#"><img src="/resources/images/room/${image.image }"  height="180" width="280" class="" alt="..."></a></td>
					</c:forEach>
				    </tr>        
					</c:if>
					 <c:if test="${empty room.roomImages}">
						<h5>등록된 사진이 없습니다.</h5>
					</c:if>
        		   </c:forEach>
         			        
				</table>
    		</div>
    		
    	</div>	
	</c:if>
    	<c:if test="${empty roomList}">
    	<h5>등록된 객실이 없습니다.</h5>
	</c:if>
    	
     	

  
	</article>
</main>

<script type="text/javascript">
$(function(){
	
	activeMenuTab("숙소관리");
})

	
function modifyStatus(){
	var approval = $("select[name=approval]").val();
	console.log(approval)
	var statusDetail = $.trim($(":input[name=statusDetail]").val());
	
	$.ajax({
		type: 'get',
		url : "/admin/modify-status-host.do", //서비스 주소 
		data : { //서비스 처리에 필요한 인자값
			approval : approval,
			statusDetail : statusDetail,
			hostNo : ${host.no }
		},
		success :function(data) {
			alert('변경완료');
		},
		error : function() {
			alert("error");
		}
	});
	

}



</script>

</html>