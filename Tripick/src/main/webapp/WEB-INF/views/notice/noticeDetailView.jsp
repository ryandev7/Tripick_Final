<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 페이지</title>
<style>
    #notice{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 30px;
    }
    #notice_nav{
        margin: 0 auto;
        width: 1300px;
        height: 30px;
        margin-top: 50px;
        margin-bottom: 10px;
        font-size: 18px;
    }
    #notice_nav > p{
        float: left;
        margin: 0;
    }
    #notice_nav > a{
        float: left;
    }
    #hr1{
        width:1300px;
        background-color: black;
        border: 1px solid black;
    }
    #hr2{
        width:1300px;
        background-color: lightgray;
        border: 1px solid lightgray;
        margin-top: 20px;
    }
    #titlebar{
        margin: auto;
        width: 1300px;
        height: 110px;
        margin-top: 20px;
        font-size: 15px;
    }
    #titlebar > p:nth-child(1){
        font-size: 30px;
        font-weight: 600;
        margin-top: 30px;
        margin-bottom: 20px;
    }
    #titlebar > p:nth-child(2){
        float: left;
        margin: 0;
        margin-left: 5px;
    }
    #titlebar > p:nth-child(3){
        float: left;
        margin: 0;
        margin-left: 5px;
    }
    #boardwriter{
        text-align: right; 
        width: 1300px; 
        margin: 0;
        margin-right: 5px;
    }

    #content{
        width: 1300px;
        height: 700px;
        margin: auto;
        font-size: 20px;
        margin-top: 40px;
        word-break:break-all;
    }
    #btn{
        width: 1300px;
        text-align: center;
        margin: auto;
        margin-top: 20px;
        cursor: pointer;
    }
    #btn > a:nth-child(1){
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        border: 1px solid black;
    }
    #btn > a:nth-child(2){
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        color: white;
        border: 1px solid red;
        background-color: red;
    }
</style>
</head>
<body>

    <div id="outer">
        <div id="wrap">
            <jsp:include page="../common/header.jsp"/>

            <br><br><br><br><br><br><br>

            <div id="notice">
                <p style="font-size: 40px;">공지사항</p>
            </div>
            <div id="notice_nav">
                <p>전체 ${listCount}</p>
                <div style="text-align: right; width: 1300px; height: 30px;">
                    <a href="list.no">전체 공지사항 보기</a>
                </div>
            </div>
            <hr id="hr1">

            <div id="titlebar">

                <p>${n.noticeTitle}</p>
                <p>${n.noticeDate}</p>
                <p>&nbsp;&nbsp;조회수&nbsp;&nbsp;${n.count}</p>
                <div style="margin-bottom: 0;">
                    <p id="boardwriter">작성자 : ${n.noticeWriter}</p>
                </div>
                <hr id="hr2">
            </div>

            <div id="content">
                <p id="notice_content">${n.noticeContent}</p>
            </div>
            
            <hr id="hr2">
            <br>

            <c:if test="${loginUser.authority eq 'A'}">
                <div id="btn">
                    <a onclick="postFormSubmit(1)">수정하기</a>
                    <a onclick="postFormSubmit(2)">삭제하기</a>
                </div>
            </c:if>

            <form action="" method="post" id="postForm">
                <input type="hidden" value="${n.noticeNo}" name="nno">
            </form>

            <script>
                function postFormSubmit(num){
                    if(num == 1){ // 수정하기
                        $('#postForm').attr('action', 'updateForm.no').submit();
                    }else{ // 삭제하기
                        $('#postForm').attr('action', 'delete.no').submit();
                    }
                }
            </script>
            
        </div>       
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>