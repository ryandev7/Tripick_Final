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
        width: 300px;
        height: 50px;
        margin-top: 20px;
        font-size: 20px;
        background-color: #7AC5CD;
        border: none;
        color: white;
        cursor: pointer;
        outline: 0;
    }
    #down-arrow{
        width: 50px;
        /*margin-top: 25vh;*/
         
    }
    #targetD{
        margin-top: 200px;
        
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
        width: 400px;
        height: 60%;
        float: right;
        color: white;
        font-size: 30px;
        margin-top: 20px;
    }
    #weather_area>div{
        float: left;
    }
    #weatherTitle{
        text-align: right;
        font-size: 30px;
        color: white;
    }
    #weatherTitle>p{
        margin: 0;
        margin-right: 68px;
    }
    #region{
        width: 150px;
        text-align: right;
        margin-right: 10px;
    }
    #currentT{
        width: 70px;
        text-align: center;
    }
    #weather{
        width: 100px;
        text-align: right;
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
        transition: all 0.2s linear;
    }
    #trip > a > img{
        width: 100%;
        height: 400px;
    }
    #trip:hover{
        transform: scale(1.05);
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
        position: absolute;
    }
    #C_trip{
        width: 1500px;
        height: 500px;
        margin: auto;
    }

    #C_trip > div{
        float: left;
    }

    #trip_course{
        margin: auto;
        width: 600px;
        height: 200px;
        margin-left: 95px;
        margin-top: 30px;
        margin-bottom: 30px;
        font-size: 20px;
    }

    #thumbnail{
        width: 200px;
    }
    #thumbnail>img{
        width: 95%;
        height: 95%;
        margin-left: 5px;
        margin-top: 5px;
        border-radius : 10%;
    }

    #course{
        float: left; 
        margin-bottom: 50px;
        text-align: left;
        width: 600px;
        height: 200px;
        cursor: pointer;
        box-shadow: 1px 1px 8px 1px gray;
        border-radius : 10px;
        transition: all 0.2s linear;
    }
    #course:hover{
        transform: scale(1.05);
    }
    #course th{
        font-size: 20px;
        height: 20px;
    }
    #course td:last-child{
        font-size: 17px;
        height: 15px;
    }



    #tripLocal{
        font-size: 30px;
        margin-top: 5px;
        margin-bottom: 0;
    }
    #tripName{
        font-size: 20px;
        margin-top: 10px;
    }
