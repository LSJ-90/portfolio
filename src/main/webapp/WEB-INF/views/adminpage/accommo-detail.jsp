<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!-- 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 -->	
 <style>

#mainImg { width: 450px; height:350px;}
</style>
<main id="main">
    <article id="admin-user">
    	<p>호스트 기본 정보</p>
    	<div class="row">
    		<div class="col-4">
    			 <img
	              src="../../resources/images/hostMainImage/${host.mainImage }"
	              id="mainImg"
	            />
    		</div>
    		<div class="col-8">
		 		<table class="user-list-table">
					<colgroup>
		            <col style="width: 5%" />
		            <col style="width: 5%" />
		            <col style="width: 6%" />
		            <col style="width: 16%" />
		            <col style="width: 6%" />
		            <col style="width: 8%" />
		            <col style="width: 8%" />
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
		              <th>누적금</th>
		            </tr>
		          </thead>
					<tbody>
						<tr class="text-middle">
							<td>${host.no }</td>
							<td>${host.name }</td>
							<td>${host.userNo }</td>
							<td>${host.tel }</td>
							<td>${host.gradeName }</td>
							<td>${host.status }</td>
							<td>${host.statusDetail }</td>
							<td><fmt:formatNumber value="${host.accumulatedMoney }" pattern="#,###" />원</td>
						</tr>
					</tbody>
				</table>
    		</div>
    	</div>
    	
    	<p>숙소정보</p>
    	<div class="row">
    		<div class="col-4">
    		</div>
    		
    	</div>	
    	
    	<p>객실 리스트</p>
    	<div class="row">
    		<div class="col-4">
    		</div>
    		
    	</div>	
    	
    	<p>출금정보</p>
    	<div class="row">
    		<div class="col-4">
    		</div>
    		
    	</div>	
     	

  
	</article>
</main>

<script type="text/javascript">



</script>

</html>