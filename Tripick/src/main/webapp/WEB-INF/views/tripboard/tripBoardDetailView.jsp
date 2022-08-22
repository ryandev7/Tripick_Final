<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tripick:여행지 상세보기</title>
<style>
	.AR-content{
	    width: auto;
	    height:1000px;
	}    
	#trip-intro{
		height:350px;
		text-align:center;
		color: black;
	}
	#trip-intro-child{
		display: inline-block;
	}
	#trip-thumbnail{
		width:400px;
		height:350px;
		background-color:red;
		float:left;
	}
	#trip-thumbnail>img{
		width:400px;
		height:350px;	
	}
	#trip-content-1{
		width:700px;
		height:350px;
		text-align:left;
		float:left;
		padding:5%
	}
	#trip-content-2{
		text-align:center;
		width:100%;
		height:auto;
	}
	#trip-content-2-child{
		background-color:lightgray;
		text-align:left;
		padding:3%;
		width:1100px;
		height:auto;
		display: inline-block;
	}
	#img-container{
		width:100%;
		height:200px;
		text-align:center;		
	}
	#img-container-child{
		width:1100px;
		height:200px;
		display: inline-block;
	}
	.AR-trip-img{
		width:250px;
		height:200px;
		background-color:red;
		float:left;
		margin-left:8%;
	}
	.AR-trip-img>img{
		width:250px;
		height:200px;	
	}
	#button-area{
		width:100%;
		height:50px;
		text-align:center;
	}
	#button-area-child{
		display: inline-block;
		width:500px;
		height:50px;	
	}
	
</style>
</head>
<body>
   <jsp:include page="../common/header.jsp"/>
    <br><br><br><br><br><br>

    <div class="AR-content">
	    <div id="trip-intro">
	    	<div id="trip-intro-child">
				<div id="trip-thumbnail">
					<c:forEach var="titleImg" items="${tripAttachment }" >
						<c:if test="${titleImg.fileLevel eq 1 }">
							<img src="${titleImg.changeName}">				
						</c:if>
					</c:forEach>
				</div>
		
				<div id="trip-content-1">
					<h1><b>${tripBoard.localName }</b></h1><br>
					<h3>${tripBoard.trboardTitle }</h3>
				</div>
		
	    	</div>
		</div>
		<br><br>
		<div id="trip-content-2">
			<div id="trip-content-2-child">
				&nbsp;&nbsp; ${tripBoard.trboardContent }
			</div>
		</div>
		<br>
		<div id="img-container">
			<div id="img-container-child">
				<c:forEach var="img" items="${tripAttachment }" >
					<c:if test="${!(img.fileLevel eq 1)}">
						<div class="AR-trip-img">				
							<img src="${img.changeName}">				
						</div>
					</c:if>
				</c:forEach>			
			</div>
		</div>
		<br><br><br><br>
		<div id="button-area">
			<div id="button-area-child">
				<button class="btn btn-info" onclick="history.back()">목록으로</button>
				<button class="btn btn-success">수정</button>
				<button class="btn btn-danger">삭제</button>
			</div>
		</div>
		
		
    </div>

    <br><br>
    
    <jsp:include page="../common/footer.jsp"/>




</body>
</html>