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
		

 
.header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chat_wrap {height: 700px; overflow-y:auto;} 
.chat_wrap .chat { padding-bottom: 80px; height:85% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
.chat_wrap .chat ul li.right > div.message { text-align: right; background: #F18C7E;}
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.input-div { bottom: 0; height: 80px; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.input-div > textarea { width: 90%; height: 50px; border: none; padding: 10px; margin: 5px 0 0 0;}
 
.chat-list  {border: 1px solid #888; height: 850px;}
 
.chat-list-label { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chatting-list-box {cursor: pointer; font-size: 20px; height: 80px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }


#chatting-detail {display: none;}

		
	</style>
</head>


<body>
	
	
<div class="container">
	<div class="row mb-3">
		<div class="chat-list col-3 ">
			<div class="chat-list-label">
			채팅목록
			</div>	
			<c:choose>
				<c:when test="${empty chatList }">
					사용자 없음.
				</c:when>
				<c:otherwise>
					<c:forEach var="chatRoom" items="${chatList }" varStatus="loop">
						<div id="chatting-list-box" class="chatting-list-box" onclick="enter(${chatRoom.chatRoomNo })">
							<div class="row">
								<div class="col-4">
									<img src="" class="flex-shrink-0 me-3" alt="">
									<p>${chatRoom.name }</p> <!-- 여기서는 유저네임 -->
								</div>
								<div class="col-8">
									<p>${chatRoom.lastMessage }</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div id="chatting-waiting" class="chat-list col-6">
			<div class="header">
		        예약 문의 
			</div>
			
			
		</div>
		<div id="chatting-detail" class="chat-list col-6">
			<div class="header">
		        예약 문의 
			</div>
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
		
		
		
		<div class="chat-list col-3">
		
		
	
		
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

	const userName = "하민";
	var ws;

	$(function(){
		wsOpen();
	});
	
	function wsOpen(){
		ws = new WebSocket("ws://localhost/chatting");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			
			var msg = JSON.parse(data.data);
			const LR = (msg.senderName != $("#userName").val())? "left" : "right";
	        appendMessageTag(LR, msg.senderName, msg.message);
			
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
			    senderName: userName, 
			    message: $("#chatting").val(), 
			    
			  };

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
    	console.log(ChatRoomNo);
		$('div.chat:not(.format) ul').empty();
		$("#chatting-waiting").hide();
		$("#chatting-detail").show();
		
    	console.log('여기까지 오키');
		
		$.getJSON('/host/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
			console.log('가져오는 거 오키');
			$.each(messageDtos, function(index, value) {
				
				//let LR = (messageDto.sendingUserNo == messageDto.hostingUserNo)? "right" : "left";
				const LR = "right"
		      appendMessageTag(LR, value.sendingUserName, value.content);
			})
    });
	
		
    }
		
			
</script>
</html>