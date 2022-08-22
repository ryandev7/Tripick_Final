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

   /* 아이디 출력 부분 */
   #result_id{
      font-weight: bold;
      margin-top:20px;
      font-size: 20px;
      text-align:center;
      color:black;
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
   

  </style>


</head>
<body>


 <div id="content" style="margin-bottom : 50px;">
   <div class="help_find" id="person_find">
         <ul class="tab_find">
            <li class="on" id="find_id" onclick="idForm();"><a href="javascript:;" class="link_find">아이디 찾기</a></li>
            <li id="find_pwd" onclick="pwdForm();"><a href="javascript:;" class="link_find">비밀번호 찾기</a></li>
         </ul>
         <div class="cont_find">
            <form action="https://www.saramin.co.kr/zf_user/helpdesk/person-find-secure" method="post" id="find_form">
               <fieldset>
                  <p class="desc_find">회원정보에 등록된 정보로 아이디 찾기 / 비밀번호 변경이 가능합니다.</p>
                  <ul class="list_find">
                     <li id="name_li">
                        <div class="wrap_lab"><label for="name" class="lab_find">이름</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="text" name="name" id="inputName" class="inp_find" required placeholder="이름을 입력해주세요">
                           </span>
                           <p class="message_find" id="msg_name" style="display:none;">이름에 특수문자, 숫자는 사용하실 수 없습니다.</p>
                        </div>
                     </li>
                     
                     <li id="id_li" style="display : none";>
                        <div class="wrap_lab"><label for="name" class="lab_find">아이디</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="text" name="ID" id="inputId" class="inp_find" required placeholder="아이디를 입력해주세요">
                           </span>
                           <p class="message_find" id="msg_name" style="display:none;">아이디에 특수문자, 숫자는 사용하실 수 없습니다.</p>
                        </div>
                     </li>
                     
                     
                     

                     <li id="li_cell">
                        <div class="wrap_lab"><label for="cell" class="lab_find">이메일 주소</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="text" name="email" id="email" name = "email" class="inp_find" required placeholder="이메일주소를 입력해주세요">
                           </span>   
                           <button type="button" id="btn_cert_cell1" class="btn_basic2 type03 btn_cert" onclick="emailNumber();" >인증번호 발송</button>
                        </div>
                     </li>
                     
             
                  

                     <li>
                        <div class="wrap_lab"><label for="emailNo" class="lab_find">인증번호</label></div>
                        <div class="wrap_input">
                           <span class="box_input">
                              <input type="text" name="emailNo" id="emailNo" class="inp_find" required placeholder="인증번호를 입력해주세요">
                           </span>
                           <button type="button" id="btn_cert_cell2" class="btn_basic2 type03 btn_cert" onclick="emailNumberCheck();" >인증확인</button>
                        </div>
                     </li>
                  </ul>
                  
                  <p id="result_id" style="visibility : hidden">
                      <span id="result_1">.</span>                     
                      <span id="result_ID" style="color : red;"> </span>                     
                      <span id="result_2"></span>                     
                  </p>
                  
                  <div class="wrap_link">
                     <button type="button" class="btn_biggest_type01" id="btn_cert_search" onclick="findId();">아이디 찾기</button><br>
                     <button type="button" class="btn_biggest_type01" id="btn_cert_back" style="margin-top : 10px;" onclick="location.href='loginForm.me' ">로그인 화면으로</button>
   <!--                        <button type="button" class="btn_biggest_type01" id="btn_next" style="display: none">다음</button>-->
                  </div>
               </fieldset>
            </form>
         </div>

   </div>
   </div>
   
   
   <script>
   


   
   
   // 아이디 찾기
   function findId() {
	  $('#result_id').css('visibility', 'visible');
      
	  
      var $userName = $('#inputName').val();
      var $emailAddr = $('#email').val();
      
      $.ajax({
         
      url : "findId",   
      type : "post",
      data : {userName : $userName,
             email : $emailAddr},
      success : function(userId) {
         
    	  if(userId == "noId") { // 조회 결과  x
    		  
    		$('#result_id').css('visibility', 'visible');    	  
    		$('#result_1').text("조회된 아이디가 없습니다.");  
    		$('#result_ID').text("");  
    		$('#result_2').text("");  
    		ID='N';
    		  
    	  }else {  // 조회  o
    		  
			$('#result_id').css('visibility', 'visible');
			$('#result_1').text("당신의 아이디는"); 
			$('#result_ID').text(userId);  
			$('#result_2').text("입니다");
			ID='Y';
    		  
    	   }
    	       
       },
      
      error : function() {
         console.log('실패');
        }
         
     });
	      
   }
   
   // 비밀번호 변경
   
   function changePwd() {
      	  
	      var $userId = $('#inputId').val();
	      var $emailAddr = $('#email').val();
	      
	      $.ajax({
	         
	      url : "findPwd",   
	      type : "post",
	      data : {userId : $userId,
	             email : $emailAddr},
	      success : function(userPwd) {
	         
	    	  if(userPwd == "noPwd") {  // 조회 결과 x
	    		  
	    		  $('#result_id').css('visibility', 'visible');
	    			$('#result_1').text("조회된 정보가 없습니다.");  
	        		$('#result_ID').text("");  
	        		$('#result_2').text("");  
	    		  
	    		  
	    	  }else {  // 조회 결과 o
	    		  
				alert('비밀번호 변경화면으로 이동합니다');
				
				pageGoPost({
					url: "changePwdForm",	//이동할 페이지
				    target: "_self",
				    vals: [				//전달할 인수들
				    	["userId", $userId],
				        ["email", $emailAddr],
					]
				});
					  
	    	  }
	    	       
	       },
	      
	      error : function() {
	         console.log('실패');
	        }
	         
	     });     
   }
   
   
   
   // 비밀번호 찾기 폼으로 이동
   //밑에 두줄씩 추가
   
   function pwdForm() {
      
      $('#name_li').hide();
      $('#id_li').show();
      $("#btn_cert_search").removeAttr("onclick");
      $("#btn_cert_search").attr("onclick","changePwd();");
      $('#btn_cert_search').text("비밀번호 변경");
	  $('#find_id').removeClass("on");
	  $('#find_pwd').addClass("on");
	  $('#result_id').css('visibility', 'hidden');
	  $('#inputEmail').val('');
	  $('#emailNo').val('');
	  
	  
      
   }
   
   // 아이디 찾기 폼으로 이동
   
   function idForm() {
      
      $('#name_li').show();
      $('#id_li').hide();
      $("#btn_cert_search").removeAttr("onclick");
      $("#btn_cert_search").attr("onclick","findId();");
      $('#btn_cert_search').text("아이디 찾기");
	  $('#find_pwd').removeClass("on");
	  $('#find_id').addClass("on");
	  $('#result_id').css('visibility', 'hidden');
      
      
   }
   
   // 에이젝스 내에서 비밀호변경 폼으로 이동하게 해주는 기능
   		
    function pageGoPost(d){
	var insdoc = "";
    
	for (var i = 0; i < d.vals.length; i++) {
	  insdoc+= "<input type='hidden' name='"+ d.vals[i][0] +"' value='"+ d.vals[i][1] +"'>";
	}
    
	var goform = $("<form>", {
		
	  method: "post",
	  action: d.url,
	  target: d.target,
	  html: insdoc
	}).appendTo("body");
    
	goform.submit();
	
}
   		
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