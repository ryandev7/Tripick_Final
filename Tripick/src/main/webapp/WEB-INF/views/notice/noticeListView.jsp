<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록 페이지</title>
<style>
    table { border-collapse: collapse; }
    #wrap{
        height: 1200px;
    }

    #serviceCenter{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 20px;
    }
    #notice{
        text-align: center;
        width: 530px;
        height: 100px;
        margin: auto;
        padding-top: 5px;
        font-size: 25px;
        margin-bottom: 30px;
    }

    #notice > a:nth-child(1){
        padding-left: 80px;
        padding-right: 80px;
        padding-top: 10px;
        padding-bottom: 10px;
        border: 2px solid #7AC5CD;
        border-right: none;
        background-color: #7AC5CD;
        color: white;
    }
    #notice > a:nth-child(2){
        padding-left: 80px;
        padding-right: 80px;
        padding-top: 10px;
        padding-bottom: 10px;
        border: 2px solid black;
        
    }


    #notice_btn{
        text-align: right;
        width: 1300px;
        margin: auto;
        margin-bottom: 30px;
    }
    #notice_btn > a{
        font-size: 18px;
        padding: 10px;
        color: white;
        background-color: #7AC5CD;
    }


    /*공지사항 리스트*/
    #notice_list{
        margin-top: 40px;
    }
    
    #notice_table{
        text-align: center;
        width: 1300px;
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
        margin-left: 5px;
        cursor: pointer;
    }
    #pagingArea>ul>li>a{
        font-size: 20px;
    }

    
</style>
</head>
<body>
    <div id="outer">
        <div id="wrap">

            <jsp:include page="../common/header.jsp"/>

            <br><br><br><br><br><br><br>

            <div id="serviceCenter">
                <p style="font-size: 40px;">공지사항</p>
            </div>
            <br><br>
            
            <div id="notice">
                <a href="list.no">공지사항</a><!--
                --><a href="">&nbsp;&nbsp;&nbsp;Q&A&nbsp;&nbsp;&nbsp;</a>
            </div>
            
            <div id="notice_btn">
                <a href="enrollForm.no">공지사항 작성</a>
            </div>
            
            
            <div id="notice_list">
                <table id="notice_table" align="center">
                    <thead>
                        <tr >
                            <th width="130">글번호</th>
                            <th>제목</th>
                            <th width="100">작성자</th>
                            <th width="150">작성일</th>
                            <th width="100">조회</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="n" items="${list}">
                            <tr>
                                <td id="nno">${n.noticeNo}</td>
                                <td>${n.noticeTitle}</td>
                                <td>${n.noticeWriter}</td>
                                <td>${n.noticeDate}</td>
                                <td>${n.count}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br><br>

                <script>

                    $(function(){
                        $('#notice_table>tbody>tr').click(function(){
                            location.href = 'detail.no?nno='+$(this).children('#nno').text();
                        })
                    })

                </script>


                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item"><a>&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="list.no?cpage=${pi.currentPage - 1}">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item"><a href="list.no?cpage=${p}">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item"><a>&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="list.no?cpage=${pi.currentPage + 1}">&gt;</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>


                </div>

            </div>
            <br><br><br><br><br>
            
        </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>

</body>
</html>