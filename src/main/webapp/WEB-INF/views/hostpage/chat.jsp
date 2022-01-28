<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<title>Chatting</title>
	<style>
		

 
.header { font-size: 14px; padding: 15px 0; background: #888; color: white; text-align: center;  }
 
.chat_wrap {height: 550px; overflow-y:auto;} 
.chat_wrap .chat { padding-bottom: 80px; height:85% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
.chat_wrap .chat ul li.right > div.message { text-align: right;}
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.input-div { bottom: 0; height: 80px; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.input-div > textarea { width: 90%; height: 50px; border: none; padding: 10px; margin: 5px 0 0 0;}
 
.chat-list  {border: 1px solid #888; height: 700px;}
.chat-detail  {border: 1px solid #888; height: 700px;}
 
.chat-list-label { font-size: 14px; padding: 15px 0; background: #888; color: white; text-align: center;  }
 
.chatting-list-box {cursor: pointer; font-size: 13px; height: 70px; border: 1px solid #888; padding: 1px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }

.userImg {width: 60px; height: 60px; padding:2px;}
#chatting-detail {display: none;}

		
	</style>
</head>


<body>
	
	
<div class="container">
	<div class="row mb-3">
		<div class="chat-list m-2 col-3 ">
			<div class="chat-list-label">
			예약 문의 리스트
			</div>	
			<c:choose>
				<c:when test="${empty chatList }">
					사용자 없음.
				</c:when>
				<c:otherwise>
					<c:forEach var="chatRoom" items="${chatList }" varStatus="loop">
						<div id="chatting-list-box" class="chatting-list-box m-1" onclick="enter(${chatRoom.chatRoomNo })">
							<div class="row">
								<div class="col-4">
									<img src="../../resources/images/userprofiles/${chatRoom.image }" id="userImg" class="userImg rounded-circle" alt="">
								</div>
								<div class="col-8">
									<p>${chatRoom.name }</p> <!-- 여기서는 유저네임 -->
									<p>${chatRoom.lastMessage }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="chat-middle" class="col-5">
		<div id="chatting-waiting" class="chat-list m-2 ">
			<div class="header">
		        예약 문의 
			</div>
			<c:choose>
			<c:when test="${empty chatList }">
			<div>
				예약상담이 없습니다.
			</div>>
			</c:when>
			<c:otherwise>
			<div>
				예약상담을 시작하기 위해 왼쪽의 리스트에서 게스트를 선택하세요
			</div>
			</c:otherwise>
			</c:choose>
			
		</div>
		<div id="chatting-detail" class="chat-detail m-2">
			<div class="header">
		        예약 문의 
			</div>
			<h1></h1>
			<input type="hidden" id="sessionId" value="">
			<input type="hidden" id="roomNumber" value="">
			<div id="chatting-content" class="chat_wrap" data-bs-spy="scroll">	
				<div class="chat">
					<ul>
					
					</ul>
				</div>	
			</div>
			<div>
			    <div id="yourMsg" class="input-div">
			        <textarea class="chatting" id="chatting" placeholder="Press Enter for send message."></textarea>
			    </div>
		    </div>
		</div>
		</div>
		
		
		<div class="chat-list m-2 col-3">
		
		
	
		
		진행중인 프로모션<br>
		
		예약상황- 달력...하지 말까? 어려우면 그냥 테이블로..<br>
		
		<br>
		- 채팅 누르면 지금 있는 방이 확인되도록 색변화?<br>
		<br>
		- 새 메시지가 있는 경우 빨간 버튼으로 표시 - 많이 힘들 듯<br>
		
		
		<br>
		<br>
		
		
		
		</div>
	</div>
</div>
	

		


 <div class="chat format">
        <ul>
            <li>
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>

</body>

<script type="text/javascript">

	const userName = "홍길동";
	let ws;

	
	function wsOpen(){
		if (ws) {
			ws.close();
		}
		var num = $("#roomNumber").val();
		console.log(num);
		ws = new WebSocket("ws://localhost/chatting/"+$("#roomNumber").val());
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
				    appendMessageTag(LR, msg.senderName, msg.message);
				}else{
					console.log('3');
					let LR = "left";
					appendMessageTag(LR, msg.senderName, msg.message);
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

	  
	function send() {
		var msg = {
			    type: "message", 
			    roomNumber: $("#roomNumber").val(),
				sessionId : $("#sessionId").val(),
			    senderName: userName, 
			    message: $("#chatting").val(), 
			    
			  };
		console.log($("#sessionId").val());
		console.log($("#chatting").val());
		console.log('메세지 보냈음');
		ws.send(JSON.stringify(msg));
	    $('div.input-div textarea').val('');

	}
	
	
	// 메세지 태그 생성
    function createMessageTag(LR, senderName, message) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 
        // 값 채우기
        chatLi.addClass(LR);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);
 
        return chatLi;
    }
 

    // 메세지 태그 append
    function appendMessageTag(LR, senderName, message) {
        const chatLi = createMessageTag(LR, senderName, message);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
        $("#chatting-content").scrollTop($("#chatting-content")[0].scrollHeight);
   
    }
    
    function enter(ChatRoomNo) {
    	
    	
    	if (ChatRoomNo != $("#roomNumber").val()) {
	    	console.log(ChatRoomNo);
	    	console.log('함수버튼 눌렀을 때 받아온 룸넘버');
			$('div.chat:not(.format) ul').empty();
			$("#chatting-waiting").hide();
			$("#chatting-detail").show();
			
			var Myelement = document.getElementById("roomNumber");
			
			console.log('포맷 안 처음 룸넘버');
			console.log(Myelement.value);
			Myelement.value = ChatRoomNo;
			console.log('포맷 안바뀐 룸넘버');
			console.log(Myelement.value);
			
			 
	
			
	    	console.log('여기까지 오키');
			
			$.getJSON('/host/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
				console.log('가져오는 거 오키');
				$.each(messageDtos, function(index, value) {
					
					let LR = (messageDto.sendingUserNo == ${LOGIN_USER.no })? "right" : "left";
			      appendMessageTag(LR, value.sendingUserName, value.content);
				})
	    });
		
			wsOpen();
			
	    } else {
	    	$("#chatting-detail").show();
	    }
    }	
			
</script>
</html>