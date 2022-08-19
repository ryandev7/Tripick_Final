<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripick : 코스 상세보기</title>
   <!-- jQuery 라이브러리 -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- 부트스트랩에서 제공하고 있는 스타일 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
	.AR-content{
	    width: auto;
	    height:auto;
	} 
	#AR-intro{
		height:250px;
		text-align:center;
		color : rgb(83, 134, 139);
	}
	#AR-intro-planner{
		text-align:left;
		color:black;
	}
	#thumbnail-area{
		width:300px;
		height:270px;
		margin-left:50px;
		float:left;
		
	}
	#thumbnail-area>img{
		width:200px;
		height:200px;
		border-radius:15px;	
	}
	#btn-area>img{
		padding:10px;
		width:70px;
		height:70px;
		margin-right:180px;
	}
	#btn-area>img:hover{
		cursor:pointer;
	}
	#AR-schedule-menu{	
		padding:50px 100px 100px 100px;
	}
	#AR-planList-area{
		overflow:scroll;
		height:600px;
	}
	#AR-planMap-area{
		height:550px;
	}
	#AR-planList{
		position: relative;
	}
	#AR-day-title{
		height:100px;
	}
	#plan-detail-left{
		outline : 3px solid rgb(122,197,205);
		margin-left:10px;
		padding:10px;
		width:45%;
		height:auto;
		border-radius:10px;
		float:left;
	}
	#plan-detail-right{
		outline : 3px solid rgb(142,229,238);
		margin-right:10px;
		padding:10px;
		width:45%;
		border-radius:10px;
		float:right;
	}
	#vertical-plans::before{
		content: '';
	    position: absolute;
	    top: 0px;
	    left: 50%;
	    height: 100%;
	    width: 4px;
	    background: #e7eaec;
	    box-sizing: border-box;
	}
	#plan-wrap{
		position: relative;
		height:auto%;
	}
	#AR-planList{
		position:relative;
	}
	#plan-order-icon{
		position: absolute;
	    left: 48.5%;
	    width: 40px;
	    height: 40px;;
	    border-radius: 50%;
	    font-size: 20px;
	    color:rgb(152,245,255);
	    background-color:rgb(83, 134, 139);
	    border: 3px solid rgb(83, 134, 139);
	    text-align: center;
	}
	#map-plan-order-icon{
		position: absolute;
	    left: 10px;
	    width: 30px;
	    height: 30px;;
	    border-radius: 50%;
	    font-size: 15px;
	    color:rgb(152,245,255);
	    background-color:rgb(83, 134, 139);
	    border: 3px solid rgb(83, 134, 139);
	    text-align: center;
	}
	
	#map{
		float:left;
		width:70%;
		height:500px;
	}
	
	#pills-tabContent{
		float:left;
		width:30%;
		height:500px;
		overflow:scroll;
	}
	#map-plan-box-day:hover{
		color : rgb(142,229,238);
		border-radius : 10px;
		cursor : pointer;
	}
	#reply-area{
		display: flex;
		justify-content: center;
	}
	#reply-area-child{
		width:800px;
	}
	#rpt-btn{
		width:20px;
		height:20px;
		margin-left:5px;
		margin-bottom:5px;
	}
	#rpt-reply, #delete-reply{
		cursor:pointer;
	}
	
	/*카카오맵 api*/
	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
	.distanceInfo .label {display:inline-block;width:50px;}
	.distanceInfo:after {content:none;}
</style>
<script>
	
	// 관심등록
	function likeCourse(){
		if(${empty loginUser}){
			alert("로그인 후 이용할 수 있는 서비스입니다.")
		}else{
			if(confirm("관심 코스로 등록하시겠습니까?")){
				location.href="like.co?plannerNo=${planner.plannerNo}&userId=${loginUser.userId}"
			}		
		}
	}
	
	if(${not empty loginUser}){		
		// 관심등록 해제
		function unlikeCourse(){
			if(confirm("관심 코스를 해제하시겠습니까?")){
				location.href="unlike.co?plannerNo=${planner.plannerNo}&userId=${loginUser.userId}"
			}
		}	
		
		// 관심등록 버튼 속성 변경
		$.ajax({
			url:"getLike.co",
			data: {userId : "${loginUser.userId}"},
			type:"get",
			success:function(result){
				for(let i = 0; i < result.length; i++){
					if(result[i].plannerNo == ${planner.plannerNo}){
						$("#like-btn").attr('id', 'unlike-btn');
						$("#unlike-btn").attr("onclick", "unlikeCourse();");
						$("#unlike-btn").attr("title", "관심등록 해제");
						$("#unlike-btn").attr("src", "resources/common-upfiles/unlike.png");
					}
				}
			}
		});
	}
