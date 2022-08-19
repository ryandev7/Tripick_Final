<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<style>

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
        #content_1{width : 30%;}
        #content_2{width : 70%;}


		

	</style> 
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br><br><br><br><br><br>

		<div id="content">
			<div id="content_1">
				<jsp:include page="../mypage/myPageMenuForm.jsp" />
			</div>
			<div id="content_2">


			</div>

		</div>

		<jsp:include page="../common/footer.jsp" />
	</div>



</body>
</html>