<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 동행(리스트)</title>
<style>
        /*페이징*/
    tr>#mateTitle{
        cursor: pointer;
    }    
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
    #wrap{
            width:70%;
            margin:auto;
    }    
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
	<br><br><br><br><br><br><br>
    <div id="wrap">
		<div id="applicationList" align="center">
			<h3>동행 신청 내역</h3>
			<a id="sendMate" href="applyList.mb" class="btn btn-success">보낸 동행신청 내역</a>
			<a id="gaveMate" href="applyList2.mb" class="btn btn-info">받은 동행신청 내역</a>
			<a id="myMate" href="myApplyList.mb" class="btn btn-primary">나의 동행 리스트</a>
			<hr>
		</div>    
        <br>
        <div align="center">
        <h3>나의 동행 리스트</h3>
		<p align="center">내가 모집한 동행과 내가 신청한 동행을 보여줍니다.</p>        
        <br>
	        <table class="table table-hover" align="center">
	            <tr>
	            	<th>동행번호</th>
	                <th width="45%">동행글 제목</th>
	                <th>인원</th>
	                <th width="19%">동행날짜</th>
	                <th>모집여부</th>
	                <th>채팅</th>
	            </tr>
	            <!--리스트 받아와서 뿌려주기-->
	            <c:choose>
	            	<c:when test="${list ne null }">
			            <c:forEach var="list" items="${list}">
				            <tr>
				            	<td>${list.mateNo }</td>
				                <td id="mateTitle">${list.mateTitle}</td>
				                <td>${list.memberCurCount} / ${list.memberCount}</td>
				                <td>${list.firstDate}~${list.lastDate}</td>
				                <td>
				                	<c:choose>
				                		<c:when test="${list.recruitStatus eq 'Y'}">현재모집중</c:when>
				                		<c:otherwise>모집완료</c:otherwise>
				                	</c:choose>
				                </td>
				                <td><a class="btn btn-primary btn-sm">채팅방입장</a></td>
				            </tr>
			            </c:forEach>
	            	</c:when>
	            	<c:otherwise>동행신청 내역이 없습니다.</c:otherwise>
	            </c:choose>
	        </table>
        </div>
        <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item"><a class="page-link">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="myApplyList.mb?cpage=${pi.currentPage - 1}" class="page-link">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item"><a href="myApplyList.mb?cpage=${p}" class="page-link">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item"><a class="page-link">&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="myApplyList.mb?cpage=${pi.currentPage + 1}" class="page-link">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>				
			</div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
    	<script>

			$(function(){
			$('tbody>tr>#mateTitle').click(function(){
				var refNo = $(this).closest("tr").children().eq(0).text();
				console.log(refNo);
				location.href='detail.mb?mno=' + refNo ;
			})
		})
	</script>

</body>
</html>