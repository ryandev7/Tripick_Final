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
	                    <span class="jeyak-area" id="nickCheck" style="margin-left: 140px;">2~6자의 한글만 사용 가능합니다.</span>                        
                    </div>
	        		<div style="padding-top: 10px">
                        <label class="label-text" for="userId" style="margin-right: 275px;">아이디</label>
                        <div class="Id-area">
                            <input class="input-id" type="text" id="userId" name="userId" required style="padding-left: 10px;" maxlength="15">
                   		</div>
                    </div>	
                    <span class="jeyak-area" id="checkResultId" style="margin-left:55px; display:none;"></span> 
                    <span class="jeyak-area" id="checkId" style="margin-left: 130px; display: block;">5~15자의 영어, 숫자만 사용 가능합니다.</span>   
                    <div style="padding-top: 10px">
                        <label class="label-text" for="userPwd" style="margin-right: 260px;">비밀번호</label>
                        <div class="Pwd-area">
                            <input class="input-pwd" type="password" id="userPwd" name="userPwd" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <span class="jeyak-area" id="checkPwd" style="margin-left:230px; display:block;" maxlength="15">6~15자의 영문 대/소문자, 숫자, 특수문자 사용 가능합니다.</span>
	       			<div style="padding-top: 10px">
                        <label class="label-text" for="checkuserPwd" id="cpwd" style="margin-right: 217px;">비밀번호 확인</label>
                        <div class="checkPwd-area">
                            <input class="input-repwd" type="password" id="checkuserPwd" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <span class="jeyak-area" id="recheckPwd"style="margin-left: 43px; display:block;"></span>
                    <div style="padding-top: 10px">
                        <label class="label-text" for="userName" style="margin-right: 285px;">이름</label>
                        <div class="Name-area">
                            <input class="input-name" type="text" id="userName" name="userName" required style="padding-left: 10px;">
                        </div>
                    </div>
                    <span class="jeyak-area" id="checkName" style="margin-left: 100px;">2~10자의 한글만 사용 가능합니다.</span>
                    <div style="padding-top: 10px">
                        <label class="label-text" for="email" style="margin-right: 265px;">이메일</label>
                        <div class="Email-area">
                            <input class="input-email" type="text" id="email" name="email" required style="padding-left: 10px;">
                            <button class="email-number" id="emailRanNo" style="background-color: #7ad7ba;">인증번호 발송</button>                     
                        </div>
                    </div> 
                    <span class="jeyak-area">이메일 제약조건</span>
                     <div style="padding-top: 10px">
                   		<label class="label-text" for="emailNo" id="inemail">인증번호 입력</label>
                   		<div>
                            <input class="input-emailNo" type="text" id="emailNo"  required style="padding-left: 10px;">
		   					<button class="confirm" type="button" id="emailNoCheck">확인</button>	
                      	</div>
                        <span class="jeyak-area" style="margin-left: 50px;">이메일 인증번호 제약조건</span>
                      	<br><br>
                    </div> 
                    
                    <div>
                        <button class="signIn-btn disabled" type="submit">회원가입</button>
                    </div>
                    <br>
                    
                    <div>
						<button type="button" onclick="location.href='loginForm.me'" class="back">로그인 하러가기</button>
                    </div>

                    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                </form>
                
      </div>

	<script>
	
		// id 중복체크
		$(function() {
			
			const $idInput/*jQuery선택자로 선택*/ = $('#userId');
			
			$idInput.keyup(function() {
			
				// 최소 다섯글자 이상 입력했을 때만 ajax요청해서 중복체크
				
				if($idInput.val().length >= 5) {
					
					$.ajax({
						
						url :'idCheck.me',
						data : {checkId:$idInput.val()},
						success : function(result) {
							
							if(result == 'NNNNN') { // 사용불가
									
									$('#checkResultId').show();
									$('#checkResultId').css('color', 'red').text('중복된 아이디입니다!');
	                                $('#checkId').hide();
									$('#enrollForm : submit').attr('disabled', true);
							
							}else { // 사용가능
								
										$('#checkResultId').show();
										$('#checkResultId').css('color', 'yellowgreen').text('사용 가능한 아이디입니다!');
										$('#checkId').hide();
										$('#enrollForm : submit').removeAttr('disabled');				
							}
							
						}, error : function() {
							console.log("아이디 중복체크용 ajax통신 실패");
							}
						});
					  }
					else {
						
						$('#enrollForm : submit').attr('disabled', true);
						$('#checkResultId').hide();
						
							
					}
				  })	
		  })
		
		// 닉네임 유효성 검사
		
		$('#userNickName').keyup(function(){
			
			var $userNickName = $('#userNickName').val();
			var $nickCheck = $('#nickCheck');
			var nickCheckRegExp = /^[가-힣]{2,6}$/;
			
			if(!nickCheckRegExp.test($userNickName)) {
				
				$nickCheck.css('color', 'red').text('조건에 맞춰 입력해주세요');
				
					if($userNickName == "") {
	
						$nickCheck.css('color', 'red').text('2~6자의 한글만 사용 가능합니다.');
					}		
				}
				else {
					$nickCheck.css('color', 'yellowgreen').text('사용 가능합니다!');	
				}
		});
		
	
	// 아이디 유효성 검사
	
	
		$('#userId').keyup(function(){
			
			var $userId = $('#userId').val();
			var $checkId = $('#checkId');
			var idCheckRegExp = /^[a-zA-Z0-9]{5,15}$/;
			
			if(!idCheckRegExp.test($userId)) {
				
				$checkId.css('color', 'red').text('조건에 맞춰 입력해주세요');
				
					if($userId == "") {
						
						$checkId.css('color', 'red').text('5~15자의 영어, 숫자만 사용 가능합니다.');
					}
			}
			else {
				
				$checkId.css('color', 'yellowgreen').text('사용 가능합니다!');
			}
			
			
		});
		
	
	// 비밀번호 체크(유효성)
	
	  $('#userPwd').keyup(function() {
		  
		  
	
	  var $userPwd = $('#userPwd').val();
	  var $checkPwd = $('#checkPwd');
	  var pwdCheckRegExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
			
		
	  	if(!pwdCheckRegExp.test($userPwd)) {
	  		
	  		
	  		$checkPwd.css('color', 'red').text('조건에 맞춰 입력해주세요');
	  			
	  			if($userPwd == "") {
	  				
	  				$checkPwd.css('color', 'red').text('6~15자의 영문 대/소문자, 숫자, 특수문자 사용 가능합니다.');
	  				
	  			}
	  		
	  	}
	  	else {
	  		
	  		$checkPwd.css('color', 'yellowgreen').text('사용 가능합니다!');
	  	}
	  	
	  
	  });		
	
	// 비밀번호 재확인
	
	  $('#checkuserPwd').keyup(function() {
		 
	   var $userPwd = $('#userPwd').val();
	   var $checkuserPwd = $('#checkuserPwd').val();
	   var $recheckPwd = $('#recheckPwd');
	   var $pwdCheckRegExp = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,15}$/;
	   
	   if($pwdCheckRegExp.test($userPwd)) {  // 비밀번호 유효성 일치(사용이 가능 할 경우)
		   
		   if($checkuserPwd != $userPwd) { // 비밀번호와 비밀번호 확인이 불일치
			   
			  $recheckPwd.css('color', 'red').text('비밀번호가 일치하지 않습니다');
			   
		   }
		   else if($checkuserPwd == $userPwd) { // 비밀번호와 비밀번호 확인이 일치
			   
			   $recheckPwd.css('color', 'yellowgreen').text('비밀번호가 일치합니다!');
			   
		   }

	   }
	   	else { // 비밀번호 유효성 불일치(사용 불가), 보여줄 필요 없음
	   		
	   		$recheckPwd.text('');
	   	}
		  
		  
	  });
	

	// 이름 유효성 검사
		
	$('#userName').keyup(function(){
			
		var $userName = $('#userName').val();
		var $checkName = $('#checkName')
		var nameCheckRegExp = /^[가-힣]{2,10}$/;
	
		if(!nameCheckRegExp.test($userName)) {
			
			$checkName.css('color', 'red').text('조건에 맞춰 입력해주세요');
			
				if($userName == "") {

					$checkName.css('color', 'red').text('2~10자의 한글만 사용 가능합니다.');
				}		
			}
			else {
				$checkName.css('color', 'yellowgreen').text('사용 가능합니다!');	
			}
	  
	  
	});
	  
	</script>

</body>
</html>