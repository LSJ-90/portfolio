<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
 
#chatting-detail { height: 530px;
  overflow-y:auto;} 
.format {display: none;}


</style>

  <div class="mypage__menu">
    <ul class="menu__my-stay">
      <li class="my-stay__item title">My Stay</li>
      <li class="my-stay__item">
        <a href="/mypage/myrevlist" class="active">예약정보</a>
      </li>
      <li class="my-stay__item"><a href="/mypage/mylovelist">관심 스테이</a></li>
      <li class="my-stay__item"><a href="/mypage/mytourlist">다녀온 스테이</a></li>
      <li class="my-stay__item" id="guest-chat" onclick="chatopen()">
      <span>호스트 문의</span>
         <img
           src="../../resources/images/main/chat_icon.png"
           alt="chat-icon"
           class="chat-icon"
         />
      </li>
    </ul>
    <ul class="menu__my-info">
      <li class="my-info__item title">내 계정</li>
      <li class="my-info__item"><a href="/mypage/userupdate">회원 정보 수정</a></li>
      <li class="my-info__item"><a href="/mypage/qna?page=1">1:1 문의</a></li>
    </ul>
  </div>
  
  
  
  <div class="modal fade" id="modal-creating-chatting" aria-labelledby="호스트문의" aria-hidden="true">
  	<div class="modal-dialog modal-xl ">
			<input type="hidden" id="sessionId" name="sessionId" value="">
	    	<div class="modal-content" id="modal-content-chat">
	      		<div class="modal-header" id="modal-header-chat">
	        		<h5 class="modal-title" id="modal-title-chat">호스트 문의 목록</h5>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      			<div class="modal-body" id="modal-body-chat">
	      				<div class="row mb-3">
							<div class="col-5" id="left-chat-list">
								<div class="chat-list">
									<ul>
										
									</ul>
								</div>	
							</div> <!-- 채팅 목록 -->
							<div class="col-7" id="right-chat-message">
								 <section class="chat-message">
							      <div class="section-title">예약 문의</div>
							      <div class="section-main" id="chatting-content">
									<div id="chatting-detail">
										<input type="hidden" id="sessionId" value="">
										<input type="hidden" id="roomNumber" value="">
								        <ul class="message__list">
								           <li>대화를 시작하기 위해 좌측의 리스트에서 대화를 클릭해주세용~~ 어쩌구 저쩌구</li>
								        </ul>
							        </div>
							      </div>
							      <div class="message__chatting" style="display:none;">
							        <textarea
							          class="chatting"
							          id="chatting"
							          placeholder="Press Enter for sending a message."
							        ></textarea>
							      </div>
							    </section>
							</div>
						</div> <!-- row -->
	      			</div> <!-- modal body -->
	      		<div class="modal-footer">
	      		</div> 
	    	</div>
  	</div> <!-- modal dialog -->
</div> <!-- modal fade -->
	
  
 
		



<script type="text/javascript">

function getFullYmdStr(){
    //년월일시분초 문자열 생성
    var d = new Date();
    return d.getFullYear() + "." + ('0' + (d.getMonth() + 1)).slice(-2) + "."
+ ('0' + d.getDate()).slice(-2) + "   " + ('0' + d.getHours()).slice(-2) + ":" + ('0' + d.getMinutes()).slice(-2);
}

const userNo = "${LOGIN_USER.no }";
const userName = "${LOGIN_USER.name }";
const userImage = "${LOGIN_USER.image }";
let ws;

$(document).ready(function () {

    var modalWidth = $('#modal-creating-chatting').width();
    $('#modal-creating-chatting').css("left", "50%");
    $('#modal-creating-chatting').css("width", modalWidth);
    $('#modal-creating-chatting').css("margin", (modalWidth/2)*-1);
    
    var modalHeight = $('#modal-creating-chatting').height();
    $('#modal-creating-chatting').css("top", "60%");
    $('#modal-creating-chatting').css("height", modalHeight);
    $('#modal-creating-chatting').css("margin", (modalHeight/2)*-1);
    
});<!--모달창 위치 조절-->

//모달창 마우스 드래그로 움직일 수 있게
$("#modal-creating-chatting").draggable({
    handle: ".modal-header"
});


