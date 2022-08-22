<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 신고 리스트</title>

</head>
<body>

	<jsp:include page="../common/header.jsp" />
​
    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>게시판 신고 리스트</h2>
            <br>
            <br>
            <br>
            <table id="reportList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>글유형</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>제목</th>
                        <th>신고횟수</th>
                        <th>처리상태</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var='r' items="${list}">
                    	<tr>
                    		<td class="rno">${r.boardNo}</td>
                    		<c:choose>
                    			<c:when test="${r.divCode eq 'L' }">
                    				<td>지역게시판</td>
                    			</c:when>
                    			<c:when test="${r.divCode eq 'M' }">
                    				<td>동행게시판</td>
                    			</c:when>
                    			<c:otherwise>
                    				<td>댓글</td>
                    			</c:otherwise>                    			
                    		</c:choose>
                    		<td>${r.lbWriter}</td>
                    		<td>${r.createDate}</td>
                    		<td>${r.title}</td>
                    		<td>${r.rptCnt}</td>
                    		<td>
            			        <c:choose>
	                    			<c:when test="${r.status eq 'Y' }">
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
             	var divCode ="";
            	$(function(){
            		$('#reportList>tbody>tr').click(function(){
            			if($(this).children(".rno").next().text() == "지역게시판"){
            				divCode = "L";
            			}else if($(this).children(".rno").next().text() == "동행게시판"){
            				divCode = "M";
            			}else{
            				divCode = "R";
            			}
            			location.href = 'detail.re?boardNo=' + $(this).children(".rno").text() + '&divCode='
            					+divCode;
            		})
            	})
            </script>
​
            <div id="pagingArea">
                <ul class="pagination">
                
                   <c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    	</c:when>
                    	<c:otherwise>
                    	 	<li class="page-item"><a class="page-link" href="list.re?cpage=${pi.currentPage -1}">Previous</a></li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                    	<li class="page-item"><a class="page-link" href="list.re?cpage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                   
                </ul>
            </div>
    </div>
​
    <jsp:include page="../common/footer.jsp" />
​
</body>
</html>

</body>
</html>