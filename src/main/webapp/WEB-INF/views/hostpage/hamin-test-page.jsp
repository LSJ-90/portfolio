<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<style>
*{ margin: 0; padding: 0; }
 
.chat_wrap {height: 800px} 
 
.chat_wrap .header { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
.chat_wrap .chat { padding-bottom: 80px; }
.chat_wrap .chat ul { width: 100%; list-style: none; }
.chat_wrap .chat ul li { width: 100%; }
.chat_wrap .chat ul li.left { text-align: left; }
.chat_wrap .chat ul li.right { text-align: right; }
 
.chat_wrap .chat ul li > div { font-size: 15px;  }
.chat_wrap .chat ul li > div.sender { margin: 10px 20px 0 20px; font-weight: bold; }
.chat_wrap .chat ul li > div.message { display: inline-block; word-break:break-all; margin: 5px 20px; max-width: 75%; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555; text-align: left; }
 
.chat_wrap .input-div { position: fixed; bottom: 0; width: 70%; background-color: #FFF; text-align: center; border-top: 1px solid #F18C7E; }
.chat_wrap .input-div > textarea { width: 100%; height: 80px; border: none; padding: 10px; }
 
 
.chat_list {padding: 15px 12px; height: 38px; border: 1px solid #888;} 
.chat_list label { font-size: 14px; padding: 15px 0; background: #F18C7E; color: white; text-align: center;  }
 
 
.chatting-list-box {font-size: 20px; height: 38px; border: 1px solid #888; padding: 10px; border-radius: 5px; background-color: #FCFCFC; color: #555;  }
</style>
<head>
	<title></title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<!-- 
	jsp의 PageContext객체에 속성을 저장한다.
	pageContext.setAttribute("menu", "홈");
 -->
<c:set var="menu" value="홈"></c:set>

<div class="container">
	<div class="row mb-3">
		<div class="col-4">
			<div class="chat-list-label">
			<p>채팅목록</p>
			</div>	
			<div class="chatting-list-box p-0">
				<div class="row">
					<div class="col-4">
						<p>힐튼호텔.</p>
					</div>
					<div class="col-8">
						<p>최근메시지.</p>
					</div>
				</div>
			</div>
			<div class="chatting-list-box p-0">
				<div class="row">
					<div class="col-4">
						<p>롯데호텔.</p>
					</div>
					<div class="col-8">
						<p>최근메시지.</p>
					</div>
				</div>
			</div>
		</div>
	
		<div class="col-8">
			<div class="chat_wrap">
			    <div class="header">
			        CHAT
			    </div>
			    <div class="chat">
			        <ul>
			            <li class="left">
			                <div class="sender">
			                    <span>힐튼호텔</span>
			                </div>
			                <div class="message">
			                    <span>안녕하세요 반갑습니다</span>
			                </div>
			            </li>
			            <li class="left">
			                <div class="sender">
			                    <span>힐튼호텔</span>
			                </div>
			                <div class="message">
			                    <span>예약하실건가요</span>
			                </div>
			            </li>
			             <li class="right">
			                <div class="message">
			                    <span>네</span>
			                </div>
			            </li>
			        </ul>
			    </div>
			    <div>
				    <div class="input-div">
				        <textarea placeholder="Press Enter for send message."></textarea>
				    </div>
			    </div>
			</div>
		</div>
	</div>
</div>


</body>
<script type="text/javascript">
const Chat = (function(){
    const myName = "blue";
 
    // init 함수
    function init() {
        // enter 키 이벤트
        $(document).on('keydown', 'div.input-div textarea', function(e){
            if(e.keyCode == 13 && !e.shiftKey) {
                e.preventDefault();
                const message = $(this).val();
 
                // 메시지 전송
                sendMessage(message);
                // 입력창 clear
                clearTextarea();
            }
        });
    }
 
    // 메세지 태그 생성
    function createMessageTag(LR_className, senderName, message) {
        // 형식 가져오기
        let chatLi = $('div.chat.format ul li').clone();
 
        // 값 채우기
        chatLi.addClass(LR_className);
        chatLi.find('.sender span').text(senderName);
        chatLi.find('.message span').text(message);
 
        return chatLi;
    }
 
    // 메세지 태그 append
    function appendMessageTag(LR_className, senderName, message) {
        const chatLi = createMessageTag(LR_className, senderName, message);
 
        $('div.chat:not(.format) ul').append(chatLi);
 
        // 스크롤바 아래 고정
        $('div.chat').scrollTop($('div.chat').prop('scrollHeight'));
    }
 
    // 메세지 전송
    function sendMessage(message) {
        // 서버에 전송하는 코드로 후에 대체
        const data = {
            "senderName"    : "blue",
            "message"        : message
        };
 
        // 통신하는 기능이 없으므로 여기서 receive
        resive(data);
    }
 
    // 메세지 입력박스 내용 지우기
    function clearTextarea() {
        $('div.input-div textarea').val('');
    }
 
    // 메세지 수신
    function resive(data) {
        const LR = (data.senderName != myName)? "left" : "right";
        appendMessageTag("right", data.senderName, data.message);
    }
 
    return {
        'init': init
    };
})();
 
$(function(){
    Chat.init();
});


</script>
</html>