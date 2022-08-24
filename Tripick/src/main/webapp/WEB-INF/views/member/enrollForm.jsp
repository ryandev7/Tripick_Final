<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>

 .container {
  margin-top : 200px;
 }


 .text {
   		 line-height: 1.5;
    -webkit-text-size-adjust: 100%;
    --uk-breakpoint-s: 640px;
    --uk-breakpoint-m: 960px;
    --uk-breakpoint-l: 1200px;
    --uk-breakpoint-xl: 1600px;
    --uk-leader-fill-content: '.';
    --uk-position-margin-offset: 0px;
    margin: 0;
    padding: 0;
    outline: none;
    box-sizing: border-box;
    font-family: 'Montserrat';
    font-size: 45px;
    font-weight: 600;
    text-align: center;
    color: #000000;
 }		
 
 #nick {
 	padding-right : 5px;
 }

 #cpwd {
    padding-right : 10px;

 }

#inemail {
    padding-right : 18px;

}

 
 .input-nickname {
 
 	 height: 40px;
     width: 300px;
     margin-left: 50px;
     background-color: #fafafa;
     border: none;
 	
 }
 
 .input-id {
 	
 	 height: 40px;
     width: 300px;
     margin-right: 1px;
     background-color: #fafafa;
     border: none;
 }
 
 .input-pwd {
 
 	height: 40px;
    width: 300px;
    background-color: #fafafa;
    border: none;
 }
 
 .input-repwd {
 
    height: 40px;
    width: 300px;
    background-color: #fafafa;
    border: none;
}

.input-name {
	height: 40px;
    width: 300px;
    background-color: #fafafa;
    border: none;
}

.input-email {
	height: 40px;
    width: 300px;
    margin-left: 135px;
    background-color: #fafafa;
    border: none;
}

.input-emailNo {
	height: 40px;
    width: 300px;
    margin-left: 135px;
    background-color: #fafafa;
    border: none;
}
 
 
 .all-nickarea {
 
 	margin-right : 50px
    
 }

 .label-text {

    margin-right: 210px;
    padding-top: 30px;
    color: #999999;
    font-size: 13px;
 }

 .small-text {

    color: #616161;
    font-size: 15px;
 }

 .checkId, .email-number, .confirm{

    margin-left: 10px;
    height: 40px;   
    width: 120px;
    font-size: 15px;
    font-weight: bold;
    color:white;
    border : none;
    background-color:#7ad7ba;
    

 }

 .jeyak-area {

    text-align: center;
    height: 10px;
    color: red;
    font-size: 12px;
    margin-top: 10px;
    margin-right:220px;
 }
 
  .signIn-btn{
	 
	 margin: 0;
    padding: 0;
    outline: none;
    box-sizing: border-box;
    height: 50px;
    width: 300px;
    background: none;
    border: none;
    color: #fff;
    font-size: 18px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    border-radius: 4px;
    background-color: #21cfe3;
	 }
	 
	 .back {
	 	 margin: 0;
    padding: 0;
    outline: none;
    box-sizing: border-box;
    height: 50px;
    width: 300px;
    background: none;
    border: none;
    color: #fff;
    font-size: 18px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 1px;
    cursor: pointer;
    border-radius: 4px;
    background-color: #000000;
	 }
 
 
 
</style>




</head>
<body>

