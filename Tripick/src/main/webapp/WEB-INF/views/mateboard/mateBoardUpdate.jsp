<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 글 수정</title>
<style>
    #mateEnroll{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 30px;
    }
    #mateForm{
        width: 1300px;
        height: 1000px;
        margin: auto;
        /*border: 3px solid lightgray;*/
        text-align: center;
    }
    
    #mateTitle{
        width: 1300px;
        height: 80px;
        border: none;
        border-bottom: 3px solid lightgray;
        font-size: 30px;
        margin-top: 40px;
        
    }
    textarea:focus {outline:none;}
    #mateBtn{
        width: 100px;
        height: 40px;
        font-size: 20px;
        cursor: pointer;
        border: none;
        background-color: #7AC5CD;
        color: white;
    }
    #cancelBtn{
        width: 100px;
        height: 40px;
        font-size: 20px;
        cursor: pointer;
        border: 1px solid black;
        background-color: white;
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

            <form action="update.mb" method="post" enctype="multipart/form-data">

                <input type="hidden" name="mateWriter" value="${loginUser.userId}">
                <div id="noticeEnroll">
                    <p style="font-size: 40px;">동행</p>
                </div>

                <div id="mateForm">
					<input type="hidden" name="mateNo" value="${ m.mateNo }">
                    <input type="text" name="mateTitle" id="mateTitle" value="${ m.mateTitle }" required>
                    <br><br>
                    <div id="mateSelect" align="left">
                        <label for="local">지역</label>
                        
                        <select name="localCode">
                            <c:forEach var="list" items="${lclist}">
                        		<option value="${list.localCode}"
                        			<c:if test="${list.localCode eq m.localCode}"> selected="selected"</c:if>>${list.localName}</option>
                        	</c:forEach>
                        </select>
                        <br>
                        <span>동행인원 <input type="text" name="memberCount" id="memberCount" value="${ m.memberCount }" required></span>
		                  <br>
		                <span>시작날짜<input type="date" name="firstDate" value="${m.firstDate}"required> 마지막날짜<input type="date" name="lastDate" value="${m.lastDate}" required></span>
                    </div>
                    <div id="mateContent">
                        <textarea id="summernote" name="mateContent" required>${m.mateContent}</textarea>
                    </div>
                    <div>
                        <label for="upfile">첨부파일</label>
                        <input type="file" id="reupfile" class="form-control-file border" name="reupfile">
                        
                         <c:if test="${ not empty at.originName }">
	                            	현재 업로드된 파일 : 
    	                       <a href="${ at.changeName }" download="${ at.originName }">${ at.originName }</a>
    	                       <input type="hidden" name="originName" value="${ at.originName }">
    	                       <input type="hidden" name="changeName" value="${ at.changeName }">
                         </c:if>
                        
                    </div>
                    <br><br>
                    <button type="button" id="cancelBtn" onclick = "location.href = 'list.mb' ">작성취소</button>
                    <button type="submit" id="mateBtn">동행수정</button>
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
                    $('#noticeTitle').focus();

                    
                });

            </script>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>
</html>