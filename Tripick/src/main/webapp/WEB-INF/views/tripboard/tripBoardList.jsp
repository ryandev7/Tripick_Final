<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 리스트 페이지</title>
<style>
    
    #tripBoardText{
        /*position: absolute;
        top: 80%;*/
        font-size: 50px;  
        text-align: center;
        margin-top: 100px;
    }
    #tripBoardText > p{
        padding-left: 10px;
        padding-right: 10px;
    }
    #content{
        width: 100%;
        height: 1800px;
    }
    #localList{
        width: 1200px;
        height: 110px;
        margin: auto;
        margin-top: 100px;
    }
    #filter-bar > li{
        float: left;
        font-size: 20px;
        margin-top: 20px;
        padding-top: 10px;
        padding-bottom: 10px;
        padding-left: 20px;
        padding-right: 20px;
        cursor: pointer;
    }
    
    .filter-option.active{
        background-color: #7AC5CD;
        color: white;
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
        margin-right: 50px;
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

    /*페이징*/
    
    #pagingArea{
        width: 500px;
        height: 50px;
        margin: auto;
        text-align: center;
    }
    #pagingArea>ul{
        padding: 0;
        display: inline-block;
    }
    #pagingArea>ul>li{
        float: left;
        margin-left: 3px;
        cursor: pointer;
    }
    #pagingArea>ul>li>a{
        font-size: 20px;
        color: #7AC5CD;
    }
</style>
</head>
<body>
    <div id="outer">
        <div id="wrap">

            <jsp:include page="../common/header.jsp"/>
            <br><br><br><br>
            <div style="position: relative;">
                <div id="tripBoardText">
                    <p>여행지</p>
                </div>
            </div>

            <div id="content">

                <div id="localList">
                    <!-- 지역 필터 -->
                    <ul id="filter-bar">
                        <li class="filter-option active" data-local="all">전체</li>
                        <c:forEach var="local" items="${localList }">
                            <li class="filter-option" data-local="${local.localName }">${local.localName }</li>
                        </c:forEach>
                    </ul>
                </div>

                <script>
                    // 지역 필터 클릭 시
                    $('.filter-option').on("click", function(){
                        let localName = $(this).attr("data-local");
                        if(localName == 'all'){
                            location.href="list.tb";					
                        }else{
                            location.href="filter.tb?localName=" + localName;
                        }  		
                        
                    });

                     // 클릭한 지역 필터에 클래스 추가
                    $(function(){
                        if(${not empty localName}){
                            $('.filter-option.active').removeClass('active');
                            $('.filter-option').each(function (i){
                                if($(this).attr("data-local") == '${localName}'){
                                    $(this).addClass("active");
                                }
                            });
                        }
                    });

                </script>

                <c:if test="${loginUser.authority eq 'A'}">
                    <div id="tripBtnArea">
                        <a href="">여행지 등록</a>
                    </div>  
                </c:if>

                <div id="tripListArea">

                    <div id="tripList">

                        <!-- 반복문으로 리스트 가져와서 뿌리기 -->
                        <c:forEach var="t" items="${list}">
                            <div id="trip">
                                <img src="${t.changeName}">
                                <p id="tripLocal">${t.localName}</p>
                                <p id="tripTitle">${t.trboardTitle}</p>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                
                
            </div>

            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${pi.currentPage eq 1}">
                            <li class="page-item"><a class="page-link">&lt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a href="list.tb?cpage=${pi.currentPage - 1}" class="page-link">&lt;</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        <li class="page-item"><a href="list.tb?cpage=${p}" class="page-link">${p}</a></li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${pi.currentPage eq pi.maxPage}">
                            <li class="page-item"><a class="page-link">&gt;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a href="list.tb?cpage=${pi.currentPage + 1}" class="page-link">&gt;</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>







            <br><br><br><br><br>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>