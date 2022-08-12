<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripick</title>
<style>
	p{
		font-family: 'Pretendard Variable';
	}
	#main{
		width: 100%;
		height: 100vh;
	}
    #main1_1{
    	width: 600px;
    	height: 100vh;
    	margin: 0;
        float: left;
		text-align: center;
    }
	#search{
		margin-top: 30vh;
		text-align: center;
	}
	#search_h2{
		font-family: 'Pretendard Variable'; 
		font-weight: 300;
	}
	#search_P{
		font-size: 80px; 
		font-family: 'Cafe24Dangdanghae'; 
		margin-bottom: 0;
		margin-top: 40px;
		letter-spacing: 3px;
	}
	#search_I{
		width: 300px;
		height: 50px;
		margin-top: 40px;
		font-size: 18px;
		text-align: center;
	}
	#search_btn{
		width: 305px;
		height: 55px;
		margin-top: 20px;
		font-size: 20px;
		background-color: #7AC5CD;
		border: none;
		color: white;
	}
	#down-arrow{
		margin-top: 25vh;
		width: 50px;
	}


    #main1_2{
    	width: 100% - 600px;
    	height: 100%;
    	margin: 0;
    	margin-left:600px;
		background-image : url('./resources/common-upfiles/main.gif');
		background-size : cover;
	}
	#main_weather{
		width: 100%;
		height: 100px;
		margin-top: 85vh;
		position: absolute;
		
	}
	#weather_area{
		width: 300px;
		height: 100%;
		float: right;
		color: white;
		font-size: 30px;
	}
	#weather_area>p{
		float: left;
		margin-left: 10px;
	}


	#mainImg{
		height:100%;
	}
	#main2{
    	width:100%;
    	height: 700px;
   		margin: auto;
    }
    #R_trip{
		width: 100%;
		height: 550px;
		display: flex;
	}
	#W_trip{
		float: left;
		width: 1500px;
		height: 500px;
		margin: auto;
		display: flex;
		padding: 40px;
		
	}
	#trip{
		float: left;
		margin: auto;
		width: 400px;
		height: 500px;
		margin-left: 35px;
		box-shadow: 1px 1px 8px 1px gray;
		text-align: center;
		font-size: 20px;
		cursor: pointer;
	}
	#trip > img{
		width: 100%;
		height: 400px;
	}
	#trip > p{
		margin-top: 10px;
	}
    #main3{
    	width:100%;
    	height: 700px;
   		margin: auto;
    }

	#views{
		width: 100%;
		height: 550px;
		display: flex;
	}
	#C_trip{
		float: left;
		width: 1500px;
		height: 500px;
		margin: auto;
		display: flex;
		padding: 40px;
	}
	#trip_course{
		float: left;
		margin: auto;
		width: 400px;
		height: 500px;
		margin-left: 35px;
		box-shadow: 1px 1px 8px 1px gray;
		font-size: 20px;
		cursor: pointer;
	}
	#trip_course > img{
		width: 100%;
		height: 350px;
	}
	#local{
		float: left;
	}
    #courseTitle{
        float:right;
	}
	#coursePeriod{
		float: left;
	}
	#courseCount{
		float: left;
	}
	#courseWriter{
		float: right;
	}
</style>
</head>
<body>

	<div id="outer">
        <div id="wrap">
        	<jsp:include page="common/header.jsp"/>
            <div id="main">
				<div id="main1_1">

					<div id="search">
						<h2 id="search_h2">여행 코스 공유 사이트</h2>
						<p id="search_P">Tripick</p>
						
						<form action="">
							<div>
								<input id="search_I" type="text" placeholder="✈︎ 떠나고싶은 지역을 입력하세요 ✈︎"> <br>
								<button id="search_btn">검색하기</button>
							</div>
						</form>
					</div>
					<a href="#target">
						<img id="down-arrow" src="./resources/common-upfiles/downarrow.png" >
					</a>
				</div>

				<div id="main_weather">
					<!--날씨api넣는곳-->
					<div id="weather_area">
						<p id="region"></p>
						<p id="currentT"></p>
						<p id="weather"></p>
						<p id="weatherImg"></p>
					</div>
				</div>
				
				<div id="main1_2">
					<!--배경이미지-->
				</div>
			</div>

			<script>
				$(function(){
					
					var city = "Seoul";
					var city = ["Seoul", "Sejong", "Incheon", "Daejeon", "Gwangju", "Daegu", "Ulsan", "Busan"]
					
					for(var i=0; i<city.length; i++)
					{
						var api = "https://api.openweathermap.org/data/2.5/weather?q="+city[i]+"&appid=6eeeca0f172d44be534f5fbeb8d3d809";
			
						$.ajax({
							url: api,
							dataType: "json",
							type: "GET",
							async: "false",
							success: function(resp) {

								console.log(resp);
								console.log("현재온도 : "+ Math.floor(resp.main.temp-273.15) +"℃" );
								console.log("날씨 : "+ resp.weather[0].main );
								console.log("도시이름  : "+ resp.name );  

								$("#region").html(resp.name);
								$("#currentT").html(Math.floor(resp.main.temp-273.15)+"℃");
								$("#weather").html(resp.weather[0].main);
            				}
						});
					}
				});
			</script>

			<a name="target"></a>
			<br><br><br><br><br>

			<div id="main2">
				<p style="font-size: 40px; text-align: center;">추천 여행지</p>

				<div id="R_trip">
					<div id="W_trip">
						<div id="trip">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<p>여행지 지역</p> 
							<p>여행지 이름</p>
						</div>
						<div id="trip">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<p>여행지 지역</p> 
							<p>여행지 이름</p>
						</div>
						<div id="trip">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<p>여행지 지역</p> 
							<p>여행지 이름</p>
						</div>
					</div>
				</div>
				
			</div>

			<br>
			
			<div id="main3">
				<p style="font-size: 40px; text-align: center;">조회수 TOP3 여행코스</p>

				<div id="views">
					<div id="C_trip">
						<div id="trip_course">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<div>
								<p id="local">서울</p>
								<p id="courseTitle">북촌 한옥마을</p>
							</div>
							<br><br><br>
							<div>
								<p id="coursePeriod">1박 2일</p>
								<p id="courseCount">13</p>
								<p id="courseWriter">닉네임</p>
							</div>
						</div>
						<div id="trip_course">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<div>
								<p id="local">서울</p>
								<p id="courseTitle">북촌 한옥마을</p>
							</div>
							<br><br><br>
							<div>
								<p id="coursePeriod">1박 2일</p>
								<p id="courseCount">13</p>
								<p id="courseWriter">닉네임</p>
							</div>
						</div>
						<div id="trip_course">
							<img src="./resources/common-upfiles/mainImg.jpeg">
							<div>
								<p id="local">서울</p>
								<p id="courseTitle">북촌 한옥마을</p>
							</div>
							<br><br><br>
							<div>
								<p id="coursePeriod">1박 2일</p>
								<p id="courseCount">13</p>
								<p id="courseWriter">닉네임</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
            <br><br><br><br>
           	<jsp:include page="common/footer.jsp"/>
        </div>

	</div>
	
	
	
</body>
</html>