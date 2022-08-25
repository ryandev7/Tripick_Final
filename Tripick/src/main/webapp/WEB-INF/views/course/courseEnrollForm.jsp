<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세일정</title>
<style>
    .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
    .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
    .map_wrap {position:relative;width:100%;height:500px;}
    #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
    .bg_white {background:#fff;}
    #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
    #menu_wrap .option{text-align: center;}
    #menu_wrap .option p {margin:10px 0;}  
    #menu_wrap .option button {margin-left:5px;}
    #placesList li {list-style: none;}
    #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
    #placesList .item span {display: block;margin-top:4px;}
    #placesList .item h5, #placesList .item .AR_info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
    #placesList .item .AR_info{padding:10px 0 10px 55px;}
    #placesList .AR_info .gray {color:#8a8a8a;}
    #placesList .AR_info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
    #placesList .AR_info .tel {color:#009900;}
    #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
    #placesList .item .marker_1 {background-position: 0 -10px;}
    #placesList .item .marker_2 {background-position: 0 -56px;}
    #placesList .item .marker_3 {background-position: 0 -102px}
    #placesList .item .marker_4 {background-position: 0 -148px;}
    #placesList .item .marker_5 {background-position: 0 -194px;}
    #placesList .item .marker_6 {background-position: 0 -240px;}
    #placesList .item .marker_7 {background-position: 0 -286px;}
    #placesList .item .marker_8 {background-position: 0 -332px;}
    #placesList .item .marker_9 {background-position: 0 -378px;}
    #placesList .item .marker_10 {background-position: 0 -423px;}
    #placesList .item .marker_11 {background-position: 0 -470px;}
    #placesList .item .marker_12 {background-position: 0 -516px;}
    #placesList .item .marker_13 {background-position: 0 -562px;}
    #placesList .item .marker_14 {background-position: 0 -608px;}
    #placesList .item .marker_15 {background-position: 0 -654px;}
    #pagination {margin:10px auto;text-align: center;}
    #pagination a {display:inline-block;margin-right:10px;}
    #pagination .on {font-weight: bold; cursor: default;color:#777;}
   
    .AR_button-area {
	    width: 100%;
	    border-bottom: 1px solid #757575;
	    height: 100px;
	    position: relative;
    }

    .AR_button-area_button-sumbit {
        width: 80px;
        height: 40px;
        position: absolute;
        top: 35px;
        right: 140px;
        cursor: pointer;
        background-color: rgb(122, 197, 205);;
        color: white;
        border: none;
        border-radius: 9px;
        font-size: 20px;
    }

    .AR_button-area_button-close {
        width: 80px;
        height: 40px;
        position: absolute;
        top: 35px;
        right: 40px;
        cursor: pointer;
        background-color: rgb(83, 134, 139);
        color: white;
        border: none;
        border-radius: 9px;
        font-size: 20px;
    }

    .AR_plan-container {
        width: 100%;
        height: 700px;
    }

    .AR_plan-daysbox {
        width: 120px;
        height: 90%;
        position: absolute;
        left: 0px;
        background-color: rgb(122, 197, 205);
        overflow-y: scroll;
    }

    .AR_plan-planscontainer {
        width: 260px;
        height: 90%;
        position: absolute;
        left: 120px;
    }

    .AR_plan-plansbox {
        float: left;
        border-right: 1px solid #757575;
        border-bottom: 1px solid #757575;
        width: 100%;
        height: 100%;
        overflow: scroll;
    }

    #AR_plan-searchbox {
        border-right: 1px solid #757575;
        border-bottom: 1px solid #757575;
        width: 350px;
        height: 90%;
        position: absolute;
        left: 380px;
        overflow-y: scroll;
    }

    .AR_plan-mapbox {
        height: 90%;
        width: 63%;
        position: absolute;
        left: 731px;
    }


    .AR_plan-daysboxtitle {
        height: 80px;
        border-bottom: 1px solid white;
        color: white;
        font-size: 20px;
        text-align: center;
        line-height: 80px;
        font-weight: bold;
    }

    .AR_plan-daybox {
        border-bottom: 1px solid white;
        height: 80px;
        color: white;
        position: relative;
        cursor: pointer;
    }

    .AR_plan-daybox:hover {
        background-color: rgb(83, 134, 139) !important;
    }

    .AR_plan-day {
        font-size: 22px;
        font-weight: bolder;
        position: absolute;
        top: 10px;
        left: 30px;
    }

    .AR_plan-date {
        position: absolute;
        bottom: 10px;
        left: 25px;
        font-size: 15px;
        font-weight: bold;
        color: #a9e2f3;
    }
    .AR_plan-plansboxtitle {
        background-color: #757575;
        height: 80px;
        color: white;
        font-size: 20px;
        font-weight: bold;
        text-align: center;
        line-height: 80px;
    }

    .AR_plan-planbox {
        width: 100%;
        height: 161px;
        border-bottom: 1px solid #757575;
    }

    .AR_plan-plannum {
        width: 55px;
        height: 100%;
        float: left;
        position: relative;
    }

    .AR_plan-plannum_img-navy {
        position: absolute;
        top: 28px;
        left: 15px;
        width: 33px;
    }

    .AR_plan-plannum_span--address {
        font-weight: bold;
        position: absolute;
        bottom: 55px;
        left: 18px;
        font-size: 14px;
    }

    .AR_plan-plannum_span-memo {
        font-weight: bold;
        position: absolute;
        bottom: 18px;
        left: 18px;
        font-size: 14px;
    }

    .AR_plan-plandetail {
        float: right;
        width: 203px;
        height: 100%;
        position: relative;

    }

    .AR_plan-plandetail_span-place {
        position: absolute;
        top: 30px;
        left: 0px;
        font-size: 25px;
        font-weight: bolder;
        width: 180px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    .AR_data-plandetail-placeAddress {
        position: absolute;
        bottom: 50px;
        left: 0px;
        width: 173px;
        font-size: 15px;
        font-weight: bold;
        font-family: 'Nanum Gothic', sans-serif;

    }

    .AR_plan-plandetail_input-memo {
        position: absolute;
        bottom: 15px;
        left: 0px;
        width: 170px;
        height: 20px;
        font-size: 11px;
        border: 2px solid #dadce0;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: 600;
    }

    .AR_plan-plandetail_button-blue {
        position: absolute;
        top: 8px;
        right: 6px;
        width: 20px;
        height: 20px;
        border: 3px solid #dadce0;
        border-radius: 6px;
        background-color: white;
        color: #bdbdbd;
        font-size: 20px;
        font-weight: 900;
        line-height: 10px;
        text-align: center;
        padding: 0;
        cursor: pointer;
    }


    #AR_plan-searchbox::-webkit-scrollbar, .AR_plan-plansbox::-webkit-scrollbar, .AR_plan-daysbox::-webkit-scrollbar {
        display: none;
    }

    .AR_plan-search {
        border-bottom: 1px solid #757575;
        width: 100%;
        height: 79px;
    }

    #keyword {
        border: 2px solid #757575;
        width: 230px;
        height: 35px;
        margin: 20px 10px 0 25px;
        font-weight: bold;
        font-size: 15px;
    }

    .AR_plan-search button {
        width: 50px;
        height: 40px;
        border: 2px solid #757575;
        border-radius: 6px;
        background-color: white;
        color: #757575;
        font-family: 'Nanum Gothic', sans-serif;
        font-weight: bold;
        cursor: pointer;
    }

    #AR_plan-searchbox_ul--gray {
        width: 100%;
        margin: 0;
        padding: 0;
    }

    #AR_plan-searchbox_ul--gray li {
        margin: 0px 0 0 0;
        border-bottom: 1px solid #757575;
        list-style: none;
        width: 100%;
        height: 80px;
        position: relative;
    }


    #AR_plan-searchbox_ul--gray .markerbg {
        float: left;
        position: absolute;
        left: 15px;
        width: 36px;
        height: 37px;
        background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
    }

    #AR_plan-searchbox_ul--gray .AR_info {
        float: right;
        width: 220px;
        height: 100%;
        position: absolute;
        left: 50px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    #AR_plan-searchbox_ul--gray h5 {
        position: absolute;
        top: -17px;
        left: 10px;
        font-size: 16px;
        width: 210px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    #AR_plan-searchbox_ul--gray span {
        position: absolute;
        left: 10px;
        bottom: 25px;
        font-size: 13px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    #AR_plan-searchbox_ul--gray .tel {
        position: absolute;
        left: 10px;
        bottom: 5px;
        font-size: 13px;
        color: green;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }

    #AR_plan-searchbox_ul--gray .item .marker_1 {
        background-position: 0 -10px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_2 {
        background-position: 0 -56px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_3 {
        background-position: 0 -102px
    }

    #AR_plan-searchbox_ul--gray .item .marker_4 {
        background-position: 0 -148px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_5 {
        background-position: 0 -194px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_6 {
        background-position: 0 -240px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_7 {
        background-position: 0 -286px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_8 {
        background-position: 0 -332px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_9 {
        background-position: 0 -378px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_10 {
        background-position: 0 -423px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_11 {
        background-position: 0 -470px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_12 {
        background-position: 0 -516px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_13 {
        background-position: 0 -562px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_14 {
        background-position: 0 -608px;
    }

    #AR_plan-searchbox_ul--gray .item .marker_15 {
        background-position: 0 -654px;
    }

    .placelist-div {
        position: absolute;
        right: 13px;
        top: 24px;
    }

    .placelist-div_button {
        width: 30px;
        height: 30px;
        border: 2px solid #777;
        border-radius: 5px;
        background-color: white;
        color: #777;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
    }

    #AR_plan-pagination {
        width: 100%;
        height: 70px;
        text-align: center;
        margin-top: 30px;
    }

    #AR_plan-pagination a {
        display: inline-block;
        margin-right: 10px;
        font-size: 18px;
    }

    #AR_plan-pagination .on {
        font-weight: bolder;
        cursor: default;
        color: #777;
    }

    #AR_plan-pagination a, #AR_plan-paginationp a:hover, #AR_plan-pagination a:active {
        color: #000;
        text-decoration: none;
    }

    #AR_plan-searchbox_ul--gray .item .marker_1 {
        background-position: 0 -10px;
    }

    .AR_plan-map {
        width: 85%;
        height: 100%;

    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	    <!----------------------------------------------------코스 등록 관련 script---------------------------------------------------------->
<script>
    $(function() {
    	
    	// 상세일정 날짜 클릭했을 경우
        $('.AR_plan-daybox').click(function(e) {
            e.preventDefault(); 
            $('.AR_plan-daybox').css("background-color","rgb(122,197,205)");
            $(this).css("background-color","rgb(83, 134, 139)");
        });
         
       // submit 버튼 클릭했을 경우 
       $(".AR_button-area_button-sumbit").click(function () {
    	   // Planner
           var plannerTitle = $("#plannerTitle").val();
           var plannerWriter = $("#plannerWriter").val();
           var f_date = $("#f_date").val();
           var l_date = $("#l_date").val();
           var w_date = $("#w_date").val(); 
           var area = $("#area").val();
           var type = $("#type").val();
           var originName = $("#originName").val();
           var changeName = $("#changeName").val();
           
           // Plan
           var tripDate = [];
           var placeName = [];
           var placeAddress = [];
           var xCoordinate = [];
           var yCoordinate = [];
           var planOrder = [];
           var memo = [];
           var isValid = true;
           
           // 각 여행일에 일정이 있는지 확인
           $('.AR_plan-plansbox').each(function (i){
               if($(this).children().length <= 1){
                   alert("각 여행일에는 최소 1개의 일정을 추가해주세요.");
                   isValid = false;
                   return false;
               }
           });
           
           // 각 여행일에 일정이 있을 경우
           if(isValid == true){
        	   // 여행일
               $('.AR_plan-planbox').each(function (i){
                   tripDate.push($(this).attr("data-date"));
               });
        	   // 여행장소(이름)
               $('.AR_plan-planbox').each(function (i){
                   placeName.push($(this).attr("data-placeName"));
               });
        	   // 여행장소(주소)
               $('.AR_plan-planbox').each(function (i){
            	   if($(this).attr("data-placeRoadAddress")==""){	// 도로명주소 없으면 일반주소            		   
	                   placeAddress.push($(this).attr("data-placeAddress"));
            	   } else {
          	           placeAddress.push($(this).attr("data-placeRoadAddress"));
            	   }	            	   
               });
        	   
        	   // 메모
               $('.AR_plan-plandetail_input-memo').each(function (i){
                   if($(this).val() == null){
                       memo.push(" ");
                   }else{
                       memo.push($(this).val());
                   }
               });
        	   
        	   // x좌표
               $('.AR_plan-planbox').each(function (i){
                   xCoordinate.push($(this).attr("data-x"));
               });
        	   
        	   // y좌표
               $('.AR_plan-planbox').each(function (i){
                   yCoordinate.push($(this).attr("data-y"));
               });
        	   
        	   // 일정 순서
               $('.AR_plan-planbox').each(function (i){
                   planOrder.push($(this).attr("data-planOrder"));
               });

               $.ajax({
                   url:"insert.co",
                   data:{
                	   plannerTitle : plannerTitle,
                       plannerWriter : plannerWriter,
                       fDate : f_date,
                       lDate : l_date,
                       wDate : w_date,
                       area : area,
                       type : type,
                       originName : originName,
                       changeName : changeName,
                       
                       tripDate : tripDate,
                       placeName : placeName,
                       placeAddress : placeAddress,
                       xCoordinate : xCoordinate,
                       yCoordinate : yCoordinate,
                       planOrder : planOrder,
                       memo : memo
                   },
                   type:"post",
                   success: function (result) {
                       alert(result);
                       location.href="main.co";
                   }
               });
            }
        });
    });
</script>
	    <!------------------------------------------------------------------------------------------------------------------------->
</head>
<body>

   <jsp:include page="../common/header.jsp"/>
	<!-- Planner -->
	<input type="hidden" name="plannerTitle" id="plannerTitle" value="${planner.plannerTitle}" />
	<input type="hidden" name="plannerWriter" id="plannerWriter" value="${planner.plannerWriter }" />
	<input type="hidden" name="fDate" id="f_date" value="<fmt:formatDate value="${planner.getFDate()}" pattern="yyyy-MM-dd" />" />
	<input type="hidden" name="lDate" id="l_date" value="<fmt:formatDate value="${planner.getLDate()}" pattern="yyyy-MM-dd" />" />
	<input type="hidden" name="wDate" id="w_date" value="${planner.getWDate()}" />
	<input type="hidden" name="area" id="area" value="${planner.area}" />
	<input type="hidden" name="type" id="type" value="${planner.type}" />
	<input type="hidden" name="originName" id="originName" value="${planner.originName}" />
	<input type="hidden" name="changeName" id="changeName" value="${planner.changeName}" />


	<br><br>
	<!-- button -->
	<div class="AR_button-area">
	    <button class="AR_button-area_button-sumbit">등록</button>
	    <button class="AR_button-area_button-close" onclick="history.back()">닫기</button>
	</div>


	<!-- 플래너 작성 -->
	<div class="AR_plan-container">

	    <!------------------------------------------------------ days 영역------------------------------------------------------------->
	    <div class="AR_plan-daysbox">	
	        <div class="AR_plan-daysboxtitle">일정</div>
	
	        <c:forEach items="${days}" var="day" varStatus="status">
	            <div class="AR_plan-daybox" onclick="plansChange(${status.count})">
	                <span class="AR_plan-day">DAY${status.count}</span>
	                <span class="AR_plan-date"><fmt:formatDate value="${day}" pattern="MM.dd (E)" /></span>
	            </div>
	        </c:forEach>
	
	    </div>
	    <!---------------------------------------------------------------------------------------------------------------------------->
	
	    <!---------------------------------------------------- 해당 날짜에 대한 일정 ---------------------------------------------------------->
	    <div class="AR_plan-planscontainer">
	        <c:forEach items="${days}" var="day" varStatus="status">
	            <div class="AR_plan-plansbox" data-date="<fmt:formatDate value="${day}" pattern="YYYY-MM-dd" />">
	                <div class="AR_plan-plansboxtitle">DAY${status.count} | <fmt:formatDate value="${day}" pattern="MM.dd E요일" /></div>
	            </div>
	        </c:forEach>
	    </div>
	    <!------------------------------------------------------------------------------------------------------------------------->

	    <!-------------------------------------------------- 키워드로 장소 검색 ---------------------------------------------------------->
	    <div id="AR_plan-searchbox">
	
	        <div class="AR_plan-search">
	            <form onsubmit="searchPlaces(); return false;">
	               <input type="text" value="${planner.area }" id="keyword" size="15">
	                <button type="submit">검색</button>
	            </form>
	        </div>	
	        <ul id="AR_plan-searchbox_ul--gray"></ul>
	        <div id="AR_plan-pagination"></div>
	    </div>
	    <!------------------------------------------------------------------------------------------------------------------------->
	
	    <!----------------------------------------------------- 지도 영역 ------------------------------------------------------------->
	    <div class="AR_plan-mapbox" style="z-index: 0">
	        <div class="AR_plan-map" id="AR_plan-map"></div>
	    </div>
	    <!------------------------------------------------------------------------------------------------------------------------->
	</div>

	<jsp:include page="../common/footer.jsp"/>
		<!------------------------------------------------- 지도 관련 script ---------------------------------------------------------->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f07946d5b7142dd1712d5cd8986d3f7e&libraries=services"></script>
    <script>
        // 지도 생성 코드
        var markers = [];
        var container = document.getElementById('AR_plan-map');
        var options = {
            center: new kakao.maps.LatLng(37.5536472, 126.9678003),
            level: 3
        };
        var map = new kakao.maps.Map(container, options);
        // 검색을 위한 코드 시작
        var ps = new kakao.maps.services.Places();
        // 키워드로 장소를 검색합니다
        searchPlaces();
        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {
            var keyword = document.getElementById('keyword').value;
            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }
            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, placesSearchCB);
        }
        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {
                // 정상적으로 검색이 완료됐으면
                // 검색 목록과 마커를 표출합니다
                displayPlaces(data);
                // 페이지 번호를 표출합니다
                displayPagination(pagination);
            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
                alert('검색 결과가 존재하지 않습니다.');
                return;
            } else if (status === kakao.maps.services.Status.ERROR) {
                alert('검색 결과 중 오류가 발생했습니다.');
                return;
            }
        }
        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {
            var listEl = document.getElementById('AR_plan-searchbox_ul--gray'),
                menuEl = document.getElementById('AR_plan-searchbox'),
                fragment = document.createDocumentFragment(),
                bounds = new kakao.maps.LatLngBounds(),
                listStr = '';
            // 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);
            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            for ( var i=0; i<places.length; i++ ) {
                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i),
                    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);
                fragment.appendChild(itemEl);
            }
            // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
            listEl.appendChild(fragment);
            menuEl.scrollTop = 0;
            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }
        // 검색결과 항목을 Element로 반환하는 함수입니다
        function getListItem(index, places) {
            var el = document.createElement('li'),
                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="AR_info">' +
                    '   <h4>' + places.place_name + '</h4>';
            if (places.road_address_name) {
                itemStr += '    <span>' + places.road_address_name + '</span>';
            } else {
                itemStr += '    <span>' +  places.address_name  + '</span>';
            }
            itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';
            itemStr += '<div class="placelist-div"><button class="placelist-div_button" onclick="planInsert(\'' + places.place_name + '\',\'' + places.y + '\',\'' + places.x + '\',\'' + places.road_address_name + '\',\'' + places.address_name + '\')">+</button></div>';
            el.innerHTML = itemStr;
            el.className = 'item';
            return el;
        }
        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage
                });
            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다
            return marker;
        }
        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }
            markers = [];
        }
        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('AR_plan-pagination'),
                fragment = document.createDocumentFragment(),
                i;
            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild (paginationEl.lastChild);
            }
            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;
                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }
                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }
        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
    </script>
	    <!------------------------------------------------------------------------------------------------------------------------->

	    <!-------------------------------------------------플래너 작성 관련 script-------------------------------------------------------->
	<script>

	// DAY 버튼 클릭시 해당 날짜의 일정 보여줌
	var planslide =  document.querySelectorAll(".AR_plan-plansbox");

	var plans_current = 1;

	function plansChange(n){
	    n -= 1;
	    for(var i=0;i<planslide.length;i++){
	        planslide[i].style.display = "none";
	    }
	    planslide[n].style.display = "block";
	}
	plansChange(plans_current);


	// 일정추가
	function planInsert(place_name,place_y,place_x, placeRoadAddress, placeAddress){
	     var parent =  $('.AR_plan-plansbox[style*="display: block"]');
	     var data_date = parent.attr('data-date');
	     var num = parent.children().length; // 제목 (DAY) 부분도 포함
	    if(num<11){ // 일정은 10개까지만 추가 가능
	        parent.append(getHtml(place_name,place_y,place_x,num, data_date, placeRoadAddress, placeAddress));
	    }else{
	        alert("일정은 최대 10개만 등록 가능합니다.");
	    }
	}


	//일정 추가시 일정 관련 <div> 생성
	function getHtml(place_name,place_y,place_x,num, data_date, placeRoadAddress, placeAddress){
	    var div = "<div class=\"AR_plan-planbox\" data-date=\"" + data_date + "\" data-y=\"" + place_y + "\" data-x=\"" + place_x 
	    			+ "\" data-placeRoadAddress=\"" + placeRoadAddress + "\""
                    + "\" data-placeAddress=\"" + placeAddress + "\" data-placeName=\"" + place_name + "\" data-planOrder=\"" + num +"\">";
	    div += "<div class=\"AR_plan-plannum\">";
	    div += "<div class=\"AR_data-plannum\" id=\"data-planOrder \"> No. " + num + "</div>";
		div += "<span class=\"AR_plan-plannum_span--address\"></span>";
	    div += "<span class=\"AR_plan-plannum_span-memo\"></span></div>";
	    div += " <div class=\"AR_plan-plandetail\">";
	    div += "<span class=\"AR_plan-plandetail_span-place\" title=\"" + place_name + "\">" + place_name + "</span>";
		div += "<div class=\"AR_data-plandetail-placeAddress\">" + placeAddress + "</div>"
	    div += "<input type=\"text\" name=\"memo\" class=\"AR_plan-plandetail_input-memo\" placeholder=\"메모를 입력해주세요.\"  maxlength=\"20\">";
	    div += "<button class=\"AR_plan-plandetail_button-blue\" onclick=\"planDelete(\'" + num +  "\')\">&times;</button></div> </div>";
	
	    return div;
	}


	// 상세일정 delete(X) 버튼 클릭시 해당 알정 삭제 후 그 후의 일정 planOrder 변경
	function planDelete(num){
	    var dayplanner =  $('.AR_plan-plansbox[style*="display: block"]'); // 현재 선택한 날짜의 일정 box
	    var dayplan = dayplanner.children().eq(num); // 삭제할 상세일정
	    var next_dayplans = dayplan.nextAll(); // 삭제된 일정의 다음 일정들

	    dayplan.detach();

	    next_dayplans.each(function (index, element){
	        $(this).find('div.AR_plan-plannum').text("No. " + num);
            $(this).attr('data-planOrder', num);

	        var btn = "planDelete(" + num + ")";
	        $(this).find('button').attr("onclick", btn);
	        ++ num;
	    });
	}
	</script>
    <!------------------------------------------------------------------------------------------------------------------------->

</body>
</html>