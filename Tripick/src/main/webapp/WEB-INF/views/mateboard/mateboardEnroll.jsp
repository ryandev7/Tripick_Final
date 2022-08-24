<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행 글 작성</title>
<style>
    #mateEnroll{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 30px;
    }
    #mateForm-div{
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
    #resetBtn{
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

              <div id="mateForm-div">
	            <form name="mateForm"action="insert.mb" method="post" enctype="multipart/form-data">
	
	                <input type="hidden" name="mateWriter" value="${loginUser.userId}">
	                <div id="noticeEnroll">
	                    <p style="font-size: 40px;">동행</p>
	                </div>


                    <input type="text" name="mateTitle" id="mateTitle" placeholder="동행 제목" required>
                    <br><br>
                    <div id="mateSelect" align="left">
                        <label for="local">지역</label>
                        <select name="localCode">
                            <c:forEach var="list" items="${lclist}">
                        		<option value="${list.localCode}">${list.localName}</option>
                        	</c:forEach>
                        </select>
                        <br>
                        <span>동행인원 <input type="text" name="memberCount" id="memberCount" placeholder="(숫자)입력" required></span>
                        <br>
                        <span>
			                            시작날짜<input type="date" name="firstDate" required> 
			                            마지막날짜<input type="date" name="lastDate" required>
                        </span>
                        
                    </div>
                    <div id="mateContent">
                        <textarea id="summernote" name="mateContent" required></textarea>
                    </div>
                    <div>
                        <label for="upfile">첨부파일</label>
                        <input type="file" id="upfile" class="form-control-file border" name="upfile">
                    </div>
                    <br><br>
                    <button type="reset" id="resetBtn">초기화</button>
                    <button type="button" id="cancelBtn" onclick = "location.href = 'list.mb' ">작성취소</button>
                    <button type="button" id="mateBtn">동행등록</button>
                    
		            </form>
                </div>



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
                
            	// fDate와 lDate 비교
            	$(function(){		
            		$("#mateBtn").click(function(){
            			let startDate = new Date($("input[name='firstDate']").val());
            			let endDate = new Date($("input[name='lastDate']").val());
            			
            			console.log(startDate);
            			console.log(endDate);
            			if(startDate <= endDate){
            				mateForm.submit();
            			}else{
            				alert("동행 시작 날짜와 마지막 날짜를 확인해주세요");
            			}
            		})
            	});

            </script>
        </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>