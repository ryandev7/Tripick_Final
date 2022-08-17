<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
        
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>지역별 게시글 작성</h2>
            <br>

            <form id="enrollForm" method="post" action="insert.lb" enctype="multipart/form-data">
                <table algin="center">
                    <tr>
                    	<input type="hidden" name="lbWriter" value="${ loginUser.userId }"/>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="lbTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="localCode">지역</label></th>
                        <td>
                        <!-- 가능하면 반복문으로 나중에 구현하기 일단 하나하나 넣어놓음 (완료) -->
                        	<select name="localCode">
                        		<c:forEach var="list" items="${lclist}">
                        			<option value="${list.localCode}">${list.localName}</option>
                        		</c:forEach>
                        	</select>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="lbContent" required></textarea></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>