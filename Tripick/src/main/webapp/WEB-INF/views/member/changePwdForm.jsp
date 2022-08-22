<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
div {
      display: block;
   }
   /* 기본 스타일 설정 */
   body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, button {
      margin: 0;
      padding: 0;
      font-family: "Malgun Gothic",dotum,gulim,sans-serif;
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
   .tab_find{
      margin-left:0px;
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
      text-decoration-line : none;
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
      border:0;
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
      height : 38px;
      background-color : #7AD7BA;
   }
   .btn_basic2.type03 {
      border: 0;
      margin-top: 4px;
      color: #fff;
      font-weight: bold;
      background-color: #8EE5EE;
      font-size : 15px;
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

   .help_find .wrap_link .btn_biggest_type01, .help_find .wrap_link .btn_biggest_type03, .help_find .wrap_link .btn_biggest_type04 {
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
      outline : 0;
      box-sizing: border-box;
      color: #fff;
      font-size: 16px;
      line-height: normal;
      text-align: center;
      vertical-align: top;
      background-color: #6b80f1;
   }


   
   /* 아이디 찾기 버튼 */
   #btn_cert_search{
      background-color: #21cfe3;
      height: 50px;
   }
   /* 로그인 화면으로 버튼 */
   #btn_cert_back {
   	  background-color : black;
   	  height: 50px;
   }
   
   #btn_cert_cell1 {
   
    width : 125px;
    height : 38px;
   }
   
   #btn_cert_cell2 {
   
   width : 125px;
    height : 38px;
   
   }
   
   #pwdChangeBtn {
   
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
   
   
   

  </style>


</head>
<body>


 <div id="content" style="margin-bottom : 50px;">
   <div class="help_find" id="person_find" >

         <div class="cont_find">
            <form action="changePwd.me" method="post" id="find_form">
               <fieldset>
                  <p class="desc_find" id="pwdChangeBtn" align="center" style="margin-botton : 10px;">비밀번호 변경</p>
                  <br>
                  <br>
                  <br>
                  <ul class="list_find">
                     <li id="name_li">
                        <div class="wrap_lab"><label for="newPwd" class="lab_find">새 비밀번호</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="password" name="newPwd" id="newPwd" class="inp_find" required placeholder="비밀번호를 입력해주세요">
                           </span>
                              <input type="hidden" value="${userId}" name="userId" id="userId">
                        </div>
                     </li>
                     
                     <li id="li_cell">
                        <div class="wrap_lab"><label for="newPwdCheck" class="lab_find">비밀번호 확인</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="password" name="newPwdCheck" id="newPwdCheck"  class="inp_find" required placeholder="비밀번호를 재입력해주세요">
                           </span>              
                        </div>
                     </li>                    
                  </ul>
          
                  <div class="wrap_link">
                     <button type="submit" class="btn_biggest_type01" id="btn_cert_search" onclick="checkPwd();">비밀번호 변경</button><br>
                     <button type="button" class="btn_biggest_type01" id="btn_cert_back" style="margin-top : 10px;" onclick="location.href='loginForm.me' ">로그인 화면으로</button>
                  </div>
               </fieldset>
            </form>
         </div>

   </div>  
  </div>
   
   <script>
   
	     
   function checkPwd() {
   		
	$('#newPwdCheck').keyup(function() {
   	var $newPwd = $('#newPwd').val();
   	var $newPwdCheck = $('#newPwdCheck').val();
   		
	   
   if($newPwd != $newPwdCheck) {
	
	   alert("비밀번호가 일치하지 않습니다!");
	   
   		  }
   
	    })
	   }
   
   </script>
   
   
 </body>
 </html>  