<div class="container" align ="center">
                <div class="text">SIGN UP</div>
                <div class="small-text" style="color: grey;">Enjoy your Trip - Tripick </div><br><br>

                <form action="insert.me" id="enrollForm" method="post">
                    <div class = "all-nickarea">
                        <label class="label-text" for="userNickName" id="nick" style="margin-right : 215px;">닉네임</label>
                        <div class="NickName-area">
                            <input class="input-nickname" type="text" id="userNickName" name="userNickName" required style="padding-left: 10px;" maxlength="6">
                        </div>
	                    <div class="jeyak-area" id="nickCheck" style="margin-left: 140px; display: block;">2~6자의 한글만 사용 가능합니다.</div>   
	                    <div class="jeyak-area" id="nickCheckdob" style="margin-left: 20px; display: none;"></div>   
                   		<div class="jeyak-area" id="nickCheckfal" style="margin-left: 45px; display: none;"></div>   
                  		<div class="jeyak-area" id="nickChecktr" style="margin-left: 50px; display: none;"></div>                      
                      
                    </div>
	        		<div style="padding-top: 10px">
                        <label class="label-text" for="userId" style="margin-right: 275px;">아이디</label>
                        <div class="Id-area">
                            <input class="input-id" type="text" id="userId" name="userId" required style="padding-left: 10px;" maxlength="15">
                   		</div>
                    <div class="jeyak-area" id="checkId" style="margin-left: 130px; margin-botton :px; display: block;">5~15자의 영어, 숫자만 사용 가능합니다.</div>   
                    <div class="jeyak-area" id="checkIddob" style="margin-left: 20px; display: none;"></div>   
                    <div class="jeyak-area" id="checkIdfal" style="margin-left: 45px; display: none;"></div>   
                    <div class="jeyak-area" id="checkIdtr" style="margin-left: 50px; display: none;"></div>   
                    </div>	
                    <div class="jeyak-area" id="checkResultId" style="margin-left:55px; display:none;"></div> 
                    <div style="padding-top: 10px">
                        <label class="label-text" for="userPwd" style="margin-right: 260px;">비밀번호</label>
                        <div class="Pwd-area">
                            <input class="input-pwd" type="password" id="userPwd" name="userPwd" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <div class="jeyak-area" id="checkPwd" style="margin-left:240px; display:block;" maxlength="15">6~15자의 영문 대/소문자, 숫자, 특수문자 사용이 가능합니다.</div>
	       			<div style="padding-top: 10px">
                        <label class="label-text" for="checkuserPwd" id="cpwd" style="margin-right: 217px;">비밀번호 확인</label>
                        <div class="checkPwd-area">
                            <input class="input-repwd" type="password" id="checkuserPwd" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <div>
                    <p class="jeyak-area" id="recheckPwd"style="margin-left: 43px; display:block;"></p>
                   <!--   <div class="jeyak-area" id="recheckPwdtr"style="margin-left: 43px; display:none;"></div> -->
                    </div>
                    
                    <div >
                        <label class="label-text" for="userName" style="margin-right: 285px;">이름</label>
                        <div class="Name-area">
                            <input class="input-name" type="text" id="userName" name="userName" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <div class="jeyak-area" id="checkName" style="margin-left: 100px;">2~10자의 한글만 사용 가능합니다.</div>
                    <div style="padding-top: 10px">
                        <label class="label-text" for="email" style="margin-right: 265px;">이메일</label>
                        <div class="Email-area">
                            <input class="input-email" type="text" id="email" name="email" required style="padding-left: 10px;">
                            <button class="email-number" id="emailRanNo" style="background-color: #7ad7ba; cursor : pointer;" onclick="emailNumber();" disabled type="button">인증번호 발송</button>                     
                        </div>
                    </div> 
                    <div class="jeyak-area" id="checkEmail"></div>
                     <div style="padding-top: 10px">
                   		<label class="label-text" for="emailNo" id="inemail" >인증번호 입력</label>
                   		<div>
                            <input class="input-emailNo" type="text" id="emailNo" name="secret" required style="padding-left: 10px;" maxlength="6">
		   					<button class="confirm" type="button" id="emailNoCheck" onclick="emailNumberCheck();" style="cursor : pointer;">확인</button>	
                      	</div>
                        <div class="jeyak-area" id="checkEmailNo" style="margin-left: 50px;"></div>
                      	<br><br>
                    </div> 
                    
                    <div>
                        <button class="signIn-btn" id="enrollBtn"  type="submit">회원가입</button>
                    </div>
                    <br>
                    
                    <div>
						<button type="button" onclick="location.href='loginForm.me'" class="back">로그인 하러가기</button>
                    </div>
                    
                    

                    <br><br><br><br><br><br><br>
                </form>
                
      </div>

	<script>
	var NICK = "N";
	var ID = "N";
	var PWD = "N";
	var NAME = "N";
	var EMAIL = "N";
	var EMAILNO = "N";
	
	
	
	// 회원가입 체크
	
    $(function() {
        $('#enrollForm').submit(function(){
           //맞으면 true
           
	        var success;
			success = NICK + ID + PWD + NAME + EMAIL + EMAILNO;
			if(success == 'YYYYYY') {
				
				return true;
			}
			else {
				alert('조건에 충족하게 값을 입력해주세요');
				return false;
			}
	         
	       });
      
     });
	
		
		// id 중복체크
		
		$(function() {
			
			const $idInput/*jQuery선택자로 선택*/ = $('#userId');
			
			$idInput.keyup(function() {
			
				// 최소 다섯글자 이상 입력했을 때만 ajax요청해서 중복체크
				
				if($idInput.val().length >= 5) {
					
					var $checkId = $('#checkId');
					
					$.ajax({
						
						url :'idCheck.me',
						data : {checkId:$idInput.val()},
						success : function(result) {
							
							if(result == 'NNNNN' ) { // 사용불가
																
									$('#checkIddob').show();							
									$('#checkIddob').css('margin-left', '20px');
									$('#checkIddob').css('color', 'red').text('중복된 아이디입니다!');
	                                $('#checkId').hide();
	                                $('#checkIdtr').hide();
	                                $('#checkIdfal').hide();    
	                                ID = 'N';
													
							}
							else { // 사용가능
										
										// 아이디 유효성 검사
										var idCheckRegExp = /^[a-zA-Z0-9]{5,15}$/;
										
										if(!idCheckRegExp.test($idInput.val())) { // 유효성 조건에 맞지 않았을 때
											
											$('#checkIdfal').show();
											$('#checkIdfal').css('color', 'red').text('조건에 맞춰 입력해주세요');
											$('#checkId').hide();
											$('#checkIdtr').hide();  
											$('#checkIddob').hide();
											ID = 'N';
											
										}
										else {                                   // 유효성 조건에 맞았을 때
											$('#checkIdtr').show();
											$('#checkIdtr').css('color', 'yellowgreen').text('사용 가능한 아이디입니다!');
											$('#checkId').hide();
											$('#checkIdfal').hide();  
											$('#checkIddob').hide();
											ID = 'Y';
																	
										}
								}				
						}, error : function() {
							console.log("아이디 중복체크용 ajax통신 실패");
							}
						});
					  }
					else {
												
						$('#checkId').show();
						$('#checkIdfal').hide();
						$('#checkIdtr').hide();
						$('#checkIddob').hide();
						ID = 'N';
									
					}
				  })	
		  })
		
		// 닉네임 중복체크
	
			$(function() {
				
				const $userNickName/*jQuery선택자로 선택*/ = $('#userNickName');
				
				$userNickName.keyup(function() {
				
					// 최소 다섯글자 이상 입력했을 때만 ajax요청해서 중복체크
					
					if($userNickName.val().length >= 2 && $userNickName.val().length <= 6 ) {
						
						var $nickCheck = $('#nickCheck');
									
						$.ajax({
							
							url :'NickNameCheck.me',
							data : {checkNickName:$userNickName.val()},
							success : function(result) {
								
								if(result == 'NNNNN' ) { // 사용불가
														
									
										$('#nickCheckdob').show();
										$('#nickCheckdob').css('margin-left', '75px');								
										$('#nickCheckdob').css('color', 'red').text('중복된 닉네임입니다!');									
		                                $('#nickCheck').hide();
		                                $('#nickChecktr').hide();
		                                $('#nickCheckfal').hide();    
		                                NICK = "N";
							
							     }
								else { // 사용가능
											
											// 닉네임 유효성 검사
											var nickCheckRegExp = /^[가-힣]{2,6}$/;
											
											if(!nickCheckRegExp.test($userNickName.val())) { // 유효성 조건에 맞지 않았을 때
												
												$('#nickCheckfal').show();										
												$('#nickCheckfal').css('margin-left', '97px');
												$('#nickCheckfal').css('color', 'red').text('조건에 맞춰 입력해주세요');
												$('#nickCheck').hide();
												$('#nickChecktr').hide();  
												$('#nickCheckdob').hide();
												NICK = "N";
													
												
											}
											else {                                   // 유효성 조건에 맞았을 때
												$('#nickChecktr').show();
											
												$('#nickChecktr').css('margin-left', '100px').text;
												$('#nickChecktr').css('color', 'yellowgreen').text('사용 가능한 닉네임입니다!');
												$('#nickCheck').hide();
												$('#nickCheckfal').hide();  
												$('#nickCheckdob').hide();
												NICK = "Y";
																	
											}
									}				
							}, error : function() {
								console.log("닉네임 중복체크용 ajax통신 실패");
								}
							});
						  }
						else {
							
						
							$('#nickCheck').show();
							$('#nickCheckfal').hide();
							$('#nickChecktr').hide();
							$('#nickCheckdob').hide();
							NICK = "N";
										
						}
					  })	
			  })
			
	
	// 비밀번호 체크(유효성)
	
	  $('#userPwd').keyup(function() {
		  
		  
	
	  var $userPwd = $('#userPwd').val();
	  var $checkPwd = $('#checkPwd');
	  var pwdCheckRegExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
			
		
	  	if(!pwdCheckRegExp.test($userPwd)) { // 유효성이 맞지않았을 때
	  		
	  		
	  		$('#checkPwd').css('margin-left', '50px');
	  		$('#checkPwd').css('color','red').text('조건에 맞춰 입력해주세요.');
	  		
	  		
	  		if($userPwd == "") {
	  			
	  			
	  			$('#checkPwd').css('margin-left', '240px');
	  			$('#checkPwd').css('color', 'red').text('6~15자의 영문 대/소문자, 숫자, 특수문자 사용이 가능합니다.');
	  				  			
	  		}
  		
	  	}
	  	else { // 유효성 일치했을 때
	  	  		
	  		$('#checkPwd').css('margin-left', '1px');
	  		$('#checkPwd').css('color', 'yellowgreen').text('사용 가능합니다!');
	  			  		
	  	}
	  	
	  
	  });		
	
	// 비밀번호 재확인
	
	  $('#checkuserPwd').keyup(function() {
		 
	   var $userPwd = $('#userPwd').val();
	   var $checkuserPwd = $('#checkuserPwd').val();
	   var $recheckPwd = $('#recheckPwd');
	   var $pwdCheckRegExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
	   
	   if($pwdCheckRegExp.test($userPwd)) {  // 비밀번호 유효성 일치(사용이 가능 할 경우)
		   PWD = 'N';
		   
		   if($checkuserPwd != $userPwd) { // 비밀번호와 비밀번호 확인이 불일치
			   
			  $recheckPwd.css('margin-left', '70px');		
			  $recheckPwd.css('color', 'red').text('비밀번호가 일치하지 않습니다');		
			  PWD = 'N';
		   
		   	   if($checkuserPwd == "") {
		   		   
		   		   $recheckPwd.text("");
		   		   PWD = 'N';
		   		   
		   		   
		   	   }
			   
		   }
		   else if($checkuserPwd == $userPwd) { // 비밀번호와 비밀번호 확인이 일치
			   

			   $recheckPwd.css('margin-left', '1px');
			   $recheckPwd.css('color', 'yellowgreen').text('사용 가능합니다!');
			   PWD = 'Y';
			
			   
		   }

	   }
	   	else { // 비밀번호 유효성 불일치(사용 불가), 보여줄 필요 없음
	   		
	   		$recheckPwd.text('');
	   		PWD = 'N';
	   		
	   	}
		  
		  
	  });
	

	// 이름 유효성 검사
		
	$('#userName').keyup(function(){
			
		var $userName = $('#userName').val();
		var $checkName = $('#checkName');
		var nameCheckRegExp = /^[가-힣]{2,10}$/;
	
		if(!nameCheckRegExp.test($userName)) {
			
			
			$checkName.css('margin-left', '50px');
			$checkName.css('color', 'red').text('조건에 맞춰 입력해주세요');
			NAME = "N";
			
				if($userName == "") {

					$checkName.css('margin-left', '100px');
					$checkName.css('color', 'red').text('2~10자의 한글만 사용 가능합니다.');
					NAME = "N";
				}		
			}
			else {
				
				$checkName.css('margin-left', '1px');	
				$checkName.css('color', 'yellowgreen').text('사용 가능합니다!');	
				NAME = "Y";
			}
	});
	
	// 이메일 중복체크	
	$(function() {
			
			const $emailInput/*jQuery선택자로 선택*/ = $('#email');
			
			$emailInput.keyup(function() {
			
				// 최소 다섯글자 이상 입력했을 때만 ajax요청해서 중복체크
				
				if($emailInput.val().length >= 5) {
					
							var $checkEmail = $('#checkEmail');
							
							$.ajax({
								
								url :'emailCheck.me',
								data : {checkEmail:$emailInput.val()},
								success : function(result) {
									
									if(result == 'NNNNN' ) { // 사용불가
																		
																		
											$('#checkEmail').css('margin-left', '25px');
											$('#checkEmail').css('color', 'red').text('중복된 이메일입니다.');
		 
											EMAIL = 'N';
															
								    }
									else { // 사용가능
			
										   // 유효성 검사
										    var $email = $('#email').val();
											var $checkEmail = $('#checkEmail');
											var regExpEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
												
											 // /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
											
										
												if(!regExpEmail.test($email)) { // 유효성 불일치
													
													$('#checkEmail').css('margin-left', '90px');
													$('#checkEmail').css('color', 'red').text('이메일 형식에 맞게 입력해주세요.');
													$('#emailRanNo').attr("disabled");
													EMAIL = "N";
															
													if($email == "") {
														
														$checkEmail.text('');
														EMAIL = "N";
													}
													
												}
												else { // 유효성 일치
													
													$('#checkEmail').css('margin-left', '1px');
													$('#checkEmail').css('color', 'yellowgreen').text('사용 가능합니다!');
											        $('#emailRanNo').removeAttr("disabled");
											         EMAIL = "Y";
													
												}
									}				
								}, error : function() {
									console.log("이메일 중복체크용 ajax통신 실패");
									}
								});
							  }
					else {
											
						$('#checkEmail').css('margin-left', '90px');
						$('#checkEmail').css('color', 'red').text('');
						EMAIL = "N";
									
					}
				  })	
		  })
		
	
	
	// 이메일 인증번호 발송
	
	function emailNumber() {
		var $email = $('#email').val();
			
			$.ajax({
				
				url : "input",
				type : "post",
				data : {email : $email},
				success : function(result) {
					
					if(result == 'Y') {
						
						alert('인증번호발송!');
					}
					
				},
				
				error : function() {
					
						console.log('발송실패!');
				}
			
			});
				
	}
	
	// 이메일 인증번호 확인
	
	function emailNumberCheck() {
		
		var $secret = $('#emailNo').val();
		
		if($secret == "") {
			alert('인증번호를 입력해주세요');
			EMAILNO = 'N';
			
		}else{
			
			$.ajax({
				
				url : "check",
				type : "post",
				data : {secret : $secret},
				success : function(result) {
					
					if(result == 'Y') {
						
						alert('인증성공!');
						EMAILNO = 'Y';
					}else {
						
						alert('인증실패!');
						EMAILNO = 'N';
					}
					
				},
				
				error : function() {
					
					   console.log('실패');
					   EMAILNO = 'N';
				}
				
				
				
			});
		}
			
			
	}
		

	
	</script>
 <jsp:include page="../common/footer.jsp"/>
</body>
</html>