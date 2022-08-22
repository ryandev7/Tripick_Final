<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 리스트 페이지</title>
<style>
    #tripBoardImg{
        width: 100%;
        height: 500px;
    }
    #tripBoardImg > img{
        width: 100%;
        height: 100%;
    }
    #tripBoardText{
        position: absolute;
        top: 80%;
        left: 10%;
        color: white;
        font-size: 50px;
    }
    #content{
        width: 100%;
        height: 1800px;
    }
    #localList{
        width: 1000px;
        height: 110px;
        margin: auto;
        margin-top: 100px;
        border: 1px solid black;
    }
    #tripBtnArea{
        width: 1500px;
        height: 60px;
        margin: auto;
        margin-top: 60px;
        text-align: right;
    }
    #tripBtnArea > a{
        background-color: #7AC5CD;
        padding: 10px;
        color: white;
        font-size: 18px;
        margin-right: 10px;
    }
    #tripListArea{
        width: 1500px;
        margin: auto;
        margin-top: 30px;
        height: 1500px;
    }
    #tripList{
        width: 100%;
        height: 450px;
    }
    #trip{
        float: left;
        width: 300px;
        height: 450px;
        box-shadow: 1px 1px 8px 1px gray;
        text-align: center;
        font-size: 20px;
        cursor: pointer;
        margin-left: 40px;
        margin-right: 30px;
        margin-top: 10px;
        margin-bottom: 50px;
    }
    #trip > img{
        width: 100%;
        height: 350px;
    }
    #tripLocal{
        margin-top: 15px;
        font-size: 25px;
        margin-bottom: 0;
    }
    #tripTitle{
        font-size: 15px;
        margin-top: 10px;
    }
</style>
</head>
<body>
    <div id="outer">
        <div id="wrap">

            <jsp:include page="../common/header.jsp"/>
            <br><br><br><br>
            <div style="position: relative;">
                <div id="tripBoardImg">
                    <img src="resources/common-upfiles/mainImg.jpeg" alt="">
                </div>
                <div id="tripBoardText">
                    <p>명동</p>
                </div>
            </div>

            <div id="content">
                <div id="localList">
                    지역 리스트 가져오는 곳
                </div>

                <div id="tripBtnArea">
                    <a href="">여행지 등록</a>
                </div>  

                <div id="tripListArea">

                    <div id="tripList">

                        <!-- 반복문으로 리스트 가져와서 뿌리기 -->
                        
                        <div id="trip">
                            <img src="resources/common-upfiles/mainImg.jpeg" alt="">
                            <p id="tripLocal">여행지지역</p>
                            <p id="tripTitle">여행지이름</p>
                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        <div id="trip">

                        </div>
                        
                    </div>

                </div>

                <div>
                    <!--페이징 부분-->
                </div>

            </div>









            <br><br><br><br><br>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>