</script>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br>

    <div class="AR-content">
    	<div id="AR-intro">
	    	<hr>
	    	<div id="thumbnail-area">
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
	    	</div>

    		<div id="btn-area" align="right">
    			<c:if test="${(loginUser.userNickName eq planner.plannerWriter) || (loginUser.authority eq 'A') }">
	    		 <button class="btn btn-info">수정</button>
	    		 <button class="btn btn-danger">삭제</button>
	    		</c:if>
	    		 <button class="btn btn-warning">신고</button>   		
	    		<!-- 관심등록 -->
    			<img id="like-btn" onclick="likeCourse()" title="관심 여행코스 등록" src="resources/common-upfiles/like.png">
    		</div>
	    	<div id="AR-intro-planner">
		    	<h2><b> ${planner.plannerTitle } </b></h2>
				<h4> #${planner.area } #${planner.type }</h4>
				<h6> ${planner.plannerWriter }  | ${planner.getFDate() } ~ ${planner.getLDate() } | ${planner.getWDate()-1 }박 ${planner.getWDate() }일 | 👁 ${planner.count }</h6>    	   	
	    	</div>
    	</div>
	    
	    <div id="AR-plans-view-area">
	    	<div id="AR-schedule-menu">
				<ul class="nav nav-tabs" id="postTab">
				  <li class="nav-item"><a data-toggle="tab" class="nav-link active" href="#AR-planList-area">여행 일정표 보기</a></li>
				  <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#AR-planMap-area">지도 보기</a></li>
				</ul>
				<br>
				
				
					
			<div class="tab-content" id="postTabContent">				
			<!-------------------------------------------------- 여행일정표 보기 --------------------------------------------------->				
				<div id="AR-planList-area" class="tab-pane fade show active">
									
					<div id="AR-schedule-menu-days">
						<nav id="navbar-example2" class="navbar navbar-light bg-light px-3">
						  <ul class="nav nav-pills">
						  	<c:forEach items="${days }" var="day" varStatus="status">
							    <li class="nav-item">
							      <a class="nav-link" href="#scrollspyHeading${status.count }">DAY ${status.count }</a>
							    </li>
						    </c:forEach>
						  </ul>
						</nav>
					</div>
					<hr>	
				
					  <c:forEach items="${days }" var="day" varStatus="status">					  
					  	<div id="plan-wrap">					  	
						  <div id="AR-day-title">						  	
							  <h1 id="scrollspyHeading${status.count }" align="center">DAY${status.count}</h1>
						  </div>						  
						  <c:forEach items="${planList }" var="plan">
							  <fmt:parseDate value="${plan.tripDate}" var="fmtTripDate" pattern="yyyy-MM-dd"/>
							  <fmt:parseNumber value="${day.time/(1000*60*60*24)}" integerOnly="true" var="planDate"/>
							  <fmt:parseNumber value="${fmtTripDate.time/(1000*60*60*24)}" integerOnly="true" var="tripDate"/>
							  <c:if test="${planDate-tripDate eq 0}">						  
								  <div id="AR-planList">					  
							  		<div id="vertical-plans">
							  			<c:choose>	
							  				<c:when test="${plan.planOrder%2==1}">		  		
											  	<div class="AR-plan-box-left" id="plan-box-day" style="height:100px">
											  		<div id="plan-order-icon">
												  		<i id="plan-order">${plan.planOrder }</i>
											  		</div>
											  		<div id="plan-detail-left">
											  			<b>${plan.placeName }</b><br>
											  			   ${plan.placeAddress }<br>											  		 
														 <div style="color:orange">  ${plan.memo } </div>
											  		</div>
											  	</div>	
									  		</c:when>
									  		<c:otherwise>				  					  	
											  	<div class="AR-plan-box-right" id="plan-box-day" style="height:100px">
											  		<div id="plan-order-icon">
												  		<i id="plan-order">${plan.planOrder }</i>
											  		</div>
											  		<div id="plan-detail-right">
											  			<b>${plan.placeName }</b><br>
											  			   ${plan.placeAddress }<br>
														   ${plan.memo }

											  		</div>
											  	</div>
									  		</c:otherwise>
									  	</c:choose>
							  		</div>
								  </div>
							  </c:if>						  
						  </c:forEach>
						</div>
						<br><br><br><br><br>										  
					  </c:forEach>  
				</div>
				
			<!------------------------------------------------------------------------------------------------------------>	
						
			<!-------------------------------------------------- 지도 보기--------------------------------------------------->
				<div id="AR-planMap-area" class="tab-pane fade">
				
				
					<!-- 지도 영역 -->
					<div id="map" style="z-index: 0;"></div>	
					
					<!-- 일정 영역 -->
					<div class="tab-content" id="pills-tabContent">					
					  <c:forEach items="${days }" var="day" varStatus="status">
					  	<hr>					  
					  	<div id="plan-wrap">					  	
						  <div id="AR-day-title">						  	
							  <h3 id="scrollspyHeading${status.count }" align="center">DAY${status.count} | <fmt:formatDate value="${day}" pattern="yy.MM.dd" /></h3>  
						  </div>						  
						  <c:forEach items="${planList }" var="plan">
							  <fmt:parseDate value="${plan.tripDate}" var="fmtTripDate" pattern="yyyy-MM-dd"/>
							  <fmt:parseNumber value="${day.time/(1000*60*60*24)}" integerOnly="true" var="planDate"/>
							  <fmt:parseNumber value="${fmtTripDate.time/(1000*60*60*24)}" integerOnly="true" var="tripDate"/>
							  <c:if test="${planDate-tripDate eq 0}">						  
								  <div id="AR-planList">					  
								  		<div id="map-plan-order-icon">
									  		<i id="plan-order">${plan.planOrder }</i>
								  		</div><br><br>
									  	<div id="map-plan-box-day" style="margin-left:10px; height:100px">
									  		<input type="hidden" name="xCoordinate" value="${plan.getXCoordinate() }" >
									  		<input type="hidden" name="yCoordinate" value="${plan.getYCoordinate() }" >
									  			<b>${plan.placeName }</b><br>
									  			   ${plan.placeAddress }<br>											  		 
												   ${plan.memo }
									  	</div>	
								  </div>
							  </c:if>						  
						  </c:forEach>
						</div>
						<hr>									  
					  </c:forEach>  										
					</div>													
				</div>				   	
			<!------------------------------------------------------------------------------------------------------------>		
			</div>	   	
    	</div>  	 
    </div>
    
	<!--------------------------------------------------댓글영역 시작------------------------------------------------->				
	<div id="reply-area">
		<div id="reply-area-child">
		<table id="reply-list">
			<thead>
		    <c:choose>
		        <c:when test="${empty loginUser }">
		            <tr>
		                <th colspan="2">
		                    <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다.</textarea>
		                </th>
		                <th style="vertical-align:middle"><button class="btn btn-secondary" disabled>등록하기</button></th>
		            </tr>
		        </c:when>
		        
		        <c:otherwise>
		            <tr>
		                <th colspan="2">
		                    <textarea class="form-control" id="replyContent" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
		                </th>
		                <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
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
    </div>
    
    <script>
    // 댓글 조회
    $(function(){
        selectReplyList();
	})
	function selectReplyList(){
	    $.ajax({
	        url:'rlist.co',
	        data : {plannerNo : ${planner.plannerNo}},
	        success:function(list){
	            let value='';
	            for(let i in list){
	                value += '<tr>'
	                       + '<th>' + list[i].replyWriter + '</th>'
	                       + '<td>' + list[i].replyContent + '</td>'
	                       + '<td>' + list[i].create_date + '</td>'
	                       + '<td id=\"rpt-reply\">'
	                       + '<img id=\"rpt-btn\" onclick=\"\" title=\"댓글 신고\" src=\"resources/common-upfiles/rpt-btn.png\">'
	                       + '<input type=\"hidden\" name=\"writeNo\" value=\"'+ list[i].replyNo +'\">'			
	                       + '</td>'
	                       + '<td id=\"delete-reply\" title=\"댓글 삭제\">❌</td>'
	                       + '</tr>'
	            }
	
	            $('#reply-list tbody').html(value);
	            $('#rcount').text(list.length);
	
	        }, error:function(){					
	            console.log("오류낫어")
	        }   
	    })
	}
    
    // 댓글 작성
    function addReply(){
        if($('#replyContent').val().trim() != ''){
            $.ajax({
                url : 'rinsert.co',
                data : {
                    replyWriter : '${loginUser.userId}',
                    replyContent : $('#replyContent').val(),
                    replyLevel : '3',
                	refBoardNo : ${planner.plannerNo}
                }, success:function(status){
                    if(status == 'success'){
                        selectReplyList();
                        $('#replyContent').val('')
                    }
                }, error:function(){
                    console.log('ㅗ')
                }					
            });
        }
        else{
            alertify.alert('댓글 똑바로 써라')
        }
    }
    </script>
    <!--------------------------------------------------댓글영역 끝------------------------------------------------->
  
   </div> 
   
   <br><br>
   
