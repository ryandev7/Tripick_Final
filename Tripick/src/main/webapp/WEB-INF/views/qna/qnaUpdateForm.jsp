<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 수정 페이지</title>
<style>
    #qnaUpdate{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 30px;
    }
    #qnaForm{
        width: 1300px;
        height: 1000px;
        margin: auto;
        /*border: 3px solid lightgray;*/
        text-align: center;
    }
    
    #qnaTitle{
        width: 1300px;
        height: 80px;
        border: none;
        border-bottom: 3px solid lightgray;
        font-size: 30px;
        margin-top: 40px;
        
    }
    textarea:focus {outline:none;}
    #qnaBtn{
        width: 100px;
        height: 40px;
        font-size: 20px;
        cursor: pointer;
        border: none;
        background-color: #7AC5CD;
        color: white;
        outline: 0;
    }
    #cancelBtn{
        width: 100px;
        height: 40px;
        font-size: 20px;
        cursor: pointer;
        border: 1px solid black;
        background-color: white;
        outline: 0;
    }
</style>
</head>
<body>

    <div id="outer">
        <div id="wrap">

            <jsp:include page="../common/header.jsp"/>
            <script src="./resources/summernote/summernote-lite.js"></script>
            <script src="./resources/summernote/lang/summernote-ko-KR.js"></script>
            <link rel="stylesheet" href="./resources/summernote/summernote-lite.css">
            
            <br><br><br><br><br><br><br>

            <form action="update.qna" method="post">
                <input type="hidden" name="qnaNo" value="${q.qnaNo}">
                <input type="hidden" name="qnaWriter" value="${loginUser.userId}">
                <div id="qnaUpdate">
                    <p style="font-size: 40px;">Q&A 수정</p>
                </div>

                <div id="qnaForm">

                    <input type="text" name="qnaTitle" id="qnaTitle" placeholder="Q&A 제목" value="${q.qnaTitle}" required>
                    <br><br><br><br><br>
                    <div id="qnaContent">
                        <textarea id="summernote" name="qnaContent" required>${q.qnaContent}</textarea>
                    </div>
                    <br><br>
                    <button type="button" id="cancelBtn" onclick = "location.href = 'detail.qna?qno='+${q.qnaNo} ">수정취소</button>
                    <button type="submit" id="qnaBtn">수정하기</button>
                </div>


            </form>

            <script>
               
                $(document).ready(function() {
                    
                    $('#summernote').summernote({
                        height: 600,                 // 에디터 높이
                        minHeight: 600,             // 최소 높이
                        maxHeight: 600,             // 최대 높이
                        focus:false,
                        lang: "ko-KR",					// 한글 설정
                        width: 1300,
                        toolbar: [
                            // [groupName, [list of button]]
                            ['fontname', ['fontname']],
                            ['fontsize', ['fontsize']],
                            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
                            ['color', ['forecolor','color']],
                            ['table', ['table']],
                            ['para', ['ul', 'ol', 'paragraph']],
                            ['height', ['height']],
                            ['insert',['picture','link','video']],
                            ['view', ['fullscreen', 'help']]
                        ],
                        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
                        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
                    });
                    
                    $('#summernote').summernote('justifyFull');
                    $('#qnaTitle').focus();

                    
                });

            </script>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>