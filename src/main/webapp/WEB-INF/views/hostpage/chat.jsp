<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>

<style>
#chatting-detail { height: 530px;
  overflow-y:auto;} 
</style>

<main id="main">
  <article id="host-chat">
  
  <!-- 예약문의 리스트 -->
  
    <section class="chat-list">
      <div class="section-title">예약 문의 리스트</div>
      <div class="section-main">
      <c:choose>
		<c:when test="${empty chatList }">
			사용자 없음
		</c:when>
		<c:otherwise>
	      <ul class="sender-list__menu">
		    <c:forEach var="chatRoom" items="${chatList }" varStatus="loop">
	          <li class="sender-list__item" onclick="enter(${chatRoom.chatRoomNo })">
	            <img
	              src="../../resources/images/userprofiles/${chatRoom.image }"
	              alt="sender-image"
	              id="userImg"
	            />
	            <div class="sender-info">
	              <p class="userName" id="userName">${chatRoom.name }</p>
	              <p class="lastmessage" id="lastmessage-${chatRoom.chatRoomNo }">
	                ${chatRoom.lastMessage }
	              </p>
	              <p class="lastSendingTime" id="lastSendingTime-${chatRoom.chatRoomNo }">
	                <fmt:formatDate value="${chatRoom.updatedDate}" pattern="yyyy.MM.dd HH:mm"/>
	              </p>
	            </div>
	            <div class="unreadcount" id="unreadcount-${chatRoom.chatRoomNo }">
	              ${chatRoom.unreadCount }
	            </div>
	          </li>
        	</c:forEach>
	      </ul>
		</c:otherwise>
      </c:choose>
      </div>
    </section>
    
  <!-- 예약문의 : 채팅창 -->
  
    <section class="chat-message">
      <div class="section-title">예약 문의</div>
      <div class="section-main" id="chatting-content">
      	<div id="chatting-waiting">
	      	<c:choose>
			  <c:when test="${empty chatList }">
				<div>
					예약상담이 없습니다.
				</div>>
			  </c:when>
			  <c:otherwise>
				<div>
					예약상담을 시작하기 위해 왼쪽의 리스트에서 게스트를 선택하세요.
				</div>
			  </c:otherwise>
			</c:choose>
		</div>
		<div id="chatting-detail">
			<input type="hidden" id="sessionId" value="">
			<input type="hidden" id="roomNumber" value="">
	        <ul class="message__list">
	          
	        </ul>
        </div>
      </div>
      <div class="message__chatting">
        <textarea
          class="chatting"
          id="chatting"
          placeholder="Press Enter for sending a message."
        ></textarea>
      </div>
    </section>
    
  <!-- 예약정보 -->  
    <section class="chat-info">
      <div class="section-title">예약 정보</div>
      <div class="section-main">아직 내용이 없다...</div>
    </section>
  </article>
</main>



<script type="text/javascript">
$(document).ready(function () {
	if (ws) {
		ws.close();
	}
	ws = new WebSocket("ws://localhost/chatting/"+"${chatListString}");
	console.log('웹소켓 열림');
	wsEvt();
});

function getFullYmdStr(){
    //년월일시분초 문자열 생성
    var d = new Date();
    return d.getFullYear() + "." + ('0' + (d.getMonth() + 1)).slice(-2) + "."
+ ('0' + d.getDate()).slice(-2) + "    " + ('0' + d.getHours()).slice(-2) + ":" + ('0' + d.getMinutes()).slice(-2);
}

const userNo = "${LOGIN_USER.no }";
const hostName = "${savedHost.name }";
const hostImg = "${savedHost.mainImage }";
let ws;