function chatopen() {//모달창 띄우기
	listopen();
	
	let chattingModal = new bootstrap.Modal(document.getElementById('modal-creating-chatting'), {
		keyboard: false
	
	});
		chattingModal.show();
}

//채팅 리스트를 열어줌
function listopen() {

	$('div.chat-list:not(.format) ul').empty();
	console.log(userNo);
	
	
	
		$.getJSON('/mypage/chat', {no:userNo}, function(result) {
			
			
			const chatList = result['chatList'];
			const chatListString = result['chatListString'];
			wsOpen(chatListString);
			console.log(chatList);
			console.log(chatListString);
		$.each(chatList, function(index, value) {
			
		var data ="";
			data +=  "<li class='sender-list__item' onclick='enter("+value.chatRoomNo+")'>";
			data +=  "<img src='../../resources/images/hostMainImage/"+value.image+"' id='userImg' class='userImg rounded-circle' alt='sender-image'>";
			data +=  "<div class='sender-info'>";
			data +=  " <input type='hidden' id='hostNo' name='hostNo' value=''>";
			data +=  " <input type='hidden' id='chatRoomNumber' name='chatRoomNumber' value='"+value.chatRoomNo+"'>";
			data +=  "<p class='userName' id='userName'>"+value.name+"</p>";
			data += "<p class='lastmessage' id='lastmessage-"+value.chatRoomNo+"'>"+value.lastMessage+"</p>";
			data += "<p class='lastSendingTime' id='lastSendingTime-"+value.chatRoomNo+"'>"+value.updatedDate+"</p>";
			if (value.unreadCount != 0) {
			data += "</div><div class='unreadcount' id='unreadcount-"+value.chatRoomNo+"'>"+value.unreadCount+"</div></li>";
			} else {
			data += "</div><div class='unreadcount' style='display:none;' id='unreadcount-"+value.chatRoomNo+"'>"+value.unreadCount+"</div></li>";
			}
			
			$('div.chat-list:not(.format) ul').append(data);
			
			
		})
		
	});
		
		
	
}


function wsOpen(ChatRoomNo){
	if (ws) {
		ws.close();
	}
	//var num = $("#roomNumber").val();
	console.log(ChatRoomNo);
	ws = new WebSocket("ws://localhost/chatting/"+ChatRoomNo);
	console.log('웹소켓 열림');
	wsEvt();
}
	
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
			if(msg.sessionId == $("#sessionId").val() &&  msg.roomNumber == $("#roomNumber").val()){
				console.log('2');
				 appendMyMessage(msg.message, msg.sendingTime, msg.checked);
			} else if(msg.sessionId != $("#sessionId").val() &&  msg.roomNumber == $("#roomNumber").val()) {
				console.log('3');
				ChangeToZeroChecked($("#roomNumber").val()); //메시지 읽음 확인
				 appendMessage(msg.senderName, msg.message, msg.sendingTime, msg.senderImg);
				 console.log(msg.sendingTime);
			} else {
				var unreadCount = Number($("#unreadcount-"+msg.roomNumber).html())+1;
				$("#unreadcount-"+msg.roomNumber).text(unreadCount);
				$("#unreadcount-"+msg.roomNumber).show();
			}
			let lastClass = "lastmessage-"+ msg.roomNumber;
			console.log(lastClass);
			$("#lastSendingTime-"+msg.roomNumber).text(msg.sendingTime);
			$("#" + lastClass).text(msg.message);
			
		}else if(msg.type = "check" && msg.sessionId != $("#sessionId").val()) {
			
				console.log('체크메시지 받음');
			
			if (msg.roomNumber == $("#roomNumber").val()) {
				console.log('4');
				
			$(".readStatus small").text("읽음");
			}
		}else{
			console.warn("unknown type!")
		}
	}

	
}
	var textarea = document.getElementById('chatting');
	textarea.addEventListener("keydown", function(e){
		if(e.keyCode == 13){ 
			send();
		}
	});


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
			url: '/mypage/checkMessage',										// 요청URL
			data: JSON.stringify({"no": ChatRoomNo}),	// 서버로 보내는 데이터
			contentType: 'application/json',		// 서버로 보내는 데이터의 컨텐츠 타입, 기본값은 "application/x-www-form-urlencoded" 다
			dataType: 'json'		// 서버로부터 응답으로 받을 것으로 예상되는 컨텐츠 타입을 지정한다.
				//success: function(responseData) {					// 서버로부터 성공적인 응답이 왔을 때 실행되는 함수다.
					
				//},
				//error: function() {									// 서버로 보낸 요청이 실패했을 때 실행되는 함수다.
				
				//}
		})
		
	
	
}
	
	

	
	
