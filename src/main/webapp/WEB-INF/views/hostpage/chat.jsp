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

	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		
		.chating{
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		
.card {
  transition: transform 2s;
  transform-style: preserve-3d;
  cursor: pointer;
}		
	
 
.chat_wrap {height: 800px} 
 
.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chat_wrap .chat { padding-bottom: 80px; height:80% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.chat_wrap .input-div { bottom: 0; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.chat_wrap .input-div > textarea { width: 90%; height: 80px; border: none; padding: 10px; }
 

.chat-list  {border: 1px solid #888;}
 
.chat-list-label { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chatting-list-box {font-size: 20px; height: 80px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }

	
		
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
						<div class="card chatting-list-box" onclick="enter()">
							<div class="row">
								<div class="col-4">
									<p>${chatRoom.userNo }</p>
								</div>
								<div class="col-8">
									<p>최근메시지.</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="chat-list col-6">
			<div class="chat_wrap">
				<div class="header">
			        CHAT
				</div>
				<div id="chating" class="chat">
					<ul>
					
					</ul>
				</div>
				<div>
				    <div id="yourMsg" class="input-div">
				        <textarea class="chatting" id="chatting" placeholder="Press Enter for send message."></textarea>
				        <button class="btn btn-sm btn-outline-warning" onclick="send()" id="sendBtn">send</button>
				    </div>
			    </div>
			</div>
		</div>
		<div class="chat-list col-3">
		예약 히스토리
		
		진행중인 프로모션
		
		예약상황
			<div id="yourName">
					<table class="inputTable">
						<tr>
							<th>사용자명</th>
							<th><input type="text" name="userName" id="userName"></th>
							<th><button class="btn btn-sm btn-primary" onclick="chatName()" id="startBtn">이름 등록</button></th>
						</tr>
					</table>
			</div>
		
		</div>>
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

	
	var ws;

	function wsOpen(){
		ws = new WebSocket("ws://localhost/chating");
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

	  
	
	function chatName(){
		var userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
		}
	}

	function send() {
		var msg = {
			    type: "message", 
			    senderName: $("#userName").val(), 
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
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }
 
    
	
	
	
</script>
</html>