</style>
</head>
<body>
        
        <script>
            var test = "${alertMsg}";
            if(test != "") {
            alert("${alertMsg}");
            <% session.removeAttribute("alertMsg"); %>  
            
            }
        
        </script>
        
    <div id="outer">
        <div id="wrap">
            <jsp:include page="common/header.jsp"/>
            <div id="main">



                
                <div id="main1_1">

                    <div id="search">
                        <h2 id="search_h2">여행 코스 공유 사이트</h2>
                        <p id="search_P">Tripick</p>
                        
                        <form action="search.co" method="get">
                            <div>
                                <input id="search_I" type="text" placeholder="✈︎ 떠나고 싶은 지역을 입력하세요 ✈︎" name="keyword"> <br>
                                <button id="search_btn">검색하기</button>
                            </div>
                        </form>
                    </div>
                    <div id="targetD">
                        <a href="#target">
                            <img id="down-arrow" src="./resources/common-upfiles/downarrow.png" >
                        </a>
                    </div>
                    
                </div>

                
                <div id="main_weather">
                    
                    <div id="weatherTitle">
                        <p>today's weather</p>
                    </div>
                    <!--날씨api넣는곳-->
                    <div id="weather_area">
                        <div id="region"></div> 
                        <div id="currentT"></div>
                        <div id="weather"></div>
                    </div>
                </div>
                
                <div id="main1_2">
                    <!--배경이미지-->
                </div>
            </div>

            
            <script>
                $(function(){

                    var city = ["Seoul", "Sejong", "Incheon", "Daejeon", "Gwangju", "Daegu", "Ulsan", "Busan"];
                    var index = 0;

                    function weather() {
                        
                        var api = "https://api.openweathermap.org/data/2.5/weather?q="+city[index++]+"&appid=6eeeca0f172d44be534f5fbeb8d3d809";

                        $.ajax({
                            url: api,
                            dataType: "json",
                            type: "GET",
                            async: "false",
                            success: function(resp) {

                                //console.log(resp);
                                $("#region").html(resp.name);
                                $("#currentT").html(Math.floor(resp.main.temp-273.15)+"℃");
                                $("#weather").html(resp.weather[0].main);

                            }
                        });

                        if (index == city.length){
                            index = 0;
                        }
                    } 
                    weather();       
                    setInterval(weather, 3000);

                });
                
            </script>

            <a name="target"></a>
            <br><br><br><br><br>

            <div id="main2">
                <p style="font-size: 40px; text-align: center;">추천 여행지</p>

                <div id="R_trip">
                    <div id="W_trip">
                    </div>
                </div>
                
            </div>
            <script>
                $(function(){
                    randomTrip();
                })
                function randomTrip(){
                    $.ajax({
                        url:'random.tb',
                        success : function(data){
                            //console.log(data);

                            let value='';
                            for(let i in data){
                                value += '<div id="trip"><a data-toggle="modal" href="#myModal">'
                                       + '<img src="./'+ data[i].changeName +'">'
                                       + '<p id="tripLocal" name="tripLocal">'
                                       + data[i].localName
                                       + '</p>'
                                       + '<p id="tripName">'
                                       + data[i].trboardTitle
                                       + '</p></div></a>';
                                l1 = data[0];
                                l2 = data[1];
                                l3 = data[2];
                            }
                            $('#W_trip').html(value);
                            
                            $(function(){
                                $("#W_trip > div:nth-child(1)").click(function(){
                                    $("#modalImg > img").attr("src", l1.changeName);
                                    $("#modelArea > p").text(l1.localName);
                                    $("#modelTripName > p").text(l1.trboardTitle);
                                    $("#modelTripContent > p").text(l1.trboardContent);
                                })
                                $("#W_trip > div:nth-child(2)").click(function(){
                                    $("#modalImg > img").attr("src", l2.changeName);
                                    $("#modelArea > p").text(l2.localName);
                                    $("#modelTripName > p").text(l2.trboardTitle);
                                    $("#modelTripContent > p").text(l2.trboardContent);
                                })
                                $("#W_trip > div:nth-child(3)").click(function(){
                                    $("#modalImg > img").attr("src", l3.changeName);
                                    $("#modelArea > p").text(l3.localName);
                                    $("#modelTripName > p").text(l3.trboardTitle);
                                    $("#modelTripContent > p").text(l3.trboardContent);
                                })
                            })

                        }
                    });
                }
            </script>

            <br><br><br><br>
            
            <div id="main3">
                <p style="font-size: 40px; text-align: center;">조회수 TOP4 여행코스</p>
                <br>
                <div id="views">
                    <div id="C_trip">
                       
                        
                    </div>
                    
                </div>
            </div>

            <script>
                $(function(){
                    countPlanner();
                })
                function countPlanner(){
                    $.ajax({
                        url:'count.pn',
                        success : function(data2){
                            console.log(data2);

                            let value2='';
                            for(let i in data2){
                                value2 += "<div id='trip_course'>"
                                        + "<table id='course'>"
                                        + "<tr><td rowspan='5' id='thumbnail'>"
                                        + "<input type='hidden' name='plannerNo' value='" + data2[i].plannerNo + "'>";
                               
                                if((data2[i].changeName) == null){
                                    if(data2[i].type == '나홀로여행'){
                                        value2 += "<img id='plannerImg' src='./resources/common-upfiles/type1.jfif'>" + "</td>";
                                    }
                                    else if(data2[i].type == '가족여행'){
                                        value2 += "<img id='plannerImg' src='./resources/common-upfiles/type2.jfif'>" + "</td>";
                                    }
                                    else if(data2[i].type == '친구/지인'){
                                        value2 += "<img id='plannerImg' src='./resources/common-upfiles/type3.jfif'>" + "</td>";
                                    }
                                    else if(data2[i].type == '연인/커플'){
                                        value2 += "<img id='plannerImg' src='./resources/common-upfiles/type4.jfif'>" + "</td>";                  
                                    }
                                    else if(data2[i].type == '부모님'){
                                        value2 += "<img id='plannerImg' src='./resources/common-upfiles/type5.jfif'>" + "</td>";
                                    }
                                }else{
                                    value2 += "<img id='plannerImg' src='"+ data2[i].changeName +"'>" + "</td>";
                                }

                                value2 += "<th>&nbsp;&nbsp;" + data2[i].plannerTitle + "</th></tr>"
                                        + "<tr><td>&nbsp;&nbsp;작성자 | " + data2[i].plannerWriter + "</td></tr>"
                                        + "<tr><td>&nbsp;&nbsp;" + (data2[i].wDate - 1) + "박" + data2[i].wDate + "일</td></tr>"
                                        + "<tr><td>&nbsp;&nbsp;" + "조회수 : " + data2[i].count + "</td></tr>"
                                        + "<tr><th>&nbsp;&nbsp;#" + data2[i].area + " #" + data2[i].type + "</th></tr>"
                                        + "</table></div>";
                                
                                $('#C_trip').html(value2);        

                                
                                        
                            }

                            $('#C_trip').html(value2);
                           
                            // 상세페이지로 이동
                            $(function(){
                                $("table[id=course]").click(function(){
                                    let plannerNo = $(this).find('input[name=plannerNo]').val();
                                    console.log(plannerNo);
                                    location.href="detail.co?pno=" + plannerNo;
                                })
                            })
                        }
                    });
                }

            </script>

            <style>
                #myModal.modal.hide.show{
                    padding: 0;
                }
                .modal-body{
                    width: 1600px;
                    height: 550px;
                    background-color: white;
                    margin: auto;
                    margin-top: 250px;
                    padding: 0;
                }
                .modal-body > div{
                    float: left;
                }
                #modalClose{
                    margin-right: 10px;
                    outline: 0;
                    font-size: 30px;
                }
                #modalImg{
                    width: 450px;
                    height: 100%;
                    overflow: hidden;
                    text-align: center;
                }
                #modalImg > img{
                    width: 100%;
                    height: 100%;
                    object-fit:cover;
                }
                #modalText{
                    width: 1100px;
                    height: 100%;
                }
                #modelArea{
                    width:300px;
                    font-size: 40px;
                    margin-left: 40px;
                    margin-top: 60px;
                }
                #modelTripName{
                    width:800px;
                    font-size: 30px;
                    margin-left: 40px;
                }

                #modelTripContent{
                    width: 1000px;
                    font-size: 20px;
                    margin-left: 40px;
                    margin-top: 50px;
                    height: 150px;
                    color: gray;
                }

                #modelTripLink{
                    float: right;
                    margin-top: 80px;
                    padding: 10px;
                    background-color: #7AC5CD;
                }

                #modelTripLink > a{
                    color: white;
                }
            </style>

            <!--모달창-->

            <div class="modal hide" id="myModal">
                
                <div class="modal-body">
                    <button id="modalClose" class="close" data-dismiss="modal">x</button>
                    <div id="modalImg">
                        <!--사진-->
                        <img src="./resources/common-upfiles/mainImg.jpeg" alt="">
                    </div>
                    <div id="modalText">
                        <div id="modelArea">
                            <p></p>
                        </div>
                        <div id="modelTripName">
                            <p></p>
                        </div>
                        <div id="modelTripContent">
                            <p></p>
                        </div>
                        <div id="modelTripLink">
                            <a href="">자세히 보기</a>
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

