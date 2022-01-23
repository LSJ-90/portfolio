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
 
.header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chat_wrap .chat { padding-bottom: 80px; height:85% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.input-div { bottom: 0; height: 80px; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.input-div > textarea { width: 90%; height: 50px; border: none; padding: 10px; margin: 5px 0 0 0;}
 
.chat-list  {border: 1px solid #888;}
 
.chat-list-label { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chatting-list-box {font-size: 20px; height: 80px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }


#chatting-content {display: none;}

		
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
						<div id="chatting-list-box" class="card chatting-list-box d-flex position-relative" onclick="enter(${chatRoom.no })">
							<div class="row">
								<div class="col-4">
									<img src="" class="flex-shrink-0 me-3" alt="">
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
			<div class="header">
		        예약 문의 
			</div>
			<div id="chatting-waiting" class="chat_wrap">
				<div class="chat">
					게스트문의입니다.
				</div>
			</div>	
			<div id="chatting-content" class="chat_wrap">	
				
				<div class="chat">
					<ul>
					
					</ul>
				</div>	
				<div>
				    <div id="yourMsg" class="input-div">
				        <textarea class="chatting" id="chatting" placeholder="Press Enter for send message."></textarea>
				    </div>
			    </div>
			</div>
		</div>
		
		
		
		<div class="chat-list col-3">
		
		
	
		
		진행중인 프로모션<br>
		
		예약상황- 달력...하지 말까? 어려우면 그냥 테이블로..<br>
		
		- 채팅방 누르면 채팅방 번호 받아서 채팅 내용 바뀌도록<br>
		<br>
		- 채팅 누르면 지금 있는 방이 확인되도록 색변화?<br>
		<br>
		- 새 메시지가 있는 경우 빨간 버튼으로 표시<br>
		
		
		<br>구현할 메소드
		<br>message+user+ dto(int chatRoomNo) order by updated_date desc 
		<br>
		<br>
		
		
		
		</div>
	</div>
</div>
	


	
	
	
<div id="chatting-content" class="chat_wrap format">		
	<div class="chat">
		<ul>
		
		</ul>
	</div>	
	<div>
	    <div id="yourMsg" class="input-div">
	        <textarea class="chatting" id="chatting" placeholder="Press Enter for send message."></textarea>
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
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }
 
    function enter(ChatRoomNo) {
    	wsOpen();	
		$("#chatting-waiting").hide();
		$("#chatting-content").show();
		
    	console.log('여기까지 오키');
		
    	console.log(ChatRoomNo);
		
		$.getJSON('/host/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
			console.log('가져오는 거 오키');
			$.each(messageDtos, function(index, value) {
				
				//let LR = (messageDto.sendingUserNo == messageDto.hostingUserNo)? "right" : "left";
				const LR = "right"
		      appendMessageTag(LR, value.sendingUserName, value.content);
			})
    });
	
		
    }
		
			

    
    
    
    
    
    //여기부터 달력
   
	var today = new Date();
	function buildCalendar(){
  var row = null
  var cnt = 0;
  var calendarTable = document.getElementById("calendar");
  var calendarTableTitle = document.getElementById("calendarTitle");
  calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
  
  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
  var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
  while(calendarTable.rows.length > 2){
  	calendarTable.deleteRow(calendarTable.rows.length -1);
  }

  row = calendarTable.insertRow();
  for(i = 0; i < firstDate.getDay(); i++){
  	cell = row.insertCell();
  	cnt += 1;
  }

  row = calendarTable.insertRow();

  for(i = 1; i <= lastDate.getDate(); i++){
  	cell = row.insertCell();
  	cnt += 1;

    cell.setAttribute('id', i);
  	cell.innerHTML = i;
  	cell.align = "center";

    cell.onclick = function(){
    	clickedYear = today.getFullYear();
    	clickedMonth = ( 1 + today.getMonth() );
    	clickedDate = this.getAttribute('id');

    	clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
    	clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
    	clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

    	opener.document.getElementById("date").value = clickedYMD;
    	self.close();
    }

    if (cnt % 7 == 1) {
    	cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
    }

    if (cnt % 7 == 0){
    	cell.innerHTML = "<font color=skyblue>" + i + "</font>";
    	row = calendar.insertRow();
    }
  }

  if(cnt % 7 != 0){
  	for(i = 0; i < 7 - (cnt % 7); i++){
  		cell = row.insertCell();
  	}
  }
}

function prevCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	buildCalendar();
}

function nextCalendar(){
	today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	buildCalendar();
}
    
	
	
	
</script>
</html>