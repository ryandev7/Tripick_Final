<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
	
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		
        .wrap{
            margin : auto;
            
        }

        .warp > div {width : 100%;}
        #header, #footer{height : 20%;}
        #content{height : 55%}

        #content > div{
            height : 100%;
            float : left;
        } 
        #content_1{width : 10%;}
        #content_2{width : 90%;}

		.AR-content{
		    width: auto;
		    height:1200px;
		}    
		#wrapper-filter{
		    width: 900px;
		    text-align : center;
		    margin: auto;
		}    
		#filter-bar li {
		    width: 100px;
		    text-align: center;
		    list-style-type: none;
		    cursor: pointer;
		    font-size: 20px;
		    line-height: 50px;
		    float: left;
		    font-weight:bold;
		}
		
		#filter-bar li:hover{
			color: rgb(142, 229, 238);
		}
		
		.option-1.active, .option-2.active, .option-3.active, .option-4.active, .option-5.active, .option-6.active, .option-7.active,
		.option-8.avtive, .option-9.active, .option-10.active, option-11.active, option-12.active, option-13.active, option-14.active,
		.option-15.active {
		    color: rgb(142, 229, 238);
		}
		
		#thumbnail{
		    width: 100px;
		    height: 100px;
		}
		#thumbnail>img{
		    width: 100px;
		    height: 100px;
		    margin-right: 15px ;
		    margin-left: 10px;
		    border-radius : 10%;
		}
		#course{
			float: left; 
			margin-bottom: 50px;
			margin-left : 100px; 
			text-align: left;
		    width: 450px;
		}
		#course-intro{
			height:350px;
			background-color:lightgrey;
			text-align:center;
			color: black;
			text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white;
			background : url("https://t1.daumcdn.net/cfile/blog/23143B3753DB225A35");
			background-size:cover;
			background-position:center;
			opacity: 0.8;
		}
	
		#search-box{
			width: 400px;
			border-radius : 10px;
			background-color:transparent;
			border : 0px;
			outline: 3px solid rgb(142, 229, 238);
		}
		#search-button{
			border:0;
			outline:none;
			background-color:transparent;
			color:rgb(142, 229, 238);
		}
		#course:hover{
			outline : 3px solid rgb(83, 134, 139);
			padding : 10px;
			border-radius : 10px;
			cursor : pointer;
		}
		#myplanbutton{
			width:80px;
			height:80px;
			margin-bottom:20px;
		}
		#myplan-btn-area{
			cursor:pointer; 
			font-size:40px; 
			margin-left:30%
		}
		#myplan-btn-area:hover{
			color:rgb(83, 134, 139);
		}
	</style> 
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>

		<div id="content">
			<div id="content_1">
				<jsp:include page="../mypage/myPageMenuForm.jsp" />
			</div>
			<div id="content_2" >
				<div class="innerOuter" style="padding: 5% 10%;">
					<h2 align="center">관심 여행</h2>
					<br> <br>
					<%--<label>${inquiry }</label> --%>
					<div id="courseList-area"
						style="width: 1200px; height: 500px; margin-left: 150px">
						<c:choose>
							<c:when test="${ empty likePlan }">
								등록한 여행코스가 없습니다!
							</c:when>
							<c:otherwise>
								<c:forEach var="planner" items="${ likePlan }">
									<table id="course">
										<tr>
											<td rowspan="5" id="thumbnail"><input type="hidden"
												name="plannerNo" value="${planner.plannerNo }"> <c:choose>
													<c:when test="${not empty planner.originName }">
														<img src="${planner.changeName}" />
													</c:when>
													<c:when test="${planner.type eq '나홀로여행'}">
														<img src="resources/common-upfiles/type1.jfif">
													</c:when>
													<c:when test="${planner.type eq '가족여행'}">
														<img src="resources/common-upfiles/type2.jfif">
													</c:when>
													<c:when test="${planner.type eq '친구/지인'}">
														<img src="resources/common-upfiles/type3.jfif">
													</c:when>
													<c:when test="${planner.type eq '연인/커플'}">
														<img src="resources/common-upfiles/type4.jfif">
													</c:when>
													<c:otherwise>
														<img src="resources/common-upfiles/type5.jfif">
													</c:otherwise>
												</c:choose></td>
											<th style="width: 350px">${planner.plannerTitle }</th>
										</tr>
										<tr>
											<td style="font-size: 12px;">작성자 |
												${planner.plannerWriter }</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">${planner.getWDate()-1 }박
												${planner.getWDate() }일</td>
										</tr>
										<tr>
											<td style="font-size: 12px;">${planner.createDate}|👁
												${planner.count }</td>
										</tr>
										<tr>
											<th style="font-size: 14px;"># ${planner.area } #
												${planner.type }</th>
										</tr>
									</table>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<br> 
					​
					<script type="text/javascript">
					
						$(function(){
							$("table[id=course]").click(function(){
								let plannerNo = $(this).find('input[name=plannerNo]').val();
								location.href="detail.co?pno=" + plannerNo;
							})
						})
					</script>
					
					<c:if test="${ not empty likePlan }">
						<div id="pagingArea" align="center">
							<ul class="pagination">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link"
											href="#">&lt;&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="interestTrip.my?cpage=${ pi.currentPage -1 }">&lt;&lt;</a></li>
									</c:otherwise>
								</c:choose>


								<c:forEach var="p" begin="${ pi.startPage }"
									end="${ pi.endPage }">
									<li class="page-item"><a class="page-link"
										href="interestTrip.my?cpage=${ p }">${ p }</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link"
											href="#">&gt;&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="interestTrip.my?cpage=${ pi.currentPage +1 }"> &gt;&gt;</a></li>
									</c:otherwise>
								</c:choose>

							</ul>
						</div>
					</c:if>
					
				</div>

			</div>

		</div>

		<jsp:include page="../common/footer.jsp" />
	</div>



</body>
</html>