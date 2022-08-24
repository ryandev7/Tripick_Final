<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<meta charset="UTF-8">
<title>지역게시판</title>
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
        .div{
            /*border: 1px solid red;*/
            box-sizing: border-box;
        }
        .wrap{
            /*지안수정*/
            /*width : 1900px;*/
            height :1400px;
            margin: auto;
            
        }
        /* 크게 세가지 영역*/
        .wrap > div{
            width: 100%;
        }
        #header, footer{
            height: 10%;
        }
        #content{
            /*지안수정*/
            width: 100%;
            height: 80%;
        }


        /*더 세부영역*/
        /*지안수정 #header > div 삭제*/
        #content > div{
            height: 100%;
            float: left;
        }
        /* 각 세부영역의 가로 비율 정해주기*/

        #content1{
            /*지안수정*/
            /*width : 15%;*/
            width: 250px;
        }
        #content2{
            width: 70%;
        }
        #content2_1{
            /*지안수정*/
            /*height : 15%;*/
        }
        #content2_2{
        	width : 100%;
            height : 75%;
        }

        #wrapper-filter {
            width: 1000px;
            /*지안수정*/
            height: 110px;
            text-align: center;
            margin: auto;
            border: 1px solid black;
            margin-top: 40px;
        
        }
        
        #filter-bar li {
            width: 100px;
            text-align: center;
            list-style-type: none;
            cursor: pointer;
            font-size: 20px;
            line-height: 50px;
            float: left;
            font-weight: bold;

        }

        #filter-bar li :hover {
            color: rgb(142, 229, 238);
        }
        /*게시판 리스트*/
         #board_list{
            margin-top: 40px;
        }
        
        #board_table{
            /*지안수정*/
            margin-top: 20px;
            text-align: left;
            width: 1000px;
            border-top: 1px solid black;
            border-bottom: 1px solid black;
        }
        tr{
            height: 50px;
        }
        tbody>tr{
            border-top: 1px solid lightgray;
            cursor: pointer;
        }
        tbody>tr>td:nth-child(2){
            text-align: left;
        }
        /*페이징바*/
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


        /*지안수정*/
        .localBoard-container--top{
            height: 30px;
        }
        #reviewL-bottom_search{
            margin-top: 20px;
        }
        #reviewL-bottom_search > div > form > div{
            float: left;
            margin-right: 15px;
        }
        #reviewL-bottom_search > div{
            width: 1300px;
            margin: auto;
        }
</style>
</head>

<body>
    <div class="wrap">

        <jsp:include page="../common/header.jsp" />

        <br><br><br><br><br>
        <div id="content">
            <div id="content1">
                <%-- 네비게이션 --%>
                <nav class="review-container__navi" style="height: 1000px">
                    <jsp:include page="../community/communityNaviBar.jsp" />
                </nav>
            </div>
            <div id="content2">
            <div></div>
                <div id="content2_1">
                	<br>
					<img id="mateimg" src="resources/common-upfiles/local.gif" width="100%" height="240">                            
                    <div id="wrapper-filter">
                        <ul id="filter-bar">
                            <li><a href="list.lb?cpage=1&lcode=0">전체</a></li>
                            <c:forEach var="lc" items="${ lclist }">
                            <li><a href="list.lb?cpage=1&lcode=${lc.localCode}">${lc.localName }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
                <div id="content2_2">
                        <div class="localBoard-container--top">
                            <!--지안수정-->
                            <div style="width: 1000px; margin:auto; height:40px; margin-top: 60px;">
                                <%-- 선택창 --%>
                                <%-- 게시판 드릴다운 --%>
                                <span class="common-top__drilldownbox"> 커뮤니티
                                    <span> > </span> <a href="list.lb">지역별게시판</a>
                                </span>
                                <%-- 글쓰기 버튼 --%>
                                <!--지안수정-->
                                <!--<div align="left"><a class="btn btn-light btn-sm"href="enrollForm.lb">글쓰기</a></div>-->
                                <div style="float: right;">
                                	<c:if test="${loginUser ne null }">
	                                    <a class="btn btn-info btn-sm"href="enrollForm.lb">글쓰기</a>
                                	</c:if>
                                </div>
                            </div>
                        </div>
                    <table id="board_table" align="center">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>지역</th>
                                <th width="50%">제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${ list }">
                                <tr>
                                    <td class="bno">${ b.localBoardNo }</td>
                                    <td>${ b.localName }</td>
                                    <td>${ b.lbTitle }</td>
                                    <td>${ b.lbWriter }</td>
                                    <td>${ b.createDate }</td>
                                    <td>${ b.count }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <br>
                <script>
                    $(function(){
                        $('#board_table>tbody>tr').click(function(){
                            location.href='detail.lb?bno=' + $(this).children(".bno").text();
                        })
                    })
                </script>
                    <div id="pagingArea">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link"
                                        href="#">Previous</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                        href="list.lb?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                                </c:otherwise>
                            </c:choose>
    
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item"><a class="page-link"
                                    href="list.lb?cpage=${ p }">${ p }</a></li>
                            </c:forEach>
    
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link"
                                        href="#">Next</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                        href="list.lb?cpage=${ pi.currentPage + 1 }">Next</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <!--지안수정-->
                    <div id="reviewL-bottom_search">
                        <div style=" width: 500px; height: 50px;">
                            <form id="searchForm" action="search.lb" method="get" align="center">
                                <div class="select">
                                    <select class="custom-select" name="condition">
                                        <option value="writer">작성자</option>
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                    </select>
                                </div>
                                <div>
                                    <input type="text" style="width: 300px;" class="form-control" name="keyword">  
                                </div>
                                <div>
                                    <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <jsp:include page="../common/footer.jsp" />
    </div>
</body>

</html>
