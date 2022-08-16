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
            width : 1300px;
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
            height: 80%;
        }

        /*더 세부영역*/
        #header > div, #content > div{
            height: 100%;
            float: left;
        }
        /* 각 세부영역의 가로 비율 정해주기*/

        #content1{
            width : 25%;
        }
        #content2{
            width : 75%;
        }
        #content2_1{
        border: 1px solid black;
            height : 15%;
        }
        #content2_2{
            height : 70%;
        }

        #wrapper-filter {
        width: 600px;
        text-align: center;
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
	        text-align: center;
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
	        margin-left: 5px;
	        cursor: pointer;
	    }
	    #pagingArea>ul>li>a{
	        font-size: 20px;
	    }

</style>
</head>

<body>
	<div class="wrap">
        <div id="header">
            	<jsp:include page="../common/header.jsp" />
        </div>
        <br><br><br><br><br>
        <div id="content">
            <div id="content1">
                <%-- 네비게이션 --%>
				<nav class="review-container__navi" style="height: 900px">
					<jsp:include page="../community/communityNaviBar.jsp" />
				</nav>
            </div>
            <div id="content2">
                <div id="content2_1">
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

                            <%-- 선택창 --%>
                            <%-- 게시판 드릴다운 --%>
                            <span class="common-top__drilldownbox"> 커뮤니티
                                <span> > </span> <a href="list.lb">지역별게시판</a>
                            </span>
                            <%-- 글쓰기 버튼 --%>
		                      <div align="right"><a class="btn btn-light btn-sm"href="enrollForm.lb">글쓰기</a></div>
                        </div>
                    <table id="board_table" align="center">
                        <thead>
                            <tr>
                                <th>글번호</th>
                                <th>지역</th>
                                <th>제목</th>
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
                    <div id="reviewL-bottom_search">
                        <form id="searchForm" action="" method="get" align="center">
                            <div class="select">
                                <select class="custom-select" name="condition">
                                    <option value="writer">작성자</option>
                                    <option value="title">제목</option>
                                    <option value="content">내용</option>
                                </select>
                            </div>
                            <div class="text">
                                <input type="text" class="form-control" name="keyword">
                            </div>
                            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
            <jsp:include page="../common/footer.jsp" />
        </div>
    </div>
</body>

</html>