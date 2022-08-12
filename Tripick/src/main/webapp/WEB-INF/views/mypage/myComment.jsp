<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 댓글 보기</title>
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
	
	<!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        div {box-sizing:border-box;}
        #header {
            width:80%;
            height:100px;
            padding-top:20px;
            margin:auto;
        }
        #header>div {width:100%; margin-bottom:10px;}
        #header_1 {height:80%;}
        #header_2 {height:60%;}

        #header_1>div{
            height:100%;
            float:left;
        }
        #header_1_left {width:30%; position:relative;}
        #header_1_center {width:40%;}
        #header_1_right {width:30%;}

        #header_1_left>img {height:100%; position:absolute; margin:auto; top:0px; bottom:0px; right:0px; left:0px;}
        #header_1_right {text-align:center; line-height:35px; font-size:12px; text-indent:35px;}
        #header_1_right>a {margin:5px;}
        #header_1_right>a:hover {cursor:pointer;}

        #header_2>ul {width:100%; height:100%; list-style-type:none; margin:auto; padding:0;}
        #header_2>ul>li {float:left; width:25%; height:100%; line-height:55px; text-align:center;}
        #header_2>ul>li a {text-decoration:none; color:black; font-size:18px; font-weight:900;}

        #header_2 {border-top:1px solid lightgray;}

        #header a {text-decoration:none; color:black;}

        /* 세부페이지마다 공통적으로 유지할 style */
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

    </style>
</head>
<body>
	<h3>내 댓글보기</h3>
	
	<div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>댓글 내역</h2>
            <br>
            
            <br>
            <%--<label>${inquiry }</label> --%>
            <table id="boardList" class="table table-hover">
                <thead>
                    <tr>
                        <th>댓글번호</th>
                        <th>대상게시판</th>
                        <th>내용</th>
                        <th>문의 일시</th>
                    </tr>
                </thead>
                <tbody>
                
                    <c:forEach var="cms" items="${ comments }" >
                    	<tr class="inquiryOne">
                    		<td>${ cms.replyNo }</td>
                    		<td>${ cms.replyLevel }</td>
                    		<td>${ cms.replyContent }</td>
                    		<td>${ cms.create_date }</td>
                    	</tr> 
                    </c:forEach>
                </tbody>
            </table>
            <br>
            
​			<script type="text/javascript">
				/* $('.inquiryOne').click(function(){
					var bNo = $(this).children().html();
					
					location.href="detailView.bo?boardNo=" + bNo;
				}) */
			</script>
			
            <div id="pagingArea" >
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">	
                			<li class="page-item disabled"><a class="page-link" href="#">&lt;&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="comment.my?page=${ pi.currentPage -1 }">&lt;&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    	<li class="page-item"><a class="page-link" href="comment.my?page=${ p }">${ p }</a></li>
                    </c:forEach>
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage eq pi.maxPage }">	
                			<li class="page-item disabled"><a class="page-link" href="#">&gt;&gt;</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="comment.my?page=${ pi.currentPage +1 }"> &gt;&gt;</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                </ul>
            </div>
		</div>
    </div>
</body>
</html>