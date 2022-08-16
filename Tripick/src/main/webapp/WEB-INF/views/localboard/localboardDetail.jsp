<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style>
        table * {margin:5px;}
        table {width:100%;}
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br><br><br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
			<br>
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td>${ b.lbTitle }</td>
                    <th>지역</th>
                    <td>${ b.localName }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ b.lbWriter } <button type="button" class="btn btn-info">채팅하기</button></td>
                    <th>작성일</th>
                    <td>${ b.createDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${ empty at.originName }">
                    			첨부파일이 없습니다.
                    		</c:when>
                    		<c:otherwise>
		                        <a href="${ at.changeName }" download="${ at.originName }">${ at.originName }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                    <th>조회수</th>
                    <td>${ b.count }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ b.lbContent }</p></td>
                </tr>
            </table>
                <div id="singo" align="right">
                	<button>신고하기</button>
                </div>
            <br>

			 <c:if test="${ loginUser.userId eq b.lbWriter }">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
                <a class="btn btn-danger" onclick="postFormSubmit(2)">삭제하기</a>
                <a class="btn btn-secondary" href="list.lb">목록으로</a>
            </div>
            
			 </c:if> 
			<form action="delete.bo" id="postForm" method="post">
				<input type="hidden" value="${ b.localBoardNo }" name="bno">
				<input type="hidden" value="${ at.changeName }" name="filePath">
			</form>
			<script>
				function postFormSubmit(num){
					if(num == 1){ // 수정하기 클릭 시
						$('#postForm').attr('action','updateForm.lb').submit();
					} else{ // 삭제하기 클릭 시
						$('#postForm').attr('action','delete.lb').submit();
					}
				}
			</script>
            <br><br>

            <!-- 댓글 기능은 나중에 ajax 배우고 나서 구현할 예정! 우선은 화면구현만 해놓음 -->
            <table id="replyArea" class="table" align="center">
                <thead>
                	<c:choose>
                		<c:when test="${ empty loginUser }">
               
		                    <tr>
		                        <th colspan="2">
		                            <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다. 로그인하세요</textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary disabled">등록하기</button></th>
		                    </tr>
                    	 </c:when>
                    	<c:otherwise>
		                    <tr>
		                        <th colspan="2">
		                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                        </th>
		                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply()">등록하기</button></th>
		                    </tr>
                    	</c:otherwise>
                    </c:choose>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
                    </tr> 
                </thead>
                <tbody>
                   
                </tbody>
            </table>
        </div>
        <br><br>

    </div>
    <script>
    	$(function(){
    		selectReplyList();
    		// 댓글조회하는 기능을 호출
    	})
    	
    	function addReply(){ // 댓글 작성용 ajax
    		
    		if($('#content').val().trim() != ''){
    			//console.log("ㅋㅋㅋ")
    			
    			/*
    				= 대입
    				2 == '2' true 
    				2 === '2' false 
    			*/
    			$.ajax({
    				url :'rinsert.lb',
    				data : {
    					refBoardNo : ${b.localBoardNo},
    					replyContent : $('#content').val(),
    					replyWriter : '${ loginUser.userId}'
    				}, success : function(status){
    					if(status == 'success'){
    						selectReplyList();
    						$('#content').val('');
    					}
    				}, error:function(){
    					console.log('댓글 못달았어~ ');
    				}
    			})
    			
    		} else{
    			alertify.alert("??", "댓글 똑바로 써라잇")
    		}
    		
    	}
    	
    	function selectReplyList(){
    		console.log('${b.localBoardNo}')
    		$.ajax({
    			url : 'rlist.lb', // 전체조회가 아님! 게시글에 딸린 댓글만 조회해야한다. (현재 게시글 번호만 넘겨야한다.)
    			data : {bno : ${ b.localBoardNo }},
    			success : function(list){
    				console.log(list);
    				let value='';
	    			for(let i in list){
	    				value += '<tr>'
	    					  + '<th>' + list[i].replyWriter + '</th>'
	    					  + '<td>' + list[i].replyContent + '</td>'
	    					  + '<td>' + list[i].create_date + '</td>'
	    					  + '<td><a href="">신고하기</a></td>'
	    					  + '</tr>'
	    			}
    			
    			$('#replyArea tbody').html(value);
    			$('#rcount').text(list.length);
    		}, error : function(){
    			console.log("에러났어~");
    		}
    		
    		})
    	}
    
    </script>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>