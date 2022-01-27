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
 
.chat_wrap {height: 400px; overflow-y:auto;} 
.chat_wrap .chat { padding-bottom: 80px; height:85% }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
.chat_wrap .chat ul li.right > div.message { text-align: right; }
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.input-div { bottom: 0; height: 80px; width: 100%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.input-div > textarea { width: 90%; height: 50px; border: none; padding: 10px; margin: 5px 0 0 0;}
  
.chatting-list-box {cursor: pointer; font-size: 20px; height: 80px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }

.userImg {width: 60px; height: 60px;}

#modal-content-chat {width: 400px; height: 600px;}

#modal-header-chat {cursor: move; }

#modal-title-chat {font-size: 15px; padding: 2px 0; background: #888; color: white; text-align: center; }

#modal-body-chat {height: 400px}

.chat-middle {display: none; }

.name span {font-size: 15px; }

.lastmessage span {font-size: 13px; }

div.chat-list {
 	padding: 1px;
    margin-bottom: 5px;
    border-bottom: 3px solid #efefef;
}

.format {display: none;}

</style>


  <div class="mypage__menu">
    <ul class="menu__my-stay">
      <li class="my-stay__item title">My Stay</li>
      <li class="my-stay__item">
        <a href="" class="active">예약정보</a>
      </li>
      <li class="my-stay__item"><a href="">관심 스테이</a></li>
      <li class="my-stay__item"><a href="">다녀온 스테이</a></li>
      <li class="my-stay__item" id="guest-chat" onclick="chatopen()">
      호스트문의
        <img src="../../resources/images/main/chat_icon.png" alt="" class="chat-icon"/>
      </li>
    </ul>
    <ul class="menu__my-info">
      <li class="my-info__item title">내 계정</li>
      <li class="my-info__item"><a href="/userUpdate">회원 정보 수정</a></li>
      <li class="my-info__item"><a href="">1:1 문의</a></li>
      <li class="my-info__item"><a href="">FAQ</a></li>
    </ul>
  </div>
  
  
  
  <div class="modal fade " id="modal-creating-chatting" aria-labelledby="호스트문의" aria-hidden="true">
  		<div class="modal-dialog modal-lg modal-dialog-centered ">
    		<div class="modal-content" id="modal-content-chat">
      			<div class="modal-header" id="modal-header-chat">
        			<h5 class="modal-title" id="modal-title-chat">호스트 문의 목록</h5>
        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      			</div>
      			<div class="modal-body" id="modal-body-chat">
      				<div class="row mb-3">
						<div class="col m-2">
							<div class="chat-list">
									<ul>
									
									</ul>
							</div>	
						</div>
						<div id="chat-middle" class="chat-middle">
							<div id="chatting-detail" class="chat-detail m-2">
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
								        <textarea class="chatting" id="chatting" placeholder="메세지 입력 후 엔터키를 누르세요"></textarea>
								    </div>
							    </div>
							</div>
						</div>
					</div> <!-- row -->
      			</div>
      			<div class="modal-footer">
        			
      			</div> <!-- modal body -->
    		</div>
  		</div>
	</div>
	
  
  
   <div class="chat-list format">
        <ul>
            <li>
            	<div class="box" onclick="enter()">
            		<div class="row">
            			<div class="col-2">
							   <input type="hidden" id="hostNo" name="hostNo" value="">
							   <input type="hidden" id="roomNumber" name="roomNumber" value="">
			                <img src="../../resources/images/" id="userImg" class="userImg" alt="">
			             </div>   
			             <div class="col-10">
			            	<div class="name">
			                    <span></span>
			                </div>
			                <div class="lastmessage">
			                    <span></span>
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
                <div class="sender">
                    <span></span>
                </div>
                <div class="message">
                    <span></span>
                </div>
            </li>
        </ul>
    </div>



<script type="text/javascript">

//모달창 마우스 드래그로 움직일 수 있게
$("#modal-creating-chatting").draggable({
    handle: ".modal-header"
});

//채팅 리스트를 열어줌
function chatopen() {
	
		console.log('실행오키');
		$.getJSON('/mypage/chat', {no:100}, function(chatList) {
		console.log('가져오는 거 오키');
		$.each(chatList, function(index, value) {
			
			let chatList = $('div.chat-list.format ul li').clone();
	
			chatList.find('.name span').text(value.name);
			chatList.find('.lastmessage span').text(value.lastMessage);
			chatList.find("input[name='roomNumber']").val(value.chatRoomNo);
			var src = "../../resources/images/userprofiles/" + value.image;
			chatList.find(".userImg").attr("src", src);


			
		console.log('값변경 오키');
			$('div.chat-list:not(.format) ul').append(chatList);
			
		})
	});
	
	let chattingModal = new bootstrap.Modal(document.getElementById('modal-creating-chatting'), {
		keyboard: false
	
	});
		chattingModal.show();
		
}

	const userName = "하민";
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
    
    function enter() {
    		
    	//var ChatRoomNo = $('div.chat-list:not(.format) div.input[name="roomNumber"]').val();
    	var ChatRoomNo = $("#roomNumber").val();
    	
	    	console.log('함수버튼 눌렀을 때 받아온 룸넘버');
	    	console.log(ChatRoomNo);
	    	$('div.chat-list:not(.format)').hide();
			$("#chat-middle").show();
			
			
	    	console.log('여기까지 오키');
			
			$.getJSON('/mypage/chat-enter.do', {no:ChatRoomNo}, function(messageDtos) {
				console.log('가져오는 거 오키');
				$.each(messageDtos, function(index, value) {
					
					//let LR = (messageDto.sendingUserNo == messageDto.hostingUserNo)? "right" : "left";
					const LR = "right"
			      appendMessageTag(LR, value.sendingUserName, value.content);
				})
	    });
		
			wsOpen();
			
	    } 
			
</script>