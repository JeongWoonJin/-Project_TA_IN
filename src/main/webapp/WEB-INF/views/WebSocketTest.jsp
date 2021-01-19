<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.alarm {
	display:none;
}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(
			function() {
				var socket = null;
				function connect() {
					var ws = new WebSocket(
							"ws://localhost:8090/tain/replyEcho?ID=${ID}");
					socket = ws;

					ws.onopen = function() {
						console.log('Info: connection opened.');
					};

					ws.onmessage = function(event) {
						console.log("ReceiveMessage : ", event.data + '\n');
					};

					ws.onclose = function(event) {
						console.log('Info: connection closed.');
						//setTimeout(function(){connect();}, 1000);   // retry connection!!
					};
					ws.onerror = function(err) {
						console.log('Err:', err);
					};

				}

				connect();

				$('#btnSend').on('click', function(evt) {
					evt.preventDefault();
					if (socket.readyState !== 1)
						return;
					var id = $('input#id').val();
					var msg = $('input#msg').val();
					var toid = $('input#user').val();
					socket.send(id+","+toid+","+msg);
					$("#receivemsg").append("메시지를 보냈습니다. 내용 : "+msg+"<br>");
					$(".alarm").css("display", "inline-block");
					$("#chkbox").css("display", "none");
				});
				
				$(".alarm").click(function(){
					$(".alarm").css("display", "none");
				})
			});
</script>
<body>
	내 아이디 : <input type="text" id="id" value="${ID}" readonly>
	<input type="text" id="msg" value="">
	상대 : <input type="text" id="user">
	<input type="button" id="btnSend" value="Send Message"><br>
	<input type="checkbox" id="chkbox" class="alarm">
	<div id="receivemsg" class="alarm"></div>
</body>
</html>