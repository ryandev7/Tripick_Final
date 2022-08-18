<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripick : 여행코스</title>
   <!-- jQuery 라이브러리 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
   <!-- 부트스트랩에서 제공하고 있는 스타일 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
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
<script>

	// 제목 글자수
	$(function(){
	    $('input[name="plannerTitle"]').keyup(function(){
	    	let count = $(this).val().length;
	        $('#count').text(count); // 실시간 글자수	      
		    if(count > 15){
		    	alert('코스 이름은 15자 이내로 입력해주세요');
		    	$(this).val("");
	       	    $('#count').text('0'); // 실시간 글자수	      
		    }
	    })
	});

	// 여행일정날짜선택
	$(function () {
        $('input[name="days"]').daterangepicker({
            "locale": {
                "format": "YYYY-MM-DD",
                "separator": " ~ ",
                "applyLabel": "확인",
                "cancelLabel": "취소",
                "fromLabel": "From",
                "toLabel": "To",
                "customRangeLabel": "Custom",
                "weekLabel": "W",
                "daysOfWeek": ["월", "화", "수", "목", "금", "토", "일"],
                "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            },        
            "startDate": new Date(),
            "endDate": new Date(),
            "drops": "down"
        }, function (start, end) {
            // console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' ~ ' + end.format('YYYY-MM-DD'));
            // console.log(Math.ceil((end - start)/(1000*60*60*24)));
	        $('input[name="fDate"]').attr('value', start.format('YYYY-MM-DD'))
	        $('input[name="lDate"]').attr('value', end.format('YYYY-MM-DD'))
	        $('input[name="wDate"]').attr('value', Math.ceil((end - start)/(1000*60*60*24)))
	        $('input[name="days"]').attr("disabled", true)
        });
    });
	
	// 상세페이지로 이동
	$(function(){
		$("table[id=course]").click(function(){
			let plannerNo = $(this).find('input[name=plannerNo]').val();
			location.href="detail.co?pno=" + plannerNo;
		})
	})
</script>
</head>
<body>
   
   <jsp:include page="../common/header.jsp"/>

    <br><br><br><br>

    <div class="AR-content">

 		
        <div id="course-intro">
			<br><br><br><br><br>
			<h2>어디로 여행을 떠나시나요?</h2>
			<h6>여행 코스를 검색하거나 목록에서 직접 선택해주세요.</h6>
			<br>
			<!-- 게시글 검색 영역 -->
	        <div id="search-area">
	            <form id="searchForm" action="" method="get" align="center">
	                <input type="text" id="search-box" name="keyword">
	                <button id="search-button" title = "검색">🔍</button>
	            </form>
	        </div>

        </div>
        <br>
        <br>
		<c:choose>
			<c:when test="${empty loginUser }">				
		        <a onclick="alert('로그인 후 이용 가능한 서비스입니다.')" id="myplan-btn-area">
					<img id="myplanbutton" src="resources/common-upfiles/myplan.png">
						나만의 여행코스 만들기
				</a>
			</c:when>
			<c:otherwise>
		        <a data-toggle="modal" data-target="#courseModal" id="myplan-btn-area">
					<img id="myplanbutton" src="resources/common-upfiles/myplan.png">
						나만의 여행코스 만들기
				</a>			
			</c:otherwise>
		</c:choose>
		<!-- 지역 필터 -->
        <div id="wrapper-filter" style="height:100px">
            <ul id="filter-bar">
                <li class="filter-option option-1 active" data-target="option-1" onclick="filterArea('all')">전체</li>
                <li class="filter-option option-2">서울</li>
                <li class="filter-option option-3">경기</li>
                <li class="filter-option option-4">강원</li>
                <li class="filter-option option-5">충청</li>
                <li class="filter-option option-6">전라</li>
                <li class="filter-option option-7">경상</li>
                <li class="filter-option option-8">제주</li>
                <li class="filter-option option-9">부산</li>
                <li class="filter-option option-10">인천</li>
                <li class="filter-option option-11">대구</li>
                <li class="filter-option option-12">대전</li>
                <li class="filter-option option-13">광주</li>
                <li class="filter-option option-14">울산</li>
                <li class="filter-option option-15">세종</li>
            </ul>
        </div>		
        <br><br>
        <!--코스 목록-->
        <div id="courseList-area" style="width: 1200px;height: 500px; margin-left:150px">
			   <c:forEach var="planner" items="${list }">
		           <table id="course">
		                <tr>
			              <td rowspan="5" id="thumbnail">
			              	<input type="hidden" name="plannerNo" value="${planner.plannerNo }">
		                	<c:choose>
			                	<c:when test="${not empty planner.originName }">
			                    		<img src="${planner.changeName}"/>
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
				                <c:when test="${planner.type eq '부모님'}">
				                    	<img src="resources/common-upfiles/type5.jfif">		                    
								</c:when>	
		                    </c:choose>
			              </td>
		                    <th style="width:350px">${planner.plannerTitle }</th>
		                </tr>
		                <tr>
		                    <td style="font-size: 12px;">작성자 | ${planner.plannerWriter } </td>
		                </tr>
		                <tr>
		                    <td style="font-size: 12px;"> ${planner.getWDate()-1 }박 ${planner.getWDate() }일</td>
		                </tr>
		                <tr>
		                    <td style="font-size: 12px;">${planner.createDate} | 👁  ${planner.count }</td>
		                </tr>
		                <tr>
		                    <th style="font-size: 14px;"># ${planner.area } # ${planner.type }</th>
		                </tr>
		           </table>
	     	   </c:forEach>   
        </div>
        
        <!-- 여행일정 입력 모달창 -->
	    <div class="modal fade" id="courseModal">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h5 class="modal-title">Tripick 나만의 코스 만들기</h5>
	                    <button type="button" class="close" data-dismiss="modal"></button>
	                </div>
	        
	                <form action="enrollform.co" method="post" enctype="multipart/form-data">
	                    <!-- Modal body -->
	                    <div class="modal-body">
							<input type="hidden" name="plannerWriter" value="${loginUser.userId }">
							코스이름  &nbsp; <input type="text" name="plannerTitle" placeholder="15자 이내로 작성하세요" style="width:330px">
							<span id="count">0</span>/15 <br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							지 역 &nbsp;&nbsp;<select name="area">
								<option value="서울" selected>서울</option>
								<option value="경기">경기</option>
								<option value="강원">강원</option>
								<option value="충청">충청</option>
								<option value="전라">전라</option>
								<option value="경상">경상</option>
								<option value="부산">부산</option>
								<option value="인천">인천</option>
								<option value="대구">대구</option>
								<option value="대전">대전</option>
								<option value="광주">광주</option>
								<option value="울산">울산</option>
								<option value="세종">세종</option>
								<option value="제주">제주</option>						
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							여행타입&nbsp;&nbsp; <select name="type">
								<option value="나홀로여행" selected>나홀로여행</option>						
								<option value="가족여행">가족여행</option>						
								<option value="친구/지인">친구/지인</option>						
								<option value="연인/커플">연인/커플</option>						
								<option value="부모님">부모님</option>											
							</select><br><br>
							사진첨부 &nbsp;&nbsp; 
							<input type="file" name="upfile"><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							일 정 &nbsp; 
							<input type="text" name="days" style="width:200px">
							<input type="hidden" name="fDate">
							<input type="hidden" name="lDate">
							<input type="text" style="border:none; width:25px" name="wDate" value="1" readonly> 일
	                    </div>
	                           
	                    <!-- Modal footer -->
	                    <div class="modal-footer">
	                        <button type="submit" class="btn btn-info">다음으로</button>
	                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
		<br><br>
        <div class="page-area" style="margin-left:650px">
		    <ul class="pagination">
		        <c:choose>
		            <c:when test="${pi.currentPage eq 1 }">
		                <li class="page-item disabled"><a class="page-link" href="#">◀</a></li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item"><a class="page-link" href="main.co?cpage=${pi.currentPage - 1}">◀</a></li>                		
		            </c:otherwise>
		        </c:choose>
		
		        <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		            <li class="page-item"><a class="page-link" href="main.co?cpage=${p}">${p}</a></li>
		        </c:forEach>
		
		        <c:choose>
		            <c:when test="${pi.currentPage eq pi.maxPage }">
		                <li class="page-item disabled"><a class="page-link" href="#">▶</a></li>
		            </c:when>
		            <c:otherwise>
		                <li class="page-item"><a class="page-link" href="main.co?cpage=${pi.currentPage + 1}">▶</a></li>
		            </c:otherwise>
		        </c:choose>
		    </ul>
        </div>
    </div>

    <br><br>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>