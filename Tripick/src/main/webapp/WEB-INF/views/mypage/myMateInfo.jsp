<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행신청내역</title>
</head>
<body>
	<div class="wrap">
	  <div>
		<jsp:include page="../common/header.jsp"/>
	  </div>
	  <br><br><br><br><br><br><br>
		
		<div id="applicationList" align="center">
			<h3>동행 신청 내역</h3>
			<button id="sendMate">보낸 동행신청 내역</button>
			<button id="gaveMate">받은 동행신청 내역</button>
			<br><br>
		</div>
			<div align="center">
				<h3>보낸 동행 신청</h3>
	
				<table id="mateInfoS" align="center">
					<thead>
						<tr>
							<th>동행번호</th>
							<th>동행제목</th>
							<th>수락여부</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
					<!--보낸 동행 신청-->
					<c:forEach var="list" items="${list}">
						<c:choose>
						<c:when test="${list ne null}">
							<tr>
								<td>${list.refMateNo}</td>
								<td>${list.mateTitle}</td>
								<td>
									<c:choose>
										<c:when test="${ list.status eq 'N'}">대기중</c:when>
										<c:otherwise>완료</c:otherwise>
									</c:choose>
								</td>
								<td>${list.mateMember}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<div>동행 신청 내역이 없습니다.<br><a href="">동행신청 하러가기</a></div>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					
					</tbody>
				</table>
			</div>
			<br><br>
			<div>
				<!--받은 동행 신청 부분-->
				<h3 align="center">받은 동행 신청</h3>
				<table id="mateInfoG" align="center">
					<thead>
						<tr>
							<th>동행번호</th>
							<th>동행제목</th>
							<th>신청자</th>
							<th>수락여부</th>
							<th>채팅</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list2" items="${list2 }">
							<c:choose>
								<c:when test="${list2 ne null }">
									<tr>
										<td>${list2.refMateNo}</td>
										<td>${list2.mateTitle}</td>
										<td>${list2.mateMember }</td>
										<td>
											<c:choose>
												<c:when test="${list2.bstatus eq 'N'}">
													<a class="btn btn-secondary" id="accept">수락하기</a>
												</c:when>
												<c:otherwise>수락완료</c:otherwise>
											</c:choose>
										</td>
										<td><button>채팅방초대</button></td>
									</tr>
								</c:when>
								<c:otherwise>
									<div>받은 동행 신청이 없습니다.<button>동행 모집하러가기</button></div>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
					</tbody>
				</table>
			</div>
			

		</div>
		<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			$('#mateInfoG>tbody>tr').click(function(){
				var refNo = $(this).children().eq(0).text();
				console.log(refNo);
				var userId = $(this).children().eq(2).text();
				console.log(userId);
				location.href='accept.mb?userId=' + userId + '&refNo=' + refNo ;
			})
		})
	</script>
	

</body>
</html>