var textarea = document.getElementById('chatting');
textarea.addEventListener("keydown", function(e){
	if(e.keyCode == 13){ 
		send();
	}
});	
	
		
function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			
			console.log('메세지 받기 시도');
			var msg = JSON.parse(data.data);
			console.log('메세지 받았음');
			if(msg.type == "getId"){
				var si = msg.sessionId != null ? msg.sessionId : "";
				if(si != ''){
					$("#sessionId").val(si); 
					console.log('1');
				}
			}else if(msg.type == "message"){
				$("#lastmessage-"+msg.roomNumber).html(msg.message);
				$("#lastSendingTime-"+msg.roomNumber).html(msg.sendingTime);
				if(msg.sessionId == $("#sessionId").val() &&  msg.roomNumber == $("#roomNumber").val()){
					console.log('2');
				    appendMyMessage(msg.message, msg.sendingTime, msg.checked);
				}else if(msg.sessionId != $("#sessionId").val() &&  msg.roomNumber == $("#roomNumber").val()){
					console.log('3');
					ChangeToZeroChecked($("#roomNumber").val()); //메시지 읽음 확인
				    appendMessage(msg.senderName, msg.message, msg.sendingTime, msg.senderImg);
				}  else {
					var unreadCount = Number($("#unreadcount-"+msg.roomNumber).html())+1;
					$("#unreadcount-"+msg.roomNumber).html(unreadCount);
				}
			}else if(msg.type = "check" && msg.sessionId != $("#sessionId").val()) {
				
				if (msg.roomNumber == $("#roomNumber").val()) {
					console.log('4');
					
				$(".readStatus").text("(읽음)");
				}
			}else{
				console.warn("unknown type!")
			}
		}
}
	
	
	


	  
	function send() {
		var msg = {
			    type: "message", 
			    roomNumber: $("#roomNumber").val(),
				sessionId : $("#sessionId").val(),
			    senderName: hostName, 
			    message: $("#chatting").val(), 
			    sendingTime: getFullYmdStr(),
			    senderImg: hostImg,
			    checked: "N"
			    
			  };
		console.log($("#sessionId").val());
		console.log($("#chatting").val());
		console.log($("#roomNumber").val());
		console.log('메세지 보냈음');
		ws.send(JSON.stringify(msg));
		
		   
	    $.ajax({
			type: 'POST',								// 요청방식
			url: '/host/message.do',										// 요청URL
			data: JSON.stringify({chatRoomNo: $("#roomNumber").val(), sendingUserNo:userNo, content:$("#chatting").val()}),			// 서버로 보내는 데이터
			contentType: 'application/json',		// 서버로 보내는 데이터의 컨텐츠 타입, 기본값은 "application/x-www-form-urlencoded" 다
			dataType: 'json'		// 서버로부터 응답으로 받을 것으로 예상되는 컨텐츠 타입을 지정한다.
			//success: function(responseData) {					// 서버로부터 성공적인 응답이 왔을 때 실행되는 함수다.
				
			//},
			//error: function() {									// 서버로 보낸 요청이 실패했을 때 실행되는 함수다.
			
			//}
		})
		
	    $('#chatting').val('');

	}
	
	
	 
	function ChangeToZeroChecked(ChatRoomNo) {
		console.log("체크메시지 전송")
	    	var msg = {
	    		    type: "check", 
	    		    roomNumber: $("#roomNumber").val(),
	    			sessionId : $("#sessionId").val()
	    		  };
	    	ws.send(JSON.stringify(msg));
	       
	    	 $.ajax({
	 			type: 'POST',								// 요청방식
	 			url: '/host/checkMessage',										// 요청URL
	 			data: JSON.stringify({"no": ChatRoomNo}),	// 서버로 보내는 데이터
	 			contentType: 'application/json',		// 서버로 보내는 데이터의 컨텐츠 타입, 기본값은 "application/x-www-form-urlencoded" 다
	 			dataType: 'json'		// 서버로부터 응답으로 받을 것으로 예상되는 컨텐츠 타입을 지정한다.
	 				//success: function(responseData) {					// 서버로부터 성공적인 응답이 왔을 때 실행되는 함수다.
	 					
	 				//},
	 				//error: function() {									// 서버로 보낸 요청이 실패했을 때 실행되는 함수다.
	 				
	 				//}
	 		})
	    	
	    	
	    	
	    }
		

	
	
	
	


    // 메세지 태그 append
    function appendMessage(senderName, message, sendingTime, senderImg) {
    	var data ="";
    	data +=
    	 "<li class='message__item left'><img src='../../resources/images/userprofiles/"+senderImg+"' alt='sender-image' id='senderImg'/>";
        data += "<div class='message-box'>";
        data += "<p class='sender'>"+senderName+"</p>";
        data += "<p class='message'>"+message+"</p>";
       data += "</div>";
       data += "<p class='sendingTime left'>"+sendingTime+"</p></li>"
  	
    	
   		$(".message__list").append(data);
 
        // 스크롤바 아래 고정
        $("#chatting-detail").scrollTop($("#chatting-detail")[0].scrollHeight);
   
    }
    
    
    // 메세지 태그 append
    function appendMyMessage(myMessage, sendingTime, checked)  {
    	if(checked == 'N') {
        	checked = "(읽지않음)";
        } else {
        	checked = "(읽음)";
        	
        }
    	var data ="";
    	data += "<li class='message__item right'>"
    	data += "<div class='my-message-info'>"
    	data += "<p class='readStatus'>"+checked+"</p>"
    	data += "<p class='sendingTime'>"+sendingTime+"</p>"
    	data += "</div>"
    	data += "<p class='myMessage'>"+myMessage+"</p>"
    	data += "</li>"
    	
    	$(".message__list").append(data);
 
 
        // 스크롤바 아래 고정
        $("#chatting-detail").scrollTop($("#chatting-detail")[0].scrollHeight);
   
    }
	
 
    
    
    function enter(ChatRoomNo) {
    	
    	
    	if (ChatRoomNo != $("#roomNumber").val()) {
	    	console.log(ChatRoomNo);
	    	console.log('함수버튼 눌렀을 때 받아온 룸넘버');
			$('.message__list').empty();
			$("#chatting-waiting").hide();
			$("#chatting-detail").show();
			
			var Myelement = document.getElementById("roomNumber");
			
			console.log('포맷 안 처음 룸넘버');
			console.log(Myelement.value);
			Myelement.value = ChatRoomNo;
			console.log('포맷 안바뀐 룸넘버');
			console.log(Myelement.value);
		 	ChangeToZeroChecked(ChatRoomNo); //메시지 읽음 확인
			$("#unreadcount-"+ChatRoomNo).empty();
			 
			
	    	console.log('여기까지 오키');
			
			$.getJSON('/host/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
				console.log('가져오는 거 오키');
				$.each(messageDtos, function(index, value) {
					
					if(value.sendingUserNo == userNo){
						console.log('2');
						console.log(value.checked);
						appendMyMessage(value.content, value.sendingDate, value.checked);
					}else{
						console.log('3');
						 appendMessage(value.sendingUserName, value.content, value.sendingDate, value.sendingUserImage);
					}
					
				})
	    });
		
			
			
	    } else {
	    	$("#chatting-detail").show();
	    }
    }	
    

  
	
			
</script>
</html>