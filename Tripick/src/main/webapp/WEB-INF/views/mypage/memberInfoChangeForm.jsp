<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
        .innerOuter {
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
        
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
         .jeyak-area {

		    text-align: center;
		    height: 10px;
		    color: red;
		    font-size: 12px;
		    margin-top: 10px;
		    margin-right:220px;
		 }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<div id="content">
			<div id="content_1">
				<jsp:include page="../mypage/myPageMenuForm.jsp" />
			</div>
			<div id="content_2">
				<div class="innerOuter">
					<h2 align="center">회원정보 수정</h2>
					<br> ​
					<form action="changeMemInfo.my" method="post" id="enrollForm">
						<div class="form-group">
							<label for="userId">아이디 : </label> 
							<input type="text"
								class="form-control" id="userId" name="userId"
								value="${ loginUser.userId }" required readonly="readonly"> <br> 
							
							<label for="userPwd">이전 Password : </label> 
							<input type="password" class="form-control" id="oldUserPwd"
								placeholder="Please Enter Password" required> 
							<button type="button" id='chkpass'>비밀번호 확인</button>
								
								<br>
								
							<label for="userPwd">Password : </label> 
							<input type="password"
								class="form-control" id="newUserPwd"
								placeholder="Please Enter Password" name="userPwd" required>
							 <span class="jeyak-area" id="checkPwd" style="margin-left:230px; display:block;" maxlength="15">6~15자의 영문 대/소문자, 숫자, 특수문자 사용 가능합니다.</span> <br>
							 
							​ <label for="checkPwd">Password Check : </label> 
							<input type="password" class="form-control" id="checkPwd"
								placeholder="Please Enter Password" required> <br> ​ 
								
							<label
								for="userName">이름 : </label> <input type="text"
								class="form-control" id="userName"
								value="${ loginUser.userName }" name="userName" required> 
							<span class="jeyak-area" id="checkName" style="margin-left: 100px;">2~10자의 한글만 사용 가능합니다.</span><br>
							
							<label for="userName">닉네임 : </label> <input type="text"
								class="form-control" id="userNickName"
								value="${ loginUser.userNickName }" name="userNickName" required> 
							<span class="jeyak-area" id="nickCheck" style="margin-left: 140px;">2~6자의 한글만 사용 가능합니다.</span>
							
							<br>
							​ <label for="email">이메일 : </label> <input type="email"
								class="form-control" id="email" value="${ loginUser.email }"
								name="email"> <br>

						</div>


						<br>
						<div class="btns" align="center">
							<button type="button" id="sub" class="btn btn-primary disabled" disabled="disabled">회원정보수정</button>
							<button type="reset" class="btn btn-danger">초기화</button>
						</div>

						<script type="text/javascript">
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
						
							$('#newUserPwd').keyup(function() {
								  
								  
								
								  var $userPwd = $('#newUserPwd').val();
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
						
							$('#chkpass').click(function () {
								
								var pass = $('#oldUserPwd').val();
								
								$.ajax({
									url : "passchk.my",
									data : {
										pass : pass
									},
									type : "post",
									success : function(result){
										if(result == 'Y') {
											alert("비밀번호가 일치합니다!");
											$('#userPwd').attr("readonly",true);
											$('#chkpass').attr("disabled",true);
											$('#sub').attr("disabled",false);
										} else {
											alert("비밀번호가 일치하지 않습니다!");
										}
									},
									error : function(){
										alert("인증실패");
									}
								});
								
							})
						
							$('#sub').click(function() {						
								if($('#newUserPwd').val() == $('#checkPwd').val()){
									$('#enrollForm').submit();
								} else {
									alert('비밀번호를 잘못입력하셨습니다.');
								}
							})
							
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
					</form>
					<div align="right">
						<button onclick="location.href='deleteMemberForm.my';">회원탈퇴</button>
					</div>
				</div>
				<br> <br>

			</div>

		</div>

		<jsp:include page="../common/footer.jsp" />
	</div>


</body>
</html>