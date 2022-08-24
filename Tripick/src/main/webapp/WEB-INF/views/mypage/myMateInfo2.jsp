<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 동행 신청</title>
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
		 <div id="mateTable" >
				<!--받은 동행 신청 부분-->
				<h3 align="center">받은 동행 신청</h3>
				<p align="center">모집이 마감된 동행은 표시되지 않습니다.</p>
				<br>
				<table id="mateInfoG" class="table table-hover" align="center">
					<thead>
						<tr>
							<th>동행번호</th>
							<th width="40%">동행제목</th>
							<th width="13%">신청자아이디</th>
							<th width="13%">신청자닉네임</th>
							<th>수락여부</th>
							<th>채팅</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list2" items="${list2 }">
							<c:choose>
								<c:when test="${list2 ne null }">
									<tr>
										<td>${list2.refMateNo}</td>
										<td width="40%" id="mateTitle">${list2.mateTitle}</td>
										<td width="10%">${list2.mateMember2 }</td>
										<td width="10%">${list2.mateMember }</td>
										<td>
											<c:choose>
												<c:when test="${list2.bstatus eq 'N'}">
													<a class="btn btn-secondary" id="accept">수락하기</a>
												</c:when>
												<c:otherwise>수락완료</c:otherwise>
											</c:choose>
										</td>
										<td><a class="btn btn-primary">채팅방초대</a></td>
									</tr>
								</c:when>
								<c:otherwise>
									<div>받은 동행 신청이 없습니다.<button>동행 모집하러가기</button></div>
								</c:otherwise>
							</c:choose>
						</c:forEach> 
					</tbody>
				</table>
                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi2.currentPage eq 1}">
                                <li class="page-item"><a class="page-link">&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="applyList2.mb?cpage=${pi2.currentPage - 1}" class="page-link">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi2.startPage}" end="${pi2.endPage}">
                            <li class="page-item"><a href="applyList2.mb?cpage=${p}" class="page-link">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi2.currentPage eq pi.maxPage}">
                                <li class="page-item"><a class="page-link">&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="applyList2.mb?cpage=${pi2.currentPage + 1}" class="page-link">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>				
			</div>
			<br><br>				
			</div>	  
	</div>
	<jsp:include page="../common/footer.jsp"/>
		<script>
		$(function(){
			$('#mateInfoG>tbody>tr>td>#accept').click(function(){
				var refNo = $(this).closest("tr").children().eq(0).text();
				console.log(refNo);
				var userId = $(this).closest("tr").children().eq(2).text();
				console.log(userId);
				location.href='accept.mb?userId=' + userId + '&refNo=' + refNo ;
			})
		})
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