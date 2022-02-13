<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>

<main id="main">
  <article id="main-room">
  
  <!-- 왼쪽 객실 목록 -->
    <section class="main-room__nav">
      <div class="main-room__insert">
        <a href="/host/insertRoom?hostNo=${param.hostNo }&hostingType=${param.hostingType }">
          <i class="fa-solid fa-clipboard-check"></i></i>객실 등록</a>
      </div>
      <ul class="main-room__list">
        <c:forEach var="roomListDto" items="${roomListDto }">
	        <li class="main-room__item">
	          <a href="#" class="roomNo" id="${roomListDto.no}">${roomListDto.name }</a>
	        </li>
        </c:forEach>
      </ul>
    </section>
    
   <!-- 오른쪽 객실 컨텐츠 --> 
    <section class="main-room__content" id="contents">
	    <c:forEach var="roomListDto" items="${roomListDto }" varStatus="status">

	        <c:if test="${status.first}">
	          <div class="main-room__wrap ${roomListDto.no}" id="${roomListDto.no }">
			      <div class="main-room__info-box">
			        <c:forEach var="image" items="${roomListDto.roomImages}">
				        <div class="main-room__img" 
				          style='background-image: url("/resources/images/room/${image.image }")'>
				        </div>
			        </c:forEach>
			        <div class="main-room__info">
			          <div class="main-room__name">${roomListDto.name }</div>
			          <ul class="accommo-info__list">
			            <li class="accommo-info__item">
			              <div class="accommo-info__label">체크인/아웃</div>
			              <div class="accommo-info__content">14:00/11:00</div>
			            </li>
			            <li class="accommo-info__item">
			              <div class="accommo-info__label">기준인원(최대)</div>
			              <div class="accommo-info__content">${roomListDto.standardNumber } (${roomListDto.maximumNumber })명</div>
			            </li>
			          </ul>
			          <table class="accommo-info__table">
			            <colgroup>
			              <col style="width: 24%" />
			              <col style="width: 24%" />
			              <col style="width: 24%" />
			              <col style="width: 28%" />
			            </colgroup>
			            <thead>
			              <tr>
			                <th>평일</th>
			                <th>주말</th>
			                <th>성수기</th>
			                <th>
			                  기준초과시 <br />
			                  인당가격
			                </th>
			              </tr>
			            </thead>
			            <tbody>
			              <tr>
			                <td><fmt:formatNumber value="${roomListDto.weekdaysPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.weekendPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.peakSeasonPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.pricePerPerson }" pattern="##,###"/>원</td>
			              </tr>
			            </tbody>
			          </table>
			          <div class="main-room__modify">
			            <button class="btn__room-modify"
			              onclick="location.href='/host/roomModify?hostNo=${param.hostNo }&hostingType=${param.hostingType }&roomNo=${roomListDto.no}'">
			              객실수정
			             </button>
			          </div>
			        </div>
			      </div>
			      <div class="main-room__service">
			        <div class="main-room__features">
			          <div class="service-label">FEATURES</div>
			          <div class="service-content" id="feature">
			            ${roomListDto.feature }
			          </div>
			        </div>
			        <div class="main-room__amenities">
			          <div class="service-label">AMENITIES</div>
			          <div class="service-content" id="amenity">
			            ${roomListDto.amenity }
			          </div>
			        </div>
			      </div>
		      </div>
	        </c:if>
	        
	        <c:if test="${!status.first}">
	          <div class="main-room__wrap ${roomListDto.no} d-none" id="${roomListDto.no }">
			      <div class="main-room__info-box">
			        <c:forEach var="image" items="${roomListDto.roomImages}">
				        <div class="main-room__img" 
				          style='background-image: url("/resources/images/room/${image.image }")'>
				        </div>
			        </c:forEach>
			        <div class="main-room__info">
			          <div class="main-room__name">${roomListDto.name }</div>
			          <ul class="accommo-info__list">
			            <li class="accommo-info__item">
			              <div class="accommo-info__label">체크인/아웃</div>
			              <div class="accommo-info__content">14:00/11:00</div>
			            </li>
			            <li class="accommo-info__item">
			              <div class="accommo-info__label">기준인원(최대)</div>
			              <div class="accommo-info__content">${roomListDto.standardNumber } (${roomListDto.maximumNumber })명</div>
			            </li>
			          </ul>
			          <table class="accommo-info__table">
			            <colgroup>
			              <col style="width: 24%" />
			              <col style="width: 24%" />
			              <col style="width: 24%" />
			              <col style="width: 28%" />
			            </colgroup>
			            <thead>
			              <tr>
			                <th>평일</th>
			                <th>주말</th>
			                <th>성수기</th>
			                <th>
			                  기준초과시 <br />
			                  인당가격
			                </th>
			              </tr>
			            </thead>
			            <tbody>
			              <tr>
			                <td><fmt:formatNumber value="${roomListDto.weekdaysPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.weekendPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.peakSeasonPrice }" pattern="##,###"/>원</td>
			                <td><fmt:formatNumber value="${roomListDto.pricePerPerson }" pattern="##,###"/>원</td>
			              </tr>
			            </tbody>
			          </table>
			          <div class="main-room__modify">
			            <button class="btn__room-modify"
			              onclick="location.href='/host/roomModify?hostNo=${param.hostNo }&hostingType=${param.hostingType }&roomNo=${roomListDto.no}'">
			              객실수정
			             </button>
			          </div>
			        </div>
			      </div>
			      <div class="main-room__service">
			        <div class="main-room__features">
			          <div class="service-label">FEATURES</div>
			          <div class="service-content" id="feature">
			            ${roomListDto.feature }
			          </div>
			        </div>
			        <div class="main-room__amenities">
			          <div class="service-label">AMENITIES</div>
			          <div class="service-content" id="amenity">
			            ${roomListDto.amenity }
			          </div>
			        </div>
			      </div>
		      </div>
	        </c:if>
	        
	      </c:forEach>
    </section>
  </article>
</main>



<script type="text/javascript">
activeMenu('객실관리');

$(function() {
 	$('.roomNo').on('click', function(e){
		var atagId = this.id;
		
		var li = $('#contents').find('.main-room__wrap')
		$.each(li, function(index, item){
			if(atagId == item.id){
				$(item).attr('class', '');
			} else {
				$(item).attr('class', 'd-none');
			}
		});
	});
})

$(function() {
      var a = $('#feature').text();
      var b = a.replaceAll(/,/gi, "\u00a0\u00a0\u00a0");
      $('#feature').text(b);
   })
   
   $(function() {
      var a = $('#amenity').text();
      var b = a.replaceAll(/,/gi, "\u00a0\u00a0\u00a0");
      $('#amenity').text(b);
   })
</script>