<jsp:include page="../common/footer.jsp"/>
<!-- 카카오맵API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f07946d5b7142dd1712d5cd8986d3f7e&libraries=drawing"></script>
<script>
//---------------------------------------지도 생성---------------------------------------------
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(${planList.get(0).getYCoordinate()+0.3}, ${planList.get(0).getXCoordinate()-0.5}), // 지도의 중심좌표
	    level: 10 // 지도의 확대 레벨
	};  
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	setInterval(function(){		
		map.relayout();
	}, 1000);
	
	var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다 
	var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

//---------------------------------------마커생성-----------------------------------------------
	
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [];
	
	<c:forEach items="${planList}" var="plan">
	
		var obj={
			content: '${plan.placeName}',
			latlng: new kakao.maps.LatLng(${plan.getYCoordinate()}, ${plan.getXCoordinate()})
		}		
		positions.push(obj);
		
	</c:forEach>

		//console.log(positions);
		    
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
//-----------------------------------------선그리기-----------------------------------------------	
    var linePath;
    var lineLine = new daum.maps.Polyline();
    var distance;
 
    for (var i = 0; i < positions.length; i++) {
        if (i != 0) {
            linePath = [ positions[i - 1].latlng, positions[i].latlng ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
        }
        ;
        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
 
        var drawLine = new daum.maps.Polyline({
            map : map, // 선을 표시할 지도입니다 
            path : linePath,
            strokeWeight : 3, // 선의 두께입니다 
            strokeColor : '#db4040', // 선의 색깔입니다
            strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
            strokeStyle : 'solid' // 선의 스타일입니다
        });
 
        distance = Math.round(lineLine.getLength());
        displayCircleDot(positions[i].latlng, distance);
         
    }
 
    function displayCircleDot(position, distance) {
        if (distance > 0) {
            // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
            var distanceOverlay = new daum.maps.CustomOverlay(
                    {
                        content : '<div class="dotOverlay">'+ positions[i].content
                        		+'<br> 거리 <span class="number">'
                                + distance + '</span>m</div>',
                        position : position,
                        yAnchor : 1,
                        zIndex : 2
                    });
            // 지도에 표시합니다
            distanceOverlay.setMap(map);
            map.relayout();
        }
    }
    
    $(function(){
    	$('div[id=map-plan-box-day]').on("click", function(){
    		let x = $(this).find('input[name="xCoordinate"]').val();
    		let y = $(this).find('input[name="yCoordinate"]').val();

    		map.setLevel(5); // 지도 레벨을 5로 설정
    		          
   		    // 이동할 위도 경도 위치를 생성합니다 
   		    var moveLatLon = new kakao.maps.LatLng(y, x);
   		    
   		    // 지도 중심을 이동 시킵니다
   		    map.setCenter(moveLatLon);
   	
   		    // 이동할 위도 경도 위치를 생성합니다 
   		    var moveLatLon = new kakao.maps.LatLng(y, x);
   		    
   		    // 지도 중심을 부드럽게 이동시킵니다
   		    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
   		    map.panTo(moveLatLon);            
   		    
    	});
    });
    
</script>

</body>
</html>