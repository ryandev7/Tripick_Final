<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
 
 .nick {
 	margin-left : 200px;
 }
 
 .input-nickname {
 
 	 height: 30px;
     width: 300px;
 	
 }
 
 
 
 .input-id {
 	
 	 height: 30px;
     width: 300px;
 
 }
 
 .input-pwd {
 
 	height: 30px;
    width: 300px;
 }
 
 .input-repwd {
 
    height: 30px;
    width: 300px;
}

.input-name {
	height: 30px;
    width: 300px;
}

.input-email {
	height: 30px;
    width: 300px;
}

.input-emailNo {
	height: 30px;
    width: 300px;
}
 
 
 .all-nickarea {
 
 	margin-right : 50px
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
    background-color: #68dde3;
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
    background-color: #56dde1;
	 }
 
 
 
</style>




</head>
<body>

<div class="container" align ="center">
                <div class="text">SIGN UP</div>
                <div class="small-text">Enjoy your Trip - Tripick </div><br>

                <form action="insert.me" id="enrollForm" method="post">
                    <div class = "all-nickarea">
                        <label class="label-text" for="userNickName" class="nick">닉네임</label>
                        <div class="NickName-area">
                            <input class="input-nickname" type="text" id="userNickName" name="userNickName" placeholder="닉네임을 입력해주세요">
                        </div>
                    </div>
	        		<div>
                        <label class="label-text" for="userId">아이디</label>
                        <div class="Id-area">
                            <input class="input-id" type="text" id="userId" name="userId"placeholder="아이디를 입력해주세요">
                            <button class="checkId" id="checkId">중복체크</button>
                   		</div>
                    </div>	
                    <div>
                        <label class="label-text" for="userPwd">비밀번호</label>
                        <div class="Pwd-area">
                            <input class="input-pwd" type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요">
                        </div>
                    </div>

	       			<div>
                        <label class="label-text" for="checkuserPwd">비밀번호 확인</label>
                        <div class="checkPwd-area">
                            <input class="input-repwd" type="password" id="checkuserPwd" placeholder="비밀번호를 재입력해주세요">
                        </div>
                    </div>
		
                    <div>
                        <label class="label-text" for="userName">이름</label>
                        <div class="Name-area">
                            <input class="input-name" type="text" id="userName" name="userName" placeholder="이름을 입력해주세요">
                        </div>
                    </div>
                    <div>
                        <label class="label-text" for="email">이메일</label>
                        <div class="Email-area">
                            <input class="input-email" type="text" id="email" name="email" placeholder="이메일을 입력해주세요">
                            <button class="email-number" id="emailRanNo">인증번호 발송</button>                     
                        </div>
                    </div> 
                     <div>
                   		<label class="label-text" for="emailNo">인증번호 입력</label>
                   		<div>
                            <input class="input-emailNo" type="text" id="emailNo"  placeholder="인증번호를 입력해주세요">
		   					<button type="button" id="emailNoCheck">확인</button>	
                      	</div>
                      	<br>
                    </div> 
                    <div>
                        <button class="signIn-btn" type="submit">회원가입</button>
                    </div>
                    <br>
                    
                    <div>
						<button type="button" onclick="location.href='loginForm.jsp'" class="back">뒤로가기</button>
                    </div>
                </form>

                <div class="small-text"></div>
      </div>

	<script>
	
	
	
	</script>

</body>
</html>