<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 		.div{
            /*border: 1px solid red;*/
            box-sizing: border-box;
        }
        .wrap{
            width : 1900px;
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
            width : 15%;
        }
        #content2{
            width : 85%;
        }
        #content2_1{
        border: 1px solid black;
            height : 15%;
        }
        #content2_2{
            height : 70%;
        }


        #filter-bar li :hover {
            color: rgb(142, 229, 238);
        }
        /*게시판 리스트*/
	     #mate_list{
	        margin-top: 40px;
	    }
	    
	    #mate_table{
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
			<div id ="content1">
				<nav class="review-container__navi" style="height: 1000px">
					<jsp:include page="../community/communityNaviBar.jsp" />
				</nav>
			</div>
			<div id="content2">
				<div>
					   <div class="mateBoard-top">
                            <%-- 선택창 --%>
                            <%-- 게시판 드릴다운 --%>
                            <span class="common-top__drilldownbox"> 커뮤니티
                                <span> > </span> <a href="list.mb">동행게시판</a>
                            </span>
                            <%-- 글쓰기 버튼 --%>
		                      <div align="left"><a class="btn btn-light btn-sm"href="enrollForm.mb">글쓰기</a></div>
                        </div>
				</div>
				<div id="mate_list">
					<table id="mate_table">
						<thead>
							<tr>
								<th></th>
								<th>모집상태</th>
								<th>지역</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<input type="hidden" class="mno" name="mateNo" value="${list.mateNo}">
									<td></td>
									<td>
										<c:choose>
											<c:when test="${ list.recruitStatus eq 'Y' }">모집중</c:when>
											<c:otherwise>모집완료</c:otherwise>
										</c:choose>
									</td>
									<td>${list.localName}</td>
									<td>${list.mateTitle}</td>
									<td>${list.mateWriter}</td>
									<td>${list.createDate}</td>
									<td>${list.count}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<br>
				<script>
			    	$(function(){
			    		$('#mate_table>tbody>tr').click(function(){
			            	location.href='detail.mb?mno=' + $(this).children('.mno').val();
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
				</div>
				<div id="reviewL-bottom_search">
                        <form id="searchForm" action="search.mb" method="get" align="center">
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
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>