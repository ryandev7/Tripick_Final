<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- JavaScript -->
	<script
		src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
	<!-- Default theme -->
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
	<!-- Semantic UI theme -->
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
	<!-- Bootstrap theme -->
	<link rel="stylesheet"
		href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />
	
	<!-- jQuery 라이브러리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>

		
		.innerOuter {
			margin: auto;
			padding: 5% 10%;
			background-color: white;
		}
		
		.wrap {
			margin: auto;
		}
		
		.warp>div {
			width: 100%;
		}
		
		#header, #footer {
			height: 20%;
		}
		
		#content {
			height: 55%
		}
		
		#content>div {
			height: 100%;
			float: left;
		}
		
		#content_1 {
			width: 20%;
			background: ;
		}
		
		#content_2 {
			width: 80%;
		}
	</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br> <br> <br> <br> <br> <br>

		<div id="content">
			<div id="content_1">
				<jsp:include page="../mypage/myPageMenuForm.jsp" />
			</div>
			<div id="content_2">
				<div class="innerOuter" style="padding: 5% 10%;">
					<h2 align="center">문의내역</h2>
					<br> <br>
					<%--<label>${inquiry }</label> --%>
					<table id="boardList" class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>문의 일시</th>
								<th>답변여부</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="iq" items="${sessionScope.inquiry}">
								<tr class="inquiryOne">
									<td>${ iq.qnaNo }</td>
									<td>${ iq.qnaTitle }</td>
									<td>${ iq.qnaWriter }</td>
									<td>${ iq.qnaDate }</td>

									<c:choose>
										<c:when test="${ not empty iq.answer }">
											<td>Y</td>
										</c:when>
										<c:otherwise>
											<td>N</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br> 
					​
 					<script type="text/javascript">
						$('.inquiryOne').on("click", function(){
							var bNo = $(this).children().html();
							
							location.href="detail.qna?qno=" + bNo;
						}) 
					</script> 

					<div id="pagingArea">
						<ul class="pagination">
							<c:choose>
								<c:when test="${ pi.currentPage eq 1 }">
									<li class="page-item disabled"><a class="page-link"
										href="#">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="inquiryhis.my?page=${ pi.currentPage -1 }">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>


							<c:forEach var="p" begin="${ pi.startPage }"
								end="${ pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="inquiryhis.my?page=${ p }">${ p }</a></li>
							</c:forEach>

							<c:choose>
								<c:when test="${ pi.currentPage eq pi.maxPage }">
									<li class="page-item disabled"><a class="page-link"
										href="#">&gt;&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="inquiryhis.my?page=${ pi.currentPage +1 }"> &gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>

						</ul>
					</div>
				</div>

			</div>

		</div>

		
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>