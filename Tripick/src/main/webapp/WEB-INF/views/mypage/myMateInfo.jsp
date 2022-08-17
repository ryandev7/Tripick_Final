<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행신청내역</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp"/>
		
		<div id="applicationList">
			<h3>동행 신청 내역</h3>
			<button id="sendMate">보낸 동행신청 내역</button>
			<button id="gaveMate">받은 동행신청 내역</button>

			<!--보낸 동행 신청-->
			<table id="mateInfoS">
				<tr>
					<th>동행번호</th>
					<th>동행제목</th>
					<th>작성자</th>
					<th>수락여부</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!--동행 신청 내역 없을 때-->
			<div>동행 신청 내역이 없습니다.<br><a href="">동행신청 하러가기</a>
			</div>

			<!--받은 동행 신청-->
			<table id="mateInfoG">
				<tr>
					<th>동행번호</th>
					<th>동행제목</th>
					<th>신청자</th>
					<th>수락여부</th>
					<th>채팅</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
			<!--동행 신청 받은 내역이 없을 때-->
			<div>받은 동행 신청이 없습니다.</div>
		</div>
		<jsp:include page="../common/footer.jsp"/>
	
	</div>
	

</body>
</html>