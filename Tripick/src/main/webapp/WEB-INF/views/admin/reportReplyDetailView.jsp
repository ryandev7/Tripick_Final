<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고 상세보기</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
​	
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>신고된 댓글 정보</h2>
          
​
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="200">댓글작성된 게시판 번호</th>
                    <td colspan="5">${r.boardNo}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${r.reWriter}</td>
                    <th>작성일</th>
                    <td>${r.createDate}</td>
                    <th>댓글유형</th>
                    	<c:choose>
                 			<c:when test="${r.replyLevel eq '1' }">
                 				<td>지역게시판댓글</td>
                 			</c:when>
                 			<c:when test="${r.replyLevel eq '2' }">
                 				<td>동행게시판댓글</td>
                 			</c:when>
                 			<c:otherwise>
                 				<td>여행코스댓글</td>
                 			</c:otherwise>                    			
                		</c:choose>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="6"></td>
                </tr>
                <tr>
                    <td colspan="6"><p style="height:60px;">${r.content}</p></td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <h3>해당 게시글 신고 정보</h3>
             <table id="reportArea" align="center" class="table">
             	 <thead>
             	 	<th>신고자</th>
             	 	<th>신고내용</th>
             	 	<th>신고일자</th>
             	 	
             	 	<c:forEach var='r' items="${rptList}">
	             	 	<tr>
	             	 		<td>${r.userId}</td>
	             	 		<td>${r.rptContent}</td>
	             	 		<td>${r.rptDate}</td>
	             	 	</tr>
	             	 </c:forEach>
             	 </thead>
             </table>
            <br>
​			<!-- 삭제처리 버튼  -->
            <div align="center">
                <a class="btn btn-danger" onclick="postFormSubmit()">삭제하기</a>
                <a class="btn btn-secondary" href="replyList.re">목록으로</a>
            </div>
            <!-- 보안을 위해 포스트 방식을 사용 -->
            <form action="deleteReply.re" method="post" id="postForm">
            	<input type="hidden" value="${r.replyNo}" name="replyNo">
            </form>
            
            <script>
            	function postFormSubmit(){
            			$('#postForm').attr('action', 'deleteReply.re').submit();
            	}
            </script>
            
            <br><br>
</body>
</html>