<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 동행(리스트)</title>
</head>
<body>
    <div id="wrap">
        <jsp:include page="../common/header.jsp"/>
        <br><br><br><br>
        <div align="center">
        <h3>나의 동행 리스트</h3>
	        <table>
	            <tr>
	                <th>동행글 제목</th>
	                <th>인원</th>
	                <th>동행날짜</th>
	                <th>모집여부</th>
	                <th>채팅</th>
	            </tr>
	            <!--리스트 받아와서 뿌려주기-->
	            <c:choose>
	            	<c:when test="${list ne null }">
			            <c:forEach var="list" items="${list}">
				            <tr>
				                <td>${list.mateTitle}</td>
				                <td>${list.memberCurCount} / ${list.memberCount}</td>
				                <td>${list.firstDate}~${list.lastDate}</td>
				                <td>
				                	<c:choose>
				                		<c:when test="${list.recruitStatus eq 'Y'}">현재모집중</c:when>
				                		<c:otherwise>모집완료</c:otherwise>
				                	</c:choose>
				                </td>
				                <td><button>채팅방입장</button></td>
				            </tr>
			            </c:forEach>
	            	</c:when>
	            	<c:otherwise>동행신청 내역이 없습니다.</c:otherwise>
	            </c:choose>
	        </table>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>

</body>
</html>