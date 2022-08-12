<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.5/dist/web/variable/pretendardvariable.css" />
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	@font-face {
	    font-family: 'RixYeoljeongdo_Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/RixYeoljeongdo_Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	@font-face {
	    font-family: 'Cafe24Dangdanghae';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.2/Cafe24Dangdanghae.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}

	@font-face {
		font-family: 'RixYeoljeongdo_Regular';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/RixYeoljeongdo_Regular.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	@font-face {
		font-family: 'twayfly';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayfly.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}

	body{
	    margin: 0;
	}
	div{
	    box-sizing : border-box;
	    /*border : 1px solid red;*/
	}
	li{
		list-style: none;
	}
	#outer{
	    margin: auto;
	}
	#wrap{
	    position: relative;
	}
	/*밑줄제거*/
	a{
		text-decoration: none;
		color: black;
	}
	/*하이라이트제거*/
	input:focus {outline:none;}
	/*자동완성시 배경색 없애기*/
	input:-webkit-autofill {
	    -webkit-box-shadow: 0 0 0 1000px #ffffff inset;
	}
	
	/*header*/ 
	#header{
	    width: 100%;
	    height: 100px;
	    position: absolute;
		z-index: 1;
	}
	#header > div{
	    float : left;
	}
	#logo{
	    width: 30%;
	    height: 100px;
		cursor: pointer;
	}
	#logo1{
		font-size: 45px;
		margin:0;
		float:left;
		margin-left: 70px;
		margin-top: 30px;
		
	}
	#logo2{
		font-size: 20px;
		margin-left: 225px;
		margin-top: 50px;
		
	}
	#menubar{
	    width: 70%;
	    text-align: right;
	    margin-top: 40px;
	}
	#menubar > a{
	    color: black;
	    margin-right: 15px;
		font-size: 18px;
	}
	
</style>
</head>
<body>

	<c:if test="${not empty alertMsg}">
		<script>
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

	<div id="outer">

        <div id="header">
            <div id="logo">
				<a href="${pageContext.request.contextPath}">
					<p id="logo1" style="font-family: 'Cafe24Dangdanghae';">Tripick</p>
					<p id="logo2" style="font-family: 'Pretendard Variable'; font-weight:200;">share&nbsp;your&nbsp;trip</p>
            	</a>
			</div>
            <div id="menubar">
                <a href="">여행코스</a>
                <a href="">여행지</a>
                <a href="">커뮤니티</a>
                 <c:choose>
	            	  <c:when test="${empty loginUser }">
		                 <!-- 로그인 전 -->     
	              		 <a href="loginForm.me">로그인</a>
	               	  </c:when>
	               	  <c:otherwise>
	               		 <!-- 로그인 후 -->              
	                    <a href="logout.me">로그아웃</a>
	                  </c:otherwise>
        	    </c:choose>
            </div>
        </div>

		<script>

			$('#header').css('position', 'fixed');

			$(window).scroll(function(){
				var scrollTop = $(window).scrollTop();
				if (scrollTop == 0) {
					console.log('dd');
					$('#header').css('background-color', 'transparent');
					$('#header').css('box-shadow', 'none');
				}else{
					$('#header').css('background-color', 'white');
					$('#header').css('box-shadow', '0px 0.1px 5px 0px gray');
				}
			});
			
		</script>

    </div>

</body>
</html>