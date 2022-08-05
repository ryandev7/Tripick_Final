<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style>

	body{
	    margin: 0;
	}
	div{
	    box-sizing : border-box;
	    /*border : 1px solid red;*/
	}
	#outer{
	    margin: auto;
	}
	#wrap{
	    height: 1500px;
	    position: relative;
	}
	/*밑줄제거*/
	a{text-decoration: none;}
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
	}
	#header > div{
	    float : left;
	}
	#logo{
	    width: 30%;
	    height: 100px;
	    cursor: pointer;
	}
	#menubar{
	    width: 70%;
	    text-align: right;
	    margin-top: 30px;
	}
	#menubar > a{
	    color: black;
	    margin-right: 15px;
	}

</style>
</head>
<body>

	<div id="outer">

        <div id="header">
            <div id="logo">
                <img src="resources/common-upfiles/logo.png" style="width: 300px; height: 100px;">
            </div>
            <div id="menubar">
                <a href="">여행코스</a>
                <a href="">여행지</a>
                <a href="">커뮤니티</a>
                <a href="">로그인</a>
            </div>
        </div>

    </div>

</body>
</html>