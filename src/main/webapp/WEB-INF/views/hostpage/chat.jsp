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
		

 
 
.chat_wrap {height: 550px; overflow-y:auto;} 
.chat_wrap .chat { padding-bottom: 80px; height:85% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
.chat_wrap .chat ul li.right > div.myMessage-box { text-align: right;}
.chat_wrap .chat ul li.left > div.message-box { text-align: left;}
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 40%; 
border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: white; color: #555; text-align: left; }
.myMessage {text-align: right; display: inline-block; 
word-break:break-all; margin: 5px 20px; max-width: 40%; border: 1px solid #888; padding: 10px;
 border-radius: 5px; background-color: white; color: #555;  }
.myMessage-box { text-align: right;}

.input-div { bottom: 0; height: 80px; width: 100%; background-color: transparent; text-align: center;  }
.input-div > textarea { width: 90%; height: 50px; border: 1px solid rgba(75, 192, 192, 0.2); padding: 5px; margin: 5px 0 0 0; border-radius:16px;}
 
#chat-left  {border: 1px solid rgba(201, 203, 207, 0.5); height: 700px; border-radius:16px; background-color: rgba(201, 203, 207, 0.1);}
#chat-middle  {border: 1px solid rgba(201, 203, 207, 0.5); height: 700px; border-radius:16px; background-color: rgba(201, 203, 207, 0.1);}
#chat-right  {border: 1px solid rgba(201, 203, 207, 0.5); height: 700px; border-radius:16px; background-color: rgba(201, 203, 207, 0.1);}
#left-header  {font-size: 14px; border: 1px solid rgba(75, 192, 192); height: 45px; border-radius:16px; background-color: rgba(75, 192, 192, 0.2); text-align: center;}
#middle-header  {font-size: 14px; border: 1px solid rgba(75, 192, 192); height: 45px; border-radius:16px; background-color: rgba(75, 192, 192, 0.2); text-align: center;}
#right-header  {font-size: 14px; border: 1px solid rgba(75, 192, 192); height: 45px; border-radius:16px; background-color: rgba(75, 192, 192, 0.2); text-align: center;}
 
 
#chatting-list-box {cursor: pointer; font-size: 13px; height: 70px; margin:4px; 
 border: 1px solid rgba(255, 205, 86, 1); padding: 4px; border-radius: 5px; 
background-color: rgba(255, 205, 86, 0.1); color: #555;  }

.userImg {width: 60px; height: 60px; padding:2px;}
#senderImg {width: 45px; height: 45px; padding:2px;}
#chatting-detail {display: none; }

	.format {display: none;}
		
	</style>
</head>


<body>
	
	
<div class="container">
	<div class="row mb-3">
		<div class="m-2 col-3" id="chat-left">
			<div class="m-2 p-2" id="left-header">
			예약 문의 리스트
			</div>	
			<c:choose>
				<c:when test="${empty chatList }">
					사용자 없음.
				</c:when>
				<c:otherwise>
					<c:forEach var="chatRoom" items="${chatList }" varStatus="loop">
						<div id="chatting-list-box" class="m-1" onclick="enter(${chatRoom.chatRoomNo })">
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
		<div id="chat-middle" class="col-5 m-2">
				<div class="m-2 p-2" id="middle-header">
			        예약 문의 
				</div>
			<div id="chatting-waiting" class="m-2">
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
			<div id="chatting-detail" class=" m-2">
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
		
		<div class="m-2 col-3" id="chat-right">
			<div class="m-2 p-2" id="right-header">
			        예약 정보
			</div>
		
	
		
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
			                <div class="message col">
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

</body>

<script type="text/javascript">

function getFullYmdStr(){
    //년월일시분초 문자열 생성
    var d = new Date();
    return d.getFullYear() + ". " + ('0' + (d.getMonth() + 1)).slice(-2) + ". "
+ ('0' + d.getDate()).slice(-2) + "    " + ('0' + d.getHours()).slice(-2) + ":" + ('0' + d.getMinutes()).slice(-2);
}

	const hostName = "${savedHost.name }";
	const hostImg = "${savedHost.mainImage }";
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
				    appendMyMessageTag(LR, msg.message, msg.sendingTime);
				}else{
					console.log('3');
					let LR = "left";
				    appendMessageTag(LR, msg.senderName, msg.message, msg.sendingTime, msg.senderImg);
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
			    senderName: hostName, 
			    message: $("#chatting").val(), 
			    sendingTime: getFullYmdStr(),
			    senderImg: hostImg
			    
			  };
		console.log($("#sessionId").val());
		console.log($("#chatting").val());
		console.log('메세지 보냈음');
		ws.send(JSON.stringify(msg));
	    $('div.input-div textarea').val('');

	}
	
	
	// 메세지 태그 생성
    function createMessageTag(LR, senderName, message, sendingTime, senderImg) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 
        // 값 채우기
        chatLi.addClass(LR);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);
        chatLi.find('.sendingTime small').text(sendingTime);
        var src = "../../resources/images/userprofiles/" + senderImg;
		chatLi.find(".senderImg").attr("src", src);
        
 
        return chatLi;
    }
 

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
 

    // 메세지 태그 append
    function appendMessageTag(LR, senderName, message, sendingTime, senderImg) {
        const chatLi = createMessageTag(LR, senderName, message, sendingTime, senderImg);
 
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
			
			$.getJSON('/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
				console.log('가져오는 거 오키');
				$.each(messageDtos, function(index, value) {
					
					let LR = (messageDto.sendingUserNo == ${LOGIN_USER.no })? "right" : "left";
			      appendMessageTag(LR, value.sendingUserName, value.content, value.sendingDate, value.sendingUserImage);
				})
	    });
		
			wsOpen();
			
	    } else {
	    	$("#chatting-detail").show();
	    }
    }	
			
</script>
</html>