function send() {
	var msg = {
		    type: "message", 
		    roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
		    senderName: userName, 
		    message: $("#chatting").val(), 
		    sendingTime: getFullYmdStr(),
		    senderImg: userImage,
		    checked: "N"
		    
		  };
	console.log($("#sessionId").val());
	console.log($("#chatting").val());
	console.log('메세지 보냈음');
	ws.send(JSON.stringify(msg));
    let sendingMessage = $("#chatting").val();
   
    
    $.ajax({
		type: 'POST',								// 요청방식
		url: '/mypage/message.do',										// 요청URL
		data: JSON.stringify({chatRoomNo: $("#roomNumber").val(), sendingUserNo:"${LOGIN_USER.no }", content:sendingMessage}),			// 서버로 보내는 데이터
		contentType: 'application/json',		// 서버로 보내는 데이터의 컨텐츠 타입, 기본값은 "application/x-www-form-urlencoded" 다
		dataType: 'json'		// 서버로부터 응답으로 받을 것으로 예상되는 컨텐츠 타입을 지정한다.
		//success: function(responseData) {					// 서버로부터 성공적인 응답이 왔을 때 실행되는 함수다.
			
		//},
		//error: function() {									// 서버로 보낸 요청이 실패했을 때 실행되는 함수다.
		
		//}
	})
    
	
    $('#chatting').val('');
}
	
	
	
 
   // 메세지 태그 append
   function appendMessage(senderName, message, sendingTime, senderImg) {
   	var data ="";
   	data +=
   	 "<li class='message__item left'><img src='../../resources/images/hostMainImage/"+senderImg+"' alt='sender-image' id='senderImg'/>";
       data += "<div class='message-box'>";
       data += "<p class='sender'>"+senderName+"</p>";
       data += "<p class='message'>"+message+"</p>";
      data += "</div>";
      data += "<p class='sendingTime left'>"+sendingTime+"</p></li>"
 	
   

 		$(".message__list").append(data);
 
        // 스크롤바 아래 고정
        $("#chatting-detail").scrollTop($("#chatting-detail")[0].scrollHeight);
   
    }
    
    function enter(ChatRoomNo) {
    		
    	//var ChatRoomNo = $('div.chat-list:not(.format) div.input[name="roomNumber"]').val();
    	//var ChatRoomNo = $("input[name='roomNumber']").val();
    	
    	
	    	console.log('함수버튼 눌렀을 때 받아온 룸넘버');
	    	console.log(ChatRoomNo);
	    	//$('div.chat-list:not(.format)').hide();
	    	$('div.chat:not(.format) ul').empty();
	    	$('.message__chatting').show();
			$("#chat-middle").show();
			$("#roomNumber").val(ChatRoomNo);
			ChangeToZeroChecked(ChatRoomNo); //메시지 읽음 확인
			$("#unreadcount-"+ChatRoomNo).empty();
			$("#unreadcount-"+ChatRoomNo).hide();
			
	    	console.log('여기까지 오키');
			
			$.getJSON('/mypage/chat-enter.do', {no:ChatRoomNo}, function(ChattingMessageDto) {
				console.log('가져오는 거 오키');
				$.each(ChattingMessageDto, function(index, value) {
					
					
					if(value.sendingUserNo == userNo){
						console.log('2');
						 appendMyMessage(value.content, value.sendingDate, value.checked);
					}else{
						console.log('3');
						 appendMessage(value.hostName, value.content, value.sendingDate, value.hostImage);
					}
					
			     
			      $("input[name='hostUserNo']").val(value.hostingUserNo);
				})
	    });
		
			
			
	    } 
			
</script>

