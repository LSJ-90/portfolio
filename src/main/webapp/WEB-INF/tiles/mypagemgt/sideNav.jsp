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
.header { font-size: 14px; padding: 5px 0; background: #F18C7E; color: white; text-align: center;  }
 
#chatting-content {height: 500px; overflow-y:auto;} 
#chatting-content .chat { padding-bottom: 80px; height:85% }
#chatting-content .chat ul { width: 100%; list-style: none; }
#chatting-content .chat ul li { width: 100%; }
#chatting-content .chat ul li.left { text-align: left; }
#chatting-content .chat ul li.right { text-align: right; }
#chatting-content .chat ul li.right > div.message { text-align: right; }

.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.message { word-break:break-all; margin: 5px 20px; max-width: 40%; 
border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: white; color: #555; text-align: left; }
 
#chatting-content.chat ul li > div { font-size: 15px;  }
#chatting-content .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
#chatting-content .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
#yourMsg { bottom: 0; height: 80px; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
#yourMsg > textarea { width: 90%; height: 50px; border: none; padding: 10px; margin: 5px 0 0 0;}
  
.chatting-list-box {cursor: pointer; font-size: 20px; height: 80px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }

.userImg {width: 60px; height: 60px;}

#modal-content-chat { height: 700px;}

#modal-header-chat {cursor: move; }

#modal-title-chat {font-size: 15px; padding: 2px 0; background: #888; color: white; text-align: center; }

#modal-body-chat {height: 400px; }

#modal-creating-chatting {width: 1000px;}

#left-chat-list {border-right: 1px solid black;}

.name span {font-size: 15px; }

.lastmessage span {font-size: 13px; }

div.chat-list {
 	padding: 1px;
    margin-bottom: 5px;
    border-bottom: 3px solid #efefef;
}

.format {display: none;}

.userImg {width: 60px; height: 60px; padding:2px;}
#senderImg {width: 45px; height: 45px; padding:2px;}

.myMessage {text-align: right; display: inline-block; 
word-break:break-all; margin: 5px 20px; max-width: 40%; border: 1px solid #888; padding: 10px;
 border-radius: 5px; background-color: white; color: #555;  }
.myMessage-box { text-align: right;}

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
      <li class="my-info__item"><a href="/mypage/qna">1:1 문의</a></li>
    </ul>
  </div>
  
  
  
  <div class="modal fade" id="modal-creating-chatting" aria-labelledby="호스트문의" aria-hidden="true">
  	<div class="modal-dialog modal-xl ">
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
							</div>
							<div class="col-7" id="right-chat-message">
								<div id="chatting-detail" class="chat-detail m-2">
									<input type="hidden" id="sessionId" name="sessionId" value="">
									<input type="hidden" id="roomNumber" name="roomNumber" value="">
									<input type="hidden" id="hostUserNo" name="hostUserNo" value="">
									<div id="chatting-content" class="chat_wrap" data-bs-spy="scroll">	
										<div class="chat">
											<ul>
											
											</ul>
										</div>	
									</div>
									<div>
									    <div id="yourMsg" class="input-div">
									        <textarea class="chatting" id="chatting" placeholder="메세지 입력 후 엔터키를 누르세요"></textarea>
									    </div>
								    </div>
								</div>
							</div>
						</div> <!-- row -->
	      			</div> <!-- modal body -->
	      		<div class="modal-footer">
	      		</div> 
	    	</div>
  	</div> <!-- modal dialog -->
</div> <!-- modal fade -->
	
  
  <!--채팅 리스트 -->
   <div class="chat-list format">
        <ul>
            <li>
            	<div class="box p-1 mb-1" onclick="enter(this)">
            		<div class="row">
            			<div class="col-3 p-3">
							   <input type="hidden" id="hostNo" name="hostNo" value="">
							   <input type="hidden" id="chatRoomNumber" name="chatRoomNumber" value="">
			                <img src="../../resources/images/" id="userImg" class="userImg rounded-circle" alt="">
			             </div>   
			             <div class="col-9">
			            	<div class="name">
			                    <span></span>
			                </div>
			                <div class="lastmessage">
			                    <span id="lastmessage"></span>
			                </div>
			             </div>   
			          </div>      
                </div>
            </li>
        </ul>
    </div>

 
 <div class="myChat format">
        <ul>
            <li>
            	<div class="row myMessage-box">
            		<div class="col-7">
            		</div>
	           		<div class="col-5">
		                <div class="row">
		                	<div class="col-3">
		                	</div>
			                <div class="myMessage col-7">
			                    <span></span>
			                </div>
		                </div>
		                <div class="row">
			                <div class="sendingTime">
			                    <small></small>
			                </div>
		                </div>
              	   </div>
                </div>
            </li>
        </ul>
    </div>
		
 
 
		

  <!--대화-->
 
 <div class="chat format">
        <ul>
            <li>	
            	<div class="row message-box">
	           		<div class="col-1 m-1">
						<img src="" id="senderImg" class="senderImg rounded-circle" alt="">
					</div>
					<div class="col">
						<div class="row">
			                <div class="sender">
			                    <span></span>
			                </div>
		                </div>
		                <div class="row">
			                <div class="message col-4">
			                    <span></span>
			                </div>
		                </div>
		                <div class="row">
			                <div class="sendingTime col">
			                    <small></small>
			                </div>
		                </div>
	                </div>
                </div>
            </li>
        </ul>
    </div>



<script type="text/javascript">

function getFullYmdStr(){
    //년월일시분초 문자열 생성
    var d = new Date();
    return d.getFullYear() + ". " + ('0' + (d.getMonth() + 1)).slice(-2) + ". "
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
    
});

//모달창 마우스 드래그로 움직일 수 있게
$("#modal-creating-chatting").draggable({
    handle: ".modal-header"
});


function chatopen() {
	listopen();
	
	let chattingModal = new bootstrap.Modal(document.getElementById('modal-creating-chatting'), {
		keyboard: false
	
	});
		chattingModal.show();
}

//채팅 리스트를 열어줌
function listopen() {

	$('div.chat-list:not(.format) ul').empty();
	var userNo = ${LOGIN_USER.no };
	console.log(userNo);
	
		$.getJSON('/mypage/chat', {no:userNo}, function(chatList) {
		$.each(chatList, function(index, value) {
		
			let chatList = $('div.chat-list.format ul li').clone();
			
			chatList.find('.name span').text(value.name);
			chatList.find('.lastmessage span').text(value.lastMessage);
			chatList.find("input[name='chatRoomNumber']").val(value.chatRoomNo);
			console.log(value.chatRoomNo);
			var src = "../../resources/images/hostMainImage/" + value.image;
			chatList.find(".userImg").attr("src", src);
			chatList.find(".box").attr("id", value.chatRoomNo);

			$('div.chat-list:not(.format) ul').append(chatList);
			
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
			if(msg.sessionId == $("#sessionId").val()){
				console.log('2');
				let LR = "right";
				 appendMyMessageTag(LR, msg.message, msg.sendingTime);
			}else{
				console.log('3');
				let LR = "left";
				 appendMessageTag(LR, msg.senderName, msg.message, msg.sendingTime, msg.senderImg);
				 console.log(msg.sendingTime);
			}
			$("#lastmessage").html(msg.message);
			
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
    function appendMyMessageTag(LR, myMessage, sendingTime)  {
        const myChatLi = createMyMessageTag(LR, myMessage, sendingTime) ;
 
        $('div.chat:not(.format) ul').append(myChatLi);
 
        // 스크롤바 아래 고정
        $("#chatting-content").scrollTop($("#chatting-content")[0].scrollHeight);
   
    }
	// 메세지 태그 생성
    function createMyMessageTag(LR, myMessage, sendingTime) {
        // 형식 가져오기
        let myChatLi = $('div.myChat.format ul li').clone();
 
        // 값 채우기
        myChatLi.addClass(LR);
        myChatLi.find('.myMessage span').text(myMessage);
        myChatLi.find('.sendingTime small').text(sendingTime);
 
        return myChatLi;
    }	
	
	
	
function send() {
	var msg = {
		    type: "message", 
		    roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
		    senderName: userName, 
		    message: $("#chatting").val(), 
		    sendingTime: getFullYmdStr(),
		    senderImg: userImage
		    
		  };
	console.log($("#sessionId").val());
	console.log($("#chatting").val());
	console.log('메세지 보냈음');
	ws.send(JSON.stringify(msg));
    let sendingMessage = $("#chatting").val();
   
    
    $.ajax({
		type: 'POST',								// 요청방식
		url: '/mypage/message.do',										// 요청URL
		data: JSON.stringify({chatRoomNo: $("#roomNumber").val(), sendingUserNo:"${LOGIN_USER.no }", receivingUserNo:$("#hostUserNo").val() , content:sendingMessage}),			// 서버로 보내는 데이터
		contentType: 'application/json',		// 서버로 보내는 데이터의 컨텐츠 타입, 기본값은 "application/x-www-form-urlencoded" 다
		dataType: 'json'		// 서버로부터 응답으로 받을 것으로 예상되는 컨텐츠 타입을 지정한다.
		//success: function(responseData) {					// 서버로부터 성공적인 응답이 왔을 때 실행되는 함수다.
			
		//},
		//error: function() {									// 서버로 보낸 요청이 실패했을 때 실행되는 함수다.
		
		//}
	})
    
	 $('div.input-div textarea').val('');
}
	
	
	// 메세지 태그 생성
   function createMessageTag(LR, senderName, message, sendingTime, senderImg) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 		console.log("여기까지 왓나?"+sendingTime);
        // 값 채우기
        chatLi.addClass(LR);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);
        chatLi.find('.sendingTime small').text(sendingTime);
        var src = "../../resources/images/hostMainImage/" + senderImg;
		chatLi.find(".senderImg").attr("src", src);
 
        return chatLi;
    }
 

    // 메세지 태그 append
   function appendMessageTag(LR, senderName, message, sendingTime, senderImg) {
        const chatLi = createMessageTag(LR, senderName, message, sendingTime, senderImg);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
        $("#chatting-content").scrollTop($("#chatting-content")[0].scrollHeight);
   
    }
    
    function enter(e) {
    		
    	//var ChatRoomNo = $('div.chat-list:not(.format) div.input[name="roomNumber"]').val();
    	//var ChatRoomNo = $("input[name='roomNumber']").val();
    	var ChatRoomNo = e.getAttribute('id');
    	
	    	console.log('함수버튼 눌렀을 때 받아온 룸넘버');
	    	console.log(ChatRoomNo);
	    	//$('div.chat-list:not(.format)').hide();
	    	$('div.chat:not(.format) ul').empty();
			$("#chat-middle").show();
			$("#roomNumber").val(ChatRoomNo);
			
	    	console.log('여기까지 오키');
			
			$.getJSON('/mypage/chat-enter.do', {no:ChatRoomNo}, function(ChattingMessageDto) {
				console.log('가져오는 거 오키');
				$.each(ChattingMessageDto, function(index, value) {
					
					
					if(value.sendingUserNo == userNo){
						console.log('2');
						let LR = "right";
						 appendMyMessageTag(LR, value.content, value.sendingDate);
					}else{
						console.log('3');
						let LR = "left";
						 appendMessageTag(LR, value.sendingUserName, value.content, value.sendingDate, value.sendingUserImage);
					}
					
			     
			      $("input[name='hostUserNo']").val(value.hostingUserNo);
				})
	    });
		
			wsOpen(ChatRoomNo);
			
	    } 
			
</script>

