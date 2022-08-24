<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행신청내역</title>
<style>
    tbody>tr>#mateTitle{
        cursor: pointer;
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
    .wrap{
    
            width:70%;
            margin:auto;
    }    
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="wrap">
	  <br><br><br><br><br><br><br>
		
		<div id="applicationList" align="center">
			<h3>동행 신청 내역</h3>
			<a id="sendMate" href="applyList.mb" class="btn btn-success">보낸 동행신청 내역</a>
			<a id="gaveMate" href="applyList2.mb" class="btn btn-info">받은 동행신청 내역</a>
			<a id="myMate" href="myApplyList.mb" class="btn btn-primary">나의 동행 리스트</a>
			<br><hr>
		</div>
			<div align="center">
				<h3>보낸 동행 신청</h3>
				<br>
	
				<table id="mateInfoS" class="table table-hover" align="center">
					<thead>
						<tr>
							<th>동행번호</th>
							<th width="40%">동행제목</th>
							<th>수락여부</th>
							<th>동행모집자</th>
						</tr>
					</thead>
					<tbody>
					<!--보낸 동행 신청-->
					<c:forEach var="list" items="${list}">
						<c:choose>
						<c:when test="${list ne null}">
							<tr>
								<td>${list.refMateNo}</td>
								<td id="mateTitle">${list.mateTitle}</td>
								<td>
									<c:choose>
										<c:when test="${ list.status eq 'N'}">대기중</c:when>
										<c:otherwise>완료</c:otherwise>
									</c:choose>
								</td>
								<td>${list.mateMember}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<div>동행 신청 내역이 없습니다.<br><a href="">동행신청 하러가기</a></div>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					
					</tbody>
				</table>
                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item"><a class="page-link">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="applyList.mb?cpage=${pi.currentPage - 1}" class="page-link">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item"><a href="applyList.mb?cpage=${p}" class="page-link">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item"><a class="page-link">&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="applyList.mb?cpage=${pi.currentPage + 1}" class="page-link">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>				
			</div>
			<br><br>
			
			

		</div>
		<jsp:include page="../common/footer.jsp"/>
	
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