<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
   
   .data {
       font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, 'Noto Sans', sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
    font-size: 16px;
    font-weight: 400;
    line-height: 1.5;
    -webkit-text-size-adjust: 100%;
    color: #666;
    --uk-breakpoint-s: 640px;
    --uk-breakpoint-m: 960px;
    --uk-breakpoint-l: 1200px;
    --uk-breakpoint-xl: 1600px;
    --uk-leader-fill-content: '.';
    --uk-position-margin-offset: 0px;
    padding: 0;
    outline: none;
    box-sizing: border-box;
    height: 45px;
    width: 100%;
    margin: 40px 0;
   }
   
	 .logbtn {
	 
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

	.userId {
	
	height: 40px;
    width: 300px;
    BORDER-BOTTOM: #21cfe3 1px solid;
    BORDER-LEFT: medium none;
    BORDER-RIGHT: medium none;
    BORDER-TOP: medium none;
		
	}
	
	.userPwd {
	
	 height: 40px;
     width: 300px;
     BORDER-BOTTOM: #21cfe3 1px solid;
     BORDER-LEFT: medium none;
     BORDER-RIGHT: medium none;
     BORDER-TOP: medium none;
		
	}
	
	.id {
	margin-right : 265px;
	}
	
	.pwd {
	margin-right : 250px;
	}

	.idpwd {
	
	 margin-left : 155px;
	 font-size : 14px;
	 font-weight: 700;
     text-decoration: none;
	}

    .forgotLogin {

        padding-top: 10px;
    }

    .enroll {

        text-decoration: none;
        font-size:17px;
        font-weight: 500;

    }
</style>
</head>
<body>


	<div class="container" align="center">
	 		<form action ="login.me" method="post">
                <div class="text">LOG IN</div>
                <div class="small-text" style="color: grey;">Enjoy your Trip - Tripick</div><br>
                <div class="form-container">
                	
                    <div class="data">
                        <label align="left" class="id" style="color:#000000; font-weight:bold; margin-left : 5px;">아이디</label><br>
                        <input type="text" id="userId" name="userId" class="userId" required style="padding-left: 3px;">
                    </div>
                    <div class="data" style="padding-top : 10px;">
                        <label class="pwd" style="color:#000000; font-weight:bold; margin-left : 5px;">비밀번호</label><br>
                        <input type="password" id="userPwd" name="userPwd"  class="userPwd" required style="padding-left:3px;">
                    </div>
                    <br>
	        <div class="btn">
                    <div class="inner"></div>
                 <!--    <button type="submit" id="LoginBtn" >로그인</button>  -->
                    <button type="submit" class="logbtn">로그인</button>
                    </div>
                    <div class="forgotLogin">
						<a href="find.id-pwd" class="idpwd" style="color:#000000; font-weight: bold;">아이디 / 비밀번호 찾기</a>
                    </div>
                    <br>
                    <div class="signup-link">Tripick 회원이 아니신가요? &nbsp;<a class="enroll" href="enrollForm.me" style="color : #275ff9; font-weight: bold;
                        " >회원가입하기!</a></div>
                </div>
                <br>
                <div class="divider-container">
                    <div class="divider"></div>
                   
                   <br>
                </div>
                
          </form>  
      </div>
            
	

</body>
</html>