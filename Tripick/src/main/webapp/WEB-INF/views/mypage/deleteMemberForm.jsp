<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>Insert title here</title>
	<style>
	div {
		display: block;
	}
	/* 기본 스타일 설정 */
	body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code,
		form, fieldset, legend, input, textarea, p, blockquote, button {
		margin: 0;
		padding: 0;
		font-family: "Malgun Gothic", dotum, gulim, sans-serif;
	}
	
	.help_find .tab_find {
		overflow: hidden;
		background: #fbfbfb;
	}
	/* 추가 */
	.help_find .tab_find li:first-child {
		margin-left: 0;
		width: 481px;
	}
	
	.tab_find {
		margin-left: 0px;
	}
	/* 변경 */
	.cont_find {
		position: relative;
		z-index: 1;
		margin-top: -1px;
		width: 100%;
		padding: 124px 99px 125px 99px;
		border: 1px solid #666;
	}
	
	/* content 영역 사이즈설정 */
	#content {
		min-height: 960px;
		position: relative;
		z-index: 1;
		margin: 200px auto 80px auto;
		width: 960px;
	}
	
	/* 상단바 스타일 조정*/
	.help_find .tab_find li {
		float: left;
		margin-left: -1px;
		width: 480px;
		height: 50px;
		border: 1px solid #e4e5e7;
		border-bottom: 1px solid #444;
	}
	
	.help_find * {
		box-sizing: border-box;
		letter-spacing: -1px;
	}
	
	.help_find .link_find {
		display: block;
		font-size: 15px;
		line-height: 48px;
		text-align: center;
		color: #222;
		text-decoration-line: none;
	}
	
	/* 상단 버튼 눌렸을때   */
	.help_find .on .link_find {
		font-size: 16px;
		font-weight: bold;
		line-height: 47px;
		color: #444;
	}
	
	/* 상단 아이디 버튼 눌렸을때   */
	.help_find .tab_find .on {
		position: relative;
		z-index: 2;
		border-color: #666;
		border-bottom-color: #fff;
		background: #fff;
	}
	
	ol, ul, li {
		list-style: none;
	}
	
	ul {
		list-style-type: disc;
	}
	
	fieldset {
		display: block;
		border: 0;
		margin-inline-start: 2px;
		margin-inline-end: 2px;
		padding-block-start: 0.35em;
		padding-inline-start: 0.75em;
		padding-inline-end: 0.75em;
		padding-block-end: 0.625em;
		min-inline-size: min-content;
	}
	
	.help_find .desc_find {
		margin-bottom: 25px;
		font-size: 15px;
		font-weight: bold;
		line-height: 15px;
		color: #444;
	}
	
	.help_find .wrap_lab {
		display: table-cell;
		position: relative;
		padding: 26px 0 0 39px;
		width: 185px;
		vertical-align: top;
	}
	
	.help_find .wrap_input {
		display: table-cell;
		position: relative;
		padding: 12px 20px;
		width: 575px;
		background: #fff;
		vertical-align: top;
	}
	
	.help_find .lab_find {
		display: block;
		font-size: 15px;
		line-height: 15px;
		color: #666;
	}
	
	.help_find .list_find li {
		border-bottom: 1px solid #eaeaea;
		font-size: 0;
		background: #f7f7f7;
	}
	
	.help_find .box_input {
		display: inline-block;
		position: relative;
		border: 1px solid #dbdbdb;
		vertical-align: top;
	}
	
	.help_find .inp_find {
		display: block;
		padding: 0 18px 1px 18px;
		width: 336px;
		height: 38px;
		border: 0;
		font-size: 15px;
		line-height: 40px;
		letter-spacing: normal;
		color: #444;
		vertical-align: middle;
	}
	
	/* 작은 버튼 */
	.help_find .btn_basic2.type03 {
		top: 9px;
		width: 115px;
		height: 38px;
		background-color: #7AD7BA;
	}
	
	.btn_basic2.type03 {
		border: 0;
		margin-top: 4px;
		color: #fff;
		font-weight: bold;
		background-color: #8EE5EE;
		font-size: 15px;
	}
	
	.help_find .btn_basic2 {
		position: absolute;
		left: 367px;
		top: 57px;
		min-width: 94px;
		padding: 6px 18px 8px;
	}
	
	/* 아래 버튼 */
	.help_find .wrap_link {
		display: block;
		margin: 40px auto 0;
		font-size: 0;
		text-align: center;
	}
	
	.help_find .wrap_link .btn_biggest_type01, .help_find .wrap_link .btn_biggest_type03,
		.help_find .wrap_link .btn_biggest_type04 {
		margin: 0 5px;
		padding: 11px 8px 14px;
		width: 212px;
		height: 60px;
		font-size: 20px;
		letter-spacing: -2px;
	}
	
	/* 큰 버튼 */
	.btn_biggest_type01 {
		display: inline-block;
		padding: 13px 8px 14px;
		width: 200px;
		height: 50px;
		border: 0;
		outline: 0;
		box-sizing: border-box;
		color: #fff;
		font-size: 16px;
		line-height: normal;
		text-align: center;
		vertical-align: top;
		background-color: #6b80f1;
	}
	
	/* 아이디 출력 부분 */
	#result_id {
		font-weight: bold;
		margin-top: 20px;
		font-size: 20px;
		text-align: center;
		color: black;
	}
	
	/* 아이디 찾기 버튼 */
	#btn_cert_search {
		background-color: #21cfe3;
		height: 50px;
	}
	/* 로그인 화면으로 버튼 */
	#btn_cert_back {
		background-color: black;
		height: 50px;
	}
	
	#btn_cert_cell1 {
		width: 125px;
		height: 38px;
	}
	
	#btn_cert_cell2 {
		width: 125px;
		height: 38px;
	}
	
	.liDiv>* {
		float: left;
		margin-right: 10px;
	}
	
	.liDiv {
		width: 600px;
		height: 50px;
		margin-top: 20px;
	}
	
	#userPwd {
		width: 180px;
	}
	
	#email {
		width: 200px;
	}
	</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>



	<div id="outer">
		<div id="wrap">
			<jsp:include page="../common/header.jsp" />
			<br><br><br><br><br><br>
			<div id="main">
				<div align="center">
					<h2>회원탈퇴</h2>
				</div>

				<div align="center">
					<div>
						<!-- <div>
						<h4>탈퇴 유의사항</h4>
						<div>
							* 탈퇴하실 경우 구매내역 확인은 물론 로그인 후 가능한 모든 기능은 사용하실 수 없습니다.<br>
							* 탈퇴하신 후에 회원 정보의 복구는 불가능하며, 보유하신 쿠폰이나 적립금도 모두 무효화됩니다.<br>
							* 탈퇴하신 후 동일한 이메일, 휴대폰 번호로 재 가입은 탈퇴일로부터 90일 이후 가능합니다.</div>
						</div>
					</div> -->

						<form id="frm" name="frm" action="deleteMember.my" method="POST">
							<input type="hidden" hidden="" name="userId"
								value="${ loginUser.userId }">
							<div>
								<fieldset style="width: 100px">
									<legend>탈퇴사유</legend>
									<ul class="list_find">
										
										<li id="li_cell">
					                        <div class="wrap_input">
												<textarea cols="50" rows="10" name="withdrawal"
													placeholder="탈퇴사유를 적어주세요!"></textarea>
											</div>
					                     </li>
										
					                    <li style="float: left;">
											<div class="liDiv">
												<label for="userPwd">Password: </label> 
												<input
													type="password" class="form-control" id="userPwd"
													placeholder="Please Enter Password" name="userPwd" required
													size=15>
												<button type="button" id="passChk" style="">PW 확인</button>
											</div>

										</li>
					                   
										<li id="emailLi" hidden="hidden">
					                        <div class="wrap_lab">
					                        <label for="cell" class="lab_find">이메일 주소</label></div>
					                        <div class="wrap_input">
					                           <span class="box_input">
					                              <input type="text" name="email" id="emailId" name = "email" class="inp_find" required>
					                           </span>   
					                           <button type="button" id="emailIn" class="btn_basic2 type03 btn_cert">인증번호 발송</button>
					                        </div>
					                     </li>
					              
										
										<li id="emailLiIn" hidden="hidden">
					                     	<div class="liDiv">
					                     		<div class="wrap_lab">
													<label  for="cell" class="lab_find">인증번호: </label> 
												</div>
												<div class="wrap_input">
													<span class="box_input"> 
														<input  type="text" class="form-control" id="emailchk" placeholder="인증번호 입력" required>
														 
													</span>
													<button type="button" id="mailChk" style=15>인증번호 확인</button>
												</div>
					                     	</div>
					                    </li>
					                   

									</ul>
								</fieldset>
								<br><br>
								<div class="btn-bottom-area">
									<button type="button" onclick="history.go(-1)">
										<span>취소</span>
									</button>
									<button type="button" id="btn" disabled="disabled">
										<span>확인</span>
									</button>
								</div>
							</div>
						</form>

						<script type="text/javascript">
						 	var email;
						    var emailno = 'N';
						    var emailCheck;
						    
						    $('#btn').click(function name() {
								alert('회원탈퇴가 완료되었습니다!');
								$('#frm').submit();
							})
							
							$('#mailChk').click(function () {
								var $secret = $('#emailchk').val();
								
								if($secret == "") {
									alert('인증번호를 입력해주세요');
									emailno = 'N';
									
								}else{
									
									$.ajax({
										url : "check",
										type : "post",
										data : {secret : $secret},
										success : function(result) {
											
											if(result == 'Y') {
												$('#btn').attr('disabled', false);
												
												$('#emailIn').attr('disabled', true);
												$('#emailchk').attr('disabled', true);
												$('#mailChk').attr('disabled', true);
												
												alert('인증성공!');
												emailno = 'Y';
											}else {
												
												alert('인증실패!');
												emailno = 'N';
											}
											
										},
										
										error : function() {
											
											   console.log('실패');
											   emailno = 'N';
										}
														
									});
								}
							})
							
						
							$('#emailIn').click(function () {
								var $email = $('#emailId').val();
			 					
								$.ajax({
									
									url : "input",
									type : "post",
									data : {email : $email},
									success : function(result) {
										
										if(result == 'Y') {
											$('#emailLiIn').attr('hidden', false);
											alert('인증번호발송!');
										}
										
									},
									
									error : function() {
										
											console.log('발송실패!');
									}
								
								});
									
						       
							})
							
							$('#passChk').click(function() {
								
								var pass = $('#userPwd').val();
								
								$.ajax({
									url : "passchk.my",
									data : {
										pass : pass
									},
									type : "post",
									success : function(result){
										if(result == 'Y') {
											alert("비밀번호가 일치합니다!");
											$('#userPwd').attr('disabled', true);
											$('#emailLi').attr('hidden', false);
											$('#emailId').val("${ loginUser.email }").attr('disabled', true);
											
										} else {
											alert("비밀번호가 일치하지 않습니다!");
										}
										
										
									},
									error : function(){
										alert("인증실패");
									}
								});
								
							})
		            </script>
					</div>
				</div>
			</div>


			<jsp:include page="../common/footer.jsp" />


		</div>
	</div>
</html>








