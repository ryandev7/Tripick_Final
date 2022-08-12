<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
        div {box-sizing:border-box;}
        #header {
            width:80%;
            height:100px;
            padding-top:20px;
            margin:auto;
        }
        #header>div {width:100%; margin-bottom:10px;}
        #header_1 {height:80%;}
        #header_2 {height:60%;}

        #header_1>div{
            height:100%;
            float:left;
        }
        #header_1_left {width:30%; position:relative;}
        #header_1_center {width:40%;}
        #header_1_right {width:30%;}

        #header_1_left>img {height:100%; position:absolute; margin:auto; top:0px; bottom:0px; right:0px; left:0px;}
        #header_1_right {text-align:center; line-height:35px; font-size:12px; text-indent:35px;}
        #header_1_right>a {margin:5px;}
        #header_1_right>a:hover {cursor:pointer;}

        #header_2>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        #header_2>ul>li {float:left; width:25%; height:100%; line-height:55px; text-align:center;}
        #header_2>ul>li a {text-decoration:none; color:black; font-size:18px; font-weight:900;}

        #header_2 {border-top:1px solid lightgray;}

        #header a {text-decoration:none; color:black;}

        /* 세부페이지마다 공통적으로 유지할 style */
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<h3>헤더</h3>
	<hr>
	
	<div class="content">
        <br><br>
        <div class="innerOuter">
            <h2 align="center">회원정보 수정</h2>
            <br>
​
            <form action="changeMemInfo.my" method="post" id="enrollForm">
                <div class="form-group">
                    <label for="userId">아이디 : </label>
                    <input type="text" class="form-control" id="userId" name="userId" value="${ loginUser.userId }" required readonly="readonly"> <br>
					
					<label for="userPwd">이전 Password : </label>
                    <input type="password" class="form-control" id="userPwd" placeholder="Please Enter Password"  required> <br>
                    
                    <label for="userPwd">Password : </label>
                    <input type="password" class="form-control" id="newUserPwd" placeholder="Please Enter Password" name="userPwd" required> <br>
​
                    <label for="checkPwd">Password Check : </label>
                    <input type="password" class="form-control" id="checkPwd" placeholder="Please Enter Password" required> <br>
​
                    <label for="userName">이름 : </label>
                    <input type="text" class="form-control" id="userName" value="${ loginUser.userName }" name="userName" required> <br>
                    
                    <label for="userName">닉네임 : </label>
                    <input type="text" class="form-control" id="userNickName" value="${ loginUser.userNickName }" name="userNickName" required> <br>
​
                    <label for="email">이메일 : </label>
                    <input type="email" class="form-control" id="email" value="${ loginUser.email }" name="email"> <br>
                    
                </div> 
                
                
                <br>
                <div class="btns" align="center">
                    <button type="button" id="sub" class="btn btn-primary disabled">회원정보수정</button>
                    <button type="reset" class="btn btn-danger">초기화</button>
                </div>
                
                <script type="text/javascript">
					$('#sub').click(function() {
						
						if(${loginUser.userPwd} == $('#userPwd').val() && $('#newUserPwd').val() == $('#checkPwd').val()){
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
        <br><br>
​
    </div>




</body>
</html>