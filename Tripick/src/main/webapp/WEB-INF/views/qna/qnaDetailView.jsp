<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세페이지</title>
<style>
    textarea:focus {outline:none;}
    #qna{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 30px;
    }
    #qna_nav{
        margin: 0 auto;
        width: 1300px;
        height: 30px;
        margin-top: 50px;
        margin-bottom: 10px;
        font-size: 18px;
    }
    #qna_nav > p{
        float: left;
        margin: 0;
    }
    #qna_nav > a{
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
        height: 450px;
        margin: auto;
        font-size: 20px;
        margin-top: 40px;
        word-break:break-all;
    }

    /*댓글영역*/ 

    #answerList{
        width: 1300px;
        margin: auto;
        height: 200px;
    }
    #answerList > div{
        float: left;
        height: 60%;
        font-size: 20px;
    }
    #answerList > p{
        font-size: 25px;
    }
    
    #answerForm{
        width: 1300px;
        margin: auto;
        height: 300px;
    }
    #answerForm > p{
        font-size: 25px;
    }
    #answerArea{
        width: 100%;
        height: 60%;
        border: 1px solid gray;
    }
    #answerContent{
        font-size: 20px;
        width: 98%;
        height: 100px;
        border: none;
        margin-top: 10px;
        margin-left: 10px;
    }
    #answerBtn{
        float: right;
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        color: white;
        background-color: #7AC5CD;
        margin-top: 18px;
        border: none;
        cursor: pointer;
    }

    #qnaUpdateBtn{
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        border: 1px solid black;
        cursor: pointer;
    }
    #qnaDeleteBtn{
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        color: white;
        border: 1px solid red;
        background-color: red;
        cursor: pointer;
    }

    #answerText > textarea{
        font-size: 20px;
        width:95%; 
        height:60%; 
        resize: none; 
        margin-top:10px;
    }
    #answerBtnArea > button:nth-child(1){
        font-size: 20px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 8px;
        padding-bottom: 8px;
        border: 1px solid black;
        cursor: pointer;
        margin-top: 10px;
    }
    #answerBtnArea > button:nth-child(2){
        font-size: 20px;
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 8px;
        padding-bottom: 8px;
        color: white;
        border: 1px solid red;
        background-color: red;
        cursor: pointer;
        margin-top: 10px;
    }
    #answerUpdateBtn{
        font-size: 20px;
        padding-left: 15px;
        padding-right: 15px;
        padding-top: 8px;
        padding-bottom: 8px;
        color: white;
        border: 1px solid #7AC5CD;
        background-color: #7AC5CD;
        cursor: pointer;
        margin-top: 10px;
    }
</style>
</head>
<body>
    <div id="outer">
        <div id="wrap">
            <jsp:include page="../common/header.jsp"/>

            <br><br><br><br><br><br><br>

            <div id="qna">
                <p style="font-size: 40px;">Q&A</p>
            </div>
            <div id="qna_nav">
                <div style="text-align: right; width: 1300px; height: 30px;">
                    <a href="list.qna">전체 Q&A 리스트 보기</a>
                </div>
            </div>
            <hr id="hr1">

            <div id="titlebar">

                <p>${q.qnaTitle}</p>
                <p>${q.qnaDate}</p>
                <div style="margin-bottom: 0;">
                    <p id="boardwriter">작성자 : ${q.qnaWriter}</p>
                </div>
                <hr id="hr2">
            </div>

            <div id="content">
                <div style="height: 400px;">
                    <p id="qna_content">${q.qnaContent}</p>
                </div>
                
                <c:if test="${loginUser.authority eq 'M'}">
                    <div id="btn" style="height: 50px; float: right;">
                        <c:if test="${empty q.answer}">
                            <a id="qnaUpdateBtn" onclick="postFormSubmit(1)">수정하기</a>
                        </c:if>
                        <a id="qnaDeleteBtn" onclick="postFormSubmit(2)">삭제하기</a>
                    </div>
                </c:if>

                <form action="" method="post" id="postForm">
                    <input type="hidden" value="${q.qnaNo}" name="qno">
                </form>
    
                <script>
                    function postFormSubmit(num){
                        if(num == 1){ // 수정하기
                            $('#postForm').attr('action', 'updateForm.qna').submit();
                        }else{ // 삭제하기
                            $('#postForm').attr('action', 'delete.qna').submit();
                        }
                    }
                </script>

            </div>
            
            <hr id="hr2">

            <c:choose>
                <c:when test="${not empty q.answer}">
                    <div id="answerList">
                        <br>
                        <p>답변</p>
                        
                        <div style="width: 150px;">
                            <c:if test="${q.answerWriter eq 'admin'}">
                            <p>관리자</p>
                            </c:if>
                        </div>
                        <div id="answerText" style="width: 700px;">
                            <p>${q.answer}</p>
                        </div>
                        <div id="answerListDate" style="width:150px"> 
                            <p>${q.answerDate}</p>
                        </div>
                        <div id="answerBtnArea" style="width:150px;"> 
                            <c:if test="${loginUser.authority eq 'A'}">
                                <button onclick="updateAnswer()">수정</button>
                                <button onclick="deleteAnswer()">삭제</button>
                            </c:if>
                        </div>
                        
                    </div>
                </c:when>

            </c:choose>
            <!-- 관리자 -->
            <c:if test="${loginUser.authority eq 'A' && empty q.answer}">
                <div id="answerForm">
                    <br>
                    <p>답변 작성</p>
                    <div id="answerArea">
                        <textarea id="answerContent" style="resize: none;"></textarea>
                        <button id="answerBtn" onclick="addAnswer()">등록하기</button>
                    </div>
                </div>
                </c:if>

                <form action="" method="post" id="postAnswer">
                    <input type="hidden" value="${q.qnaNo}" name="qno">
                </form>

            <script>
                function addAnswer(){
                    // 답변작성 ajax
                    if($('#answerContent').val().trim() != ''){

                        $.ajax({
                            url: 'answer.in',
                            data: {
                                qnaNo : ${q.qnaNo},
                                answer : $('#answerContent').val(),
                                answerWriter : '${loginUser.userId}'
                            },
                            success: function(result){
                                if(result == 'success'){
                                    alert('답변 작성 성공');
                                    location.reload();
                                }
                            },
                            error: function(){
                                console.log('실패');
                            }   

                        });
                    }
                    else{
                        alert('답변을 작성해주세요.');
                    }
                }

                function updateQnaAnswer(){
                    // 답변작성 ajax
                    if($('#updateAnswerContent').val().trim() != ''){

                        $.ajax({
                            url: 'answer.up',
                            data: {
                                qnaNo : ${q.qnaNo},
                                answer : $('#updateAnswerContent').val(),
                                answerWriter : '${loginUser.userId}'
                            },
                            success: function(result){
                                if(result == 'success'){
                                    alert('답변이 수정되었습니다.');
                                    location.reload();
                                }
                            },
                            error: function(){
                                console.log('실패');
                            }   

                        });
                    }
                    else{
                    alert('답변을 작성해주세요.');
                    }
                }

                function deleteAnswer(){
                    $('#postAnswer').attr('action', 'delete.an').submit();
                }

                function updateAnswer(){
                    $('#answerText').html('<textarea id="updateAnswerContent">${q.answer}</textarea>');
                    $('#answerListDate').html('<button id="answerUpdateBtn" onclick="updateQnaAnswer()">수정하기</button>');
                    $('#answerBtnArea').html('');
                }
            </script>
              

                
        </div>

    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>