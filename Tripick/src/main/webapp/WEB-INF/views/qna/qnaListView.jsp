<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록 페이지</title>
<style>
    table { 
        border-collapse: collapse; 
    }
    #wrap{
        height: 1200px;
    }

    #serviceCenter{
        text-align: center;
        width: 100%;
        height: 60px;
        margin-bottom: 20px;
    }
    #qna{
        text-align: center;
        width: 600px;
        height: 100px;
        margin: auto;
        padding-top: 5px;
        font-size: 25px;
        margin-bottom: 30px;
    }

    #qna > a:nth-child(1){
        padding-left: 80px;
        padding-right: 80px;
        padding-top: 10px;
        padding-bottom: 10px;
        border: 2px solid black;
    }
    #qna > a:nth-child(2){
        padding-left: 80px;
        padding-right: 80px;
        padding-top: 10px;
        padding-bottom: 10px;
        border: 2px solid #7AC5CD;
        border-right: none;
        background-color: #7AC5CD;
        color: white;
    }

    #qna_btn{
        text-align: right;
        width: 1300px;
        margin: auto;
    }
    #qna_btn > a{
        font-size: 18px;
        padding: 10px;
        color: white;
        background-color: #7AC5CD;
    }

    /*Qna 리스트*/
    #qna_list{
        margin-top: 25px;
    }
    
    #qna_table{
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
    #qnaTitleTd{
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

    /*스위치*/
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
        vertical-align:middle;
        margin-right: 20px;
        margin-left: 10px;
    }

    .switch input {
        display:none;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: lightgray;
        transition: .4s;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: .4s;
    }

    input:checked + .slider {
        background-color: #7AC5CD;
    }

    /*얼만큼 이동할지*/
    input:checked + .slider:before {
        transform: translateX(26px);
    }
    .slider.round {
        border-radius: 20px;
    }
    .slider.round:before {
        border-radius: 50%;
    }

</style>
</head>
<body>
    <div id="outer">
        <div id="wrap">

            <jsp:include page="../common/header.jsp"/>

            <br><br><br><br><br><br><br>

            <div id="serviceCenter">
                <p style="font-size: 40px;">Q&A</p>
            </div>
            <br><br>
            
            <div id="qna">
                <a href="list.no">공지사항</a><!--
                --><a href="list.qna">&nbsp;&nbsp;&nbsp;Q&A&nbsp;&nbsp;&nbsp;</a>
            </div>
            
            <div id="qna_btn">
                <c:choose>
                    <c:when test="${loginUser.authority eq 'M'}">
                        <span>내 글만 보기</span>     
                        <label class="switch">
                                <input type="checkbox">
                            <span class="slider round"></span>
                        </label>
                        <a href="enrollForm.qna">Q&A 작성</a>
                    </c:when>
                    <c:otherwise>
                        <span></span>
                        <label class="switch">
                        </label>
                    </c:otherwise>
                </c:choose>

                <script>

                    var check = $("input[type='checkbox']");
                    check.click(function(){

                        if($(check).is(":checked")){
                            console.log('hello');

                            $.ajax({
                                url: 'qna.my',
                                data : {
                                    qnaWriter : '${loginUser.userId}'
                                },
                                success:function(myList){
                                    console.log(myList);
                                    
                                    let value='';

                                    for(let i in myList){
                                        console.log(myList[i].qnaNo);

                                        var flag = true;
                                        if(myList[i].answer){
                                            flag = true;
                                        } else{
                                            flag = false;
                                        }
                                        value += '<tr><input type="hidden" name="qno" id="qno" value="'+ myList[i].qnaNo +'">';

                                               if(flag){
                                                value += '<td>답변완료</td>';
                                               } else{
                                                value += '<td>미답변</td>';
                                               }

                                               value += '<td id="qnaTitleTd">🔒 ' + myList[i].qnaTitle + '</td>'
                                               + '<td>'+ myList[i].qnaWriter + '</td>'
                                               + '<td>' + myList[i].qnaDate + '</td></tr>';

                                               

                                    }
                                    $('#qna_table>tbody').html(value);
                                    $('#pagingArea').html('');
                                    $(function(){
                                        $('#qna_table>tbody>tr').click(function(){
                                            location.href = 'detail.qna?qno='+$(this).children('#qno').val();
                                        });
                                    })
                                }
                            })

                        }else{
                            location.reload();
                        }
                        
                    });

                  </script>
            </div>
            
            
            <div id="qna_list">
                <table id="qna_table" align="center">
                    <thead>
                        <tr >
                            <th width="150">답변상태</th>
                            <th>제목</th>
                            <th width="100">작성자</th>
                            <th width="150">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="q" items="${list}">
                            <tr>
                                <input type="hidden" name="qno" id="qno" value="${q.qnaNo}">
                                <c:choose>
                                    <c:when test="${q.answer eq null}">
                                        <td>미답변</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>답변완료</td>
                                    </c:otherwise>
                                </c:choose>
                                
                                <td id="qnaTitleTd"> <img src="./resources/common-upfiles/padlock.png" style="width: 15px;"> ${q.qnaTitle}</td>
                                <td>${q.qnaWriter}</td>
                                <td>${q.qnaDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br><br>

                <script>

                    $(function(){
                        $('#qna_table>tbody>tr').click(function(){

                        	if(${empty loginUser}){
                                alert('로그인 후 이용 가능합니다.');
                            }else if(${loginUser.authority eq 'A'}){
                                location.href = 'detail.qna?qno='+$(this).children('#qno').val();
                            }else if($(this).find("td").eq(2).html() == '${loginUser.userNickName}'){
                                location.href = 'detail.qna?qno='+$(this).children('#qno').val();
                            }else{
                                alert('본인이 작성한 글만 볼 수 있습니다.');
                            }
                           // location.href = 'detail.qna?qno='+$(this).children('#qno').val();
                        });
                    })

                </script>


                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item"><a>&lt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="list.qna?cpage=${pi.currentPage - 1}">&lt;</a></li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item"><a href="list.qna?cpage=${p}">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item"><a>&gt;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a href="list.qna?cpage=${pi.currentPage + 1}">&gt;</a></li>
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