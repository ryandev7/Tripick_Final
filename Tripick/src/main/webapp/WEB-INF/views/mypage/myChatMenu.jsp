<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*"%>
<% Timestamp t = new Timestamp(System.currentTimeMillis()); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<style>

        .wrap{
            margin : auto;
            
        }

        .warp > div {width : 100%;}
        #header, #footer{height : 20%;}
        #content{height : 55%}

        #content > div{
            height : 100%;
            float : left;
        } 
        #content_1{width : 20%;}
        #content_2{width : 80%;}
		body{
		    background-color: #f4f7f6;
		    margin-top:20px;
		}
		.card {
		    background: #fff;
		    transition: .5s;
		    border: 0;
		    margin-bottom: 30px;
		    border-radius: .55rem;
		    position: relative;
		    width: 100%;
		    box-shadow: 0 1px 2px 0 rgb(0 0 0 / 10%);
		}
		.chat-app .people-list {
		    width: 280px;
		    position: absolute;
		    left: 0;
		    top: 0;
		    padding: 20px;
		    z-index: 7
		}
		
		.chat-app .chat {
		    margin-left: 280px;
		    border-left: 1px solid #eaeaea
		}
		
		.people-list {
		    -moz-transition: .5s;
		    -o-transition: .5s;
		    -webkit-transition: .5s;
		    transition: .5s
		}
		
		.people-list .chat-list li {
		    padding: 10px 15px;
		    list-style: none;
		    border-radius: 3px
		}
		
		.people-list .chat-list li:hover {
		    background: #efefef;
		    cursor: pointer
		}
		
		.people-list .chat-list li.active {
		    background: #efefef
		}
		
		.people-list .chat-list li .name {
		    font-size: 15px
		}
		
		.people-list .chat-list img {
		    width: 45px;
		    border-radius: 50%
		}
		
		.people-list img {
		    float: left;
		    border-radius: 50%
		}
		
		.people-list .about {
		    float: left;
		    padding-left: 8px
		}
		
		.people-list .status {
		    color: #999;
		    font-size: 13px
		}
		
		.chat .chat-header {
		    padding: 15px 20px;
		    border-bottom: 2px solid #f4f7f6
		}
		
		.chat .chat-header img {
		    float: left;
		    border-radius: 40px;
		    width: 40px
		}
		
		.chat .chat-header .chat-about {
		    float: left;
		    padding-left: 10px
		}
		
		.chat .chat-history {
		    padding: 20px;
		    border-bottom: 2px solid #fff
		}
		
		.chat .chat-history ul {
		    padding: 0
		}
		
		.chat .chat-history ul li {
		    list-style: none;
		    margin-bottom: 30px
		}
		
		.chat .chat-history ul li:last-child {
		    margin-bottom: 0px
		}
		
		.chat .chat-history .message-data {
		    margin-bottom: 15px
		}
		
		.chat .chat-history .message-data img {
		    border-radius: 40px;
		    width: 40px
		}
		
		.chat .chat-history .message-data-time {
		    color: #434651;
		    padding-left: 6px
		}
		
		.chat .chat-history .message {
		    color: #444;
		    padding: 18px 20px;
		    line-height: 26px;
		    font-size: 16px;
		    border-radius: 7px;
		    display: inline-block;
		    position: relative
		}
		
		.chat .chat-history .message:after {
		    bottom: 100%;
		    left: 7%;
		    border: solid transparent;
		    content: " ";
		    height: 0;
		    width: 0;
		    position: absolute;
		    pointer-events: none;
		    border-bottom-color: #fff;
		    border-width: 10px;
		    margin-left: -10px
		}
		
		.chat .chat-history .my-message {
		    background: #efefef
		}
		
		.chat .chat-history .my-message:after {
		    bottom: 100%;
		    left: 30px;
		    border: solid transparent;
		    content: " ";
		    height: 0;
		    width: 0;
		    position: absolute;
		    pointer-events: none;
		    border-bottom-color: #efefef;
		    border-width: 10px;
		    margin-left: -10px
		}
		
		.chat .chat-history .other-message {
		    background: #e8f1f3;
		    text-align: right
		}
		
		.chat .chat-history .other-message:after {
		    border-bottom-color: #e8f1f3;
		    left: 93%
		}
		
		.chat .chat-message {
		    padding: 20px
		}
		
		.online,
		.offline,
		.me {
		    margin-right: 2px;
		    font-size: 8px;
		    vertical-align: middle
		}
		
		.online {
		    color: #86c541
		}
		
		.offline {
		    color: #e47297
		}
		
		.me {
		    color: #1d8ecd
		}
		
		.float-right {
		    float: right
		}
		
		.clearfix:after {
		    visibility: hidden;
		    display: block;
		    font-size: 0;
		    content: " ";
		    clear: both;
		    height: 0
		}
		
		@media only screen and (max-width: 767px) {
		    .chat-app .people-list {
		        height: 465px;
		        width: 100%;
		        overflow-x: auto;
		        background: #fff;
		        left: -400px;
		        display: none
		    }
		    .chat-app .people-list.open {
		        left: 0
		    }
		    .chat-app .chat {
		        margin: 0
		    }
		    .chat-app .chat .chat-header {
		        border-radius: 0.55rem 0.55rem 0 0
		    }
		    .chat-app .chat-history {
		        height: 300px;
		        overflow-x: auto
		    }
		}
		
		@media only screen and (min-width: 768px) and (max-width: 992px) {
		    .chat-app .chat-list {
		        height: 650px;
		        overflow-x: auto
		    }
		    .chat-app .chat-history {
		        height: 600px;
		        overflow-x: auto
		    }
		}
		
		@media only screen and (min-device-width: 768px) and (max-device-width: 1024px) and (orientation: landscape) and (-webkit-min-device-pixel-ratio: 1) {
		    .chat-app .chat-list {
		        height: 480px;
		        overflow-x: auto
		    }
		    .chat-app .chat-history {
		        height: calc(100vh - 350px);
		        overflow-x: auto
		    }
		}

	</style> 
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br><br><br><br><br><br>

		<div id="content">
			<div id="content_1">
				<jsp:include page="../mypage/myPageMenuForm.jsp" />
			</div>
			<div id="content_2">
				<link
					href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
					rel="stylesheet" />

				<div class="container">
					<div class="row clearfix">
						<div class="col-lg-12">
							<div class="card chat-app">
								<div id="plist" class="people-list">
									<!-- <div class="input-group">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="fa fa-search"></i></span>
										</div>
										<input type="text" class="form-control"
											placeholder="Search...">
									</div> -->
									<ul class="list-unstyled chat-list mt-2 mb-0">
									
										<c:forEach var="r" items="${ rooms }" varStatus="s">
											<li class="clearfix personLi">
												<img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
												<div class="about">
													<div class="name" id='name'>${ r.userNickName }</div>
													<div class="status">
														<i class="fa fa-circle online"></i> online
													</div>
												</div>
												<div hidden="hidden" id='chatRoomNo'>${ r.chatRoomNo }</div>
											</li>
										</c:forEach>
										<!-- <li class="clearfix personLi" ><img
											src="https://bootdey.com/img/Content/avatar/avatar1.png"
											alt="avatar">
											<div class="about">
												<div class="name">Vincent Porter</div>
												<div class="status">
													<i class="fa fa-circle offline"></i> offline
												</div>
											</div>
										</li> 
										<li class="clearfix active personLi"><img
											src="https://bootdey.com/img/Content/avatar/avatar2.png"
											alt="avatar">
											<div class="about">
												<div class="name">Aiden Chavez</div>
												<div class="status">
													<i class="fa fa-circle online"></i> online
												</div>
											</div>
										</li>-->
										
								
										
										<li >
											<div >
												<img id='plusChatUser' src="./resources/common-upfiles/plus.png">	
											</div>
										</li>
										
										<li id='plusButtonGetText' hidden="hidden">
											<br>
											<input type="text"  id="plusId" placeholder="아이디" size=15>
											<button id='addChatUser'>추가!</button>
										</li>
									</ul>
									
									<script type="text/javascript">
									
										
										$('#addChatUser').on('click', function () {
											$('#plusButtonGetText').attr('hidden',true);
											
											var userId = $('#plusId').val();
											
											$.ajax({
												url :'addChat.my',
												data : {userId : userId} ,
												success : function(result) {
													console.log(result);
													if(result == 'NNNNN' ) { 
														alert('해당 사용자가 추가되었습니다!');
													}
													else { 
														alert('해당 사용자가 없습니다!');
													}				
												}, 
												error : function() {
													console.log("아이디 체크용 ajax통신 실패");
												}
											});
											
											$('#plusId').val("");
											location.href="myChatMenu.my";
										});
									
										$('#plusChatUser').on('click', function () {
											$('#plusButtonGetText').attr('hidden',false);
										});
										
										var socket;
										var chatRoomNo;
										
										$('.personLi').on('click', function () {
											
											
											$('.clearfix').each(function () {
												if($(this).hasClass('active')){
													$(this).removeClass('active');
												}
											})
											
											
											$(this).addClass('active');
											
											/* 채팅방 전환하는 코드 */
											$('.chat').attr('hidden',false);
											
											var name = $(this).children().children('.name').text();
											$('#chatName').text(name);
											
											chatRoomNo = $(this).children('#chatRoomNo').text();
											$('#chats').attr('hidden',false);
											
											//채팅내용불러오기
											$.ajax({
												url : "getChat.my",
												data : {
													chatRoomNo : chatRoomNo
												},
												type : "post",
												success : function (data) {
													console.log(data);
													
													let value = '';
													
													
													for(let i in data) {
														var _date = new Date(data[i].createDt);
														if(data[i].userId == '${loginUser.userId}') {
															value += '<li class="clearfix">'
																   + '<div class="message-data text-right" align="right">'
																   + '<span class="message-data-time">' + _date.toLocaleString() + '</span> '
																   + '</div>'
																   + '<div class="message other-message float-right">' + data[i].message + '</div>'
																   + '</li>';
														} else {
															value += '<li class="clearfix">'
																   + '<div class="message-data">'
																   + '<span class="message-data-time">' + _date.toLocaleString() + '</span> '
																   + '</div>'
																   + '<div class="message my-message">' + data[i].message + '</div>'
																   + '</li>';
														}
													}
													
													$('#chats').html(value);
													$('.scroll').scrollTop($('#chats')[0].scrollHeight);
									
												},
												error : function(){
													alert("인증실패");
												}
											});
											
											//웹소켓 연결
											var uri = "ws://localhost:8020/tripick/cs";
											socket = new WebSocket(uri);
											
											socket.onopen = function () {
												console.log("서버와 연결");
											}
											socket.onclose = function () {
												console.log("서버와 연결 종료");
											}
											socket.onerror = function (e) {
												console.log("에러");
											}
											socket.onmessage = function (e) {
												console.log("메세지도착");
												

												var ap = '<li class="clearfix">'
													   + '<div class="message-data">'
													   + '<span class="message-data-time">' + new Date().toLocaleString() + '</span> '
													   + '</div>'
													   + '<div class="message my-message">' + e.data + '</div>'
													   + '</li>';
												
												$('#chats').append(ap);
												$('.scroll').scrollTop($('#chats')[0].scrollHeight);
											}
										})
										
										$(function(){
											$('#inText').keypress(function(event) {
												if (event.which == 13) {
													var text = $('#inText').val();

													if (!text) {
														return;
													}
													
													
													console.log(chatRoomNo);
													
													
													socket.send(text + "," + chatRoomNo + "," + "${ loginUser.userId}");
													$('#inText').val('');
													
													var ap = '<li class="clearfix">'
														   + '<div class="message-data text-right" align="right">'
														   + '<span class="message-data-time">' + new Date().toLocaleString() + '</span> '
														   + '</div>'
														   + '<div class="message other-message float-right">' + text + '</div>'
														   + '</li>';
													
													$('#chats').append(ap);
													$('.scroll').scrollTop($('#chats')[0].scrollHeight);
													
													
													return false;
												}
											});
										})
										
										
									</script>
								</div>
								
								<div class="chat" hidden="hidden">
									<div class="chat-header clearfix" >
										<div class="row">
											<div class="col-lg-6">
												<!-- 여기에 기본이미지? 이건 빼도 무과할수도? -->
												<a href="javascript:void(0);" data-toggle="modal"
													data-target="#view_info"> <img
													src="https://bootdey.com/img/Content/avatar/avatar2.png"
													alt="avatar">
												</a>
												<!-- 사용자 이름 -->
												<div class="chat-about">
													<h6 class="m-b-0" id="chatName">Aiden Chavez</h6>
													<i class="fa fa-circle online"></i> <small>online</small>
												</div>
											</div>
											<!-- 정 시간남으면 추가! -->
											<div class="col-lg-6 hidden-sm text-right">
												<a href="javascript:void(0);"
													class="btntbtn-outline-secondary"><i
													class="fa fa-camera"></i></a> <a href="javascript:void(0);"
													class="btn btn-outline-primary"><i class="fa fa-image"></i></a>
												<a href="javascript:void(0);" class="btn btn-outline-info"><i
													class="fa fa-cogs"></i></a> <a href="javascript:void(0);"
													class="btn btn-outline-warning"><i
													class="fa fa-question"></i></a>
											</div>
										</div>
									</div>
									<div class="chat-history scroll" style="overflow-x:hidden; height:500px;">
										
										<ul class="m-b-0" id="chats" hidden="hidden">
											<li class="clearfix">
												<div class="message-data text-right" align="right">
													<span class="message-data-time">10:10 AM, Today</span> 
													<!-- <img
														src="https://bootdey.com/img/Content/avatar/avatar7.png"
														alt="avatar"> -->
												</div>
												<div class="message other-message float-right">Hi
													Aiden, how are you? How is the project coming along?</div>
											</li>
											<li class="clearfix">
												<div class="message-data">
													<span class="message-data-time">10:12 AM, Today</span>
												</div>
												<div class="message my-message">Are we meeting today?</div>
											</li>
											<li class="clearfix">
												<div class="message-data">
													<span class="message-data-time">10:15 AM, Today</span>
												</div>
												<div class="message my-message">Project has been
													already finished and I have results to show you.</div>
											</li>
											<li class="clearfix">
												<div class="message-data text-right" align="right">
													<span class="message-data-time">10:15 AM, Today</span>
												</div>
												<div class="message other-message float-right">Hi
													Aiden, how are you? How is the project coming along?</div>
											</li>
										</ul>
									</div>
									<div class="chat-message clearfix">
										<div class="input-group mb-0">
											<div class="input-group-prepend">
												<span class="input-group-text"><i class="fa fa-send"></i></span>
											</div> 
											<input type="text" class="form-control" size="" id='inText' placeholder="Enter text here...">
										</div>
									</div>
									

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<jsp:include page="../common/footer.jsp" />
	</div>



</body>
</html>