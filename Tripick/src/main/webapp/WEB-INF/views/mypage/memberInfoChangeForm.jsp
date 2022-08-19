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
							<input type="password" class="form-control" id="userPwd"
								placeholder="Please Enter Password" required> 
							<button type="button" id='chkpass'>비밀번호 확인</button>
								
								<br> <label
								for="userPwd">Password : </label> 
							<input type="password"
								class="form-control" id="newUserPwd"
								placeholder="Please Enter Password" name="userPwd" required> <br>
							​ <label for="checkPwd">Password Check : </label> <input
								type="password" class="form-control" id="checkPwd"
								placeholder="Please Enter Password" required> <br> ​ <label
								for="userName">이름 : </label> <input type="text"
								class="form-control" id="userName"
								value="${ loginUser.userName }" name="userName" required> <br>
							<label for="userName">닉네임 : </label> <input type="text"
								class="form-control" id="userNickName"
								value="${ loginUser.userNickName }" name="userNickName" required> <br>
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
							
							$('#chkpass').click(function () {
								
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