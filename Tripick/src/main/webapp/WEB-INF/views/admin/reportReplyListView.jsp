<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 신고 리스트</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
​
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>댓글 신고 리스트</h2>
            <br>
            <br>
            <br>
            <table id="reportReplyList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>댓글번호</th>
                        <th>댓글유형</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>신고횟수</th>
                        <th>처리상태</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="re" items="${list}">
                    	
                    	<tr>                    		                            		            
                    		<td class="reno">${re.replyNo}</td>
	                    		<c:choose>
		                 			<c:when test="${re.replyLevel eq '1' }">
		                 				<td>지역게시판댓글</td>
		                 			</c:when>
		                 			<c:when test="${re.replyLevel eq '2' }">
		                 				<td>동행게시판댓글</td>
		                 			</c:when>
		                 			<c:otherwise>
		                 				<td>여행코스댓글</td>
		                 			</c:otherwise>                    			
	                			</c:choose>
                    		<td>${re.reWriter}</td>
                    		<td>${re.createDate}</td>
                    		<td>${re.rptCnt}</td>
                    		<td>
            			        <c:choose>
	                    			<c:when test="${re.status eq 'Y' }">
	                    				처리대기
	                    			</c:when>
	                    			<c:otherwise>
	                    				삭제완료
	                    			</c:otherwise>
                    			</c:choose>
                    		</td>
                    	</tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            
            <script>
	            $(function(){
	        		$('#reportReplyList>tbody>tr').click(function(){
	        			location.href = 'replyDetail.re?replyNo=' + $(this).children(".reno").text();

	        		})
	        	})
        		cosole.log("replyNo")
            </script>
            <div id="pagingArea">
                <ul class="pagination">
                
                   <c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	 	<li class="page-item"><a class="page-link" href="replyList.re?cpage=${pi.currentPage -1}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                    	<li class="page-item"><a class="page-link" href="replyList.re?cpage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="replyList.re?cpage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                   
                </ul>
            </div>
    </div>
​
    <jsp:include page="../common/footer.jsp" />

</body>
</html>