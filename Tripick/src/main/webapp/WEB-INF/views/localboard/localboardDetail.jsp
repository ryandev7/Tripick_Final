<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<style>
        table * {margin:5px;}
        table {width:100%;}
        
    #reply-area{
		display: flex;
		justify-content: center;
	}
	#reply-area-child{
		width:800px;
	}
	#rpt-btn{
		width:20px;
		height:20px;
		margin-left:5px;
		margin-bottom:5px;
	}
	#rpt-reply, #delete-reply{
		cursor:pointer;
	}
	#contentArea{
            width:60%;
            margin:auto;		
	}	
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="content">
        <br><br><br><br><br>
        <div class="innerOuter">
            <h2 align="center">게시글 상세보기</h2>
			<br>
            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td>${ b.lbTitle }</td>
                    <th>지역</th>
                    <td>${ b.localName }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ b.lbWriter } <button type="button" class="btn btn-info">채팅하기</button></td>
                    <th>작성일</th>
                    <td>${ b.createDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${ empty at.originName }">
                    			첨부파일이 없습니다.
                    		</c:when>
                    		<c:otherwise>
		                        <a href="${ at.changeName }" download="${ at.originName }">${ at.originName }</a>
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                    <th>조회수</th>
                    <td>${ b.count }</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ b.lbContent }</p></td>
                </tr>
            </table>
                <div id="singo" align="center">
                	<c:if test="${loginUser eq null }">
	                	<a class="btn btn-secondary" href="list.lb">목록으로</a>
                	</c:if>
                	<c:if test="${loginUser ne null && loginUser.userNickName ne b.lbWriter}">
	                	<button class="btn btn-danger" data-toggle="modal" data-target='#PostReportModal'>신고하기</button>
                	</c:if>
                </div>
            <br>

			 <c:if test="${ loginUser.userNickName eq b.lbWriter }">
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
                <a class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제하기</a>
                <a class="btn btn-secondary" href="list.lb">목록으로</a>
            </div>
			 </c:if> 
			 
		<!-- 삭제모달 -->
		   <div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">정말 게시글을 삭제하시겠습니까?</h4>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          	삭제를 누르면 삭제됩니다.
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" onclick="postFormSubmit(2)" >삭제하기</button>
	          	  <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  
		  
			<form action="delete.lb" id="postForm" method="post">
				<input type="hidden" value="${ b.localBoardNo }" name="bno">
				<input type="hidden" value="${ at.changeName }" name="filePath">
			</form>
			
			
			<script>
				function postFormSubmit(num){
					if(num == 1){ // 수정하기 클릭 시
						$('#postForm').attr('action','updateForm.lb').submit();
					} else{ // 삭제하기 클릭 시
						$('#postForm').attr('action','delete.lb').submit();
					}
				}
			</script>
			
            <br><br>
            
        <!-- 댓글목록 -->    
		<div id="reply-area">
			<div id="reply-area-child">
	            <table id="reply-list" class="table" align="center">
	                <thead>
	                	<c:choose>
	                		<c:when test="${ empty loginUser }">
	               
			                    <tr>
			                        <th colspan="2">
			                            <textarea class="form-control" readonly cols="55" rows="2" style="resize:none; width:100%;">로그인 후 이용 가능합니다. 로그인하세요</textarea>
			                        </th>
			                        <th style="vertical-align:middle"><button class="btn btn-secondary disabled">등록하기</button></th>
			                    </tr>
	                    	 </c:when>
	                    	<c:otherwise>
			                    <tr>
			                        <th colspan="2">
			                            <textarea class="form-control" id="content" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
			                        </th>
			                        <th style="vertical-align:middle"><button class="btn btn-secondary" onclick="addReply()">등록하기</button></th>
			                    </tr>
	                    	</c:otherwise>
	                    </c:choose>
	                    <tr>
	                        <td colspan="3">댓글(<span id="rcount">0</span>)</td>
	                    </tr> 
	                </thead>
	                <tbody>
	                </tbody>
	            </table>
			</div>
		</div>
        </div>
        <br><br>
        
        
                <!-- 댓글 신고 모달 -->
    <div class="modal fade" id="replyReportModal">
          <div class="modal-dialog">
           <div class="modal-content">
               <!-- Modal Header -->
               <div class="modal-header">
                      <img style="width:25px; height:25px" src="resources/common-upfiles/rpt-btn.png">
                   &nbsp;<h5 class="modal-title"><b>댓글 신고</b></h5>
                   <button type="button" class="close" data-dismiss="modal"></button>
               </div>

               <form name="reportForm" action="report.lb" method="post">
                   <!-- Modal body -->
                   <div class="modal-body">
                    <input type="hidden" name="bno" value="${b.localBoardNo }"> <!-- 게시글 번호 : redirect위함 -->
                    <input type="hidden" name="userId" value="${loginUser.userId }"> <!-- 신고자 ID -->
                    <input type="hidden" name="writeNo" id="writeNo" value=""> <!-- 신고할 댓글 번호 -->
                    <input type="hidden" name="divCode" value="R"> <!-- 구분코드 R : 댓글 -->
                    신고 사유<br>
                    <textarea name="rptContent" style="width:100%; height:200px" required></textarea>
                   </div>

                   <!-- Modal footer -->
                   <div class="modal-footer">
                       <button type="submit" class="btn btn-danger">신고하기</button>
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                   </div>
               </form>

           </div>
         </div>
    </div>
    
    
    <!-- 글 신고모달 -->
    <div class="modal fade" id="PostReportModal">
          <div class="modal-dialog">
           <div class="modal-content">
               <!-- Modal Header -->
               <div class="modal-header">
                      <img style="width:25px; height:25px" src="resources/common-upfiles/rpt-btn.png">
                   &nbsp;<h5 class="modal-title"><b>글 신고</b></h5>
                   <button type="button" class="close" data-dismiss="modal"></button>
               </div>

               <form name="reportForm" action="report.lb" method="post">
                   <!-- Modal body -->
                   <div class="modal-body">
                    <input type="hidden" name="bno" value="${b.localBoardNo }"> <!-- 게시글 번호 : redirect위함 -->
                    <input type="hidden" name="writeNo" value="${b.localBoardNo }"> <!-- 게시글 번호 : redirect위함 -->
                    <input type="hidden" name="userId" value="${loginUser.userId }"> <!-- 신고자 ID -->
                    <input type="hidden" name="divCode" value="L"> <!-- 구분코드 R : 댓글 -->
                    신고 사유<br>
                    <textarea name="rptContent" style="width:100%; height:200px" required></textarea>
                   </div>

                   <!-- Modal footer -->
                   <div class="modal-footer">
                       <button type="submit" class="btn btn-danger">신고하기</button>
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                   </div>
               </form>

           </div>
         </div>
    </div>

    </div>
    <script>
    	$(function(){
    		selectReplyList();
    		// 댓글조회하는 기능을 호출
    	})
    	
    	function addReply(){ // 댓글 작성용 ajax
    		
    		if($('#content').val().trim() != ''){
    			//console.log("ㅋㅋㅋ")
    			
    			/*
    				= 대입
    				2 == '2' true 
    				2 === '2' false 
    			*/
    			$.ajax({
    				url :'rinsert.lb',
    				data : {
    					refBoardNo : ${b.localBoardNo},
    					replyContent : $('#content').val(),
    					replyWriter : '${ loginUser.userId}'
    				}, success : function(status){
    					if(status == 'success'){
    						selectReplyList();
    						$('#content').val('');
    					}
    				}, error:function(){
    					console.log('댓글 못달았어~ ');
    				}
    			})
    			
    		} else{
    			alertify.alert("??", "댓글 똑바로 써라잇")
    		}
    		
    	}
    	
    	function selectReplyList(){
    		console.log('${b.localBoardNo}')
    		$.ajax({
    			url : 'rlist.lb', // 전체조회가 아님! 게시글에 딸린 댓글만 조회해야한다. (현재 게시글 번호만 넘겨야한다.)
    			data : {bno : ${ b.localBoardNo }},
    			success : function(list){
    				console.log(list);
    				let value='';
	    			for(let i in list){
	    				value += '<tr>'
	    					  + '<th>' + list[i].replyWriter + '</th>'
	    					  + '<td>' + list[i].replyContent + '</td>'
	    					  + '<td>' + list[i].create_date + '</td>'
		                       + '<td id="rpt-reply" onclick="reportReply('+ list[i].replyNo +')" data-toggle="modal" data-target="#replyReportModal">'
		                       + '<img data-replyNo="'+list[i].replyNo+'" id="rpt-btn" title="댓글 신고" src="resources/common-upfiles/rpt-btn.png">'		                       
		                       + '<input type="hidden" name="writeNo" value="'+ list[i].replyNo +'">'			
		                       + '</td>'
		                       + '<td id="delete-reply" onclick=\"deleteReply(\''+ list[i].replyNo + '\',\'' + list[i].replyWriter +'\')\"  title="댓글 삭제">❌</td>'
		                       + '</tr>'
	    			}
    			
    			$('#reply-list tbody').html(value);
    			$('#rcount').text(list.length);
    		}, error : function(){
    			console.log("에러났어~");
    		}
    		
    		})
    	}
    	
    	// 댓글 신고
 	   function reportReply(replyNo){
 	       if(${empty loginUser}){
 	           alert("로그인 후 이용 가능한 서비스입니다.");
 	           $("td[id='rpt-reply']").attr('data-target', '');
 	       } else {
 	            data= replyNo;
 	            //alert(data);
 	            $('.modal-body #writeNo').val(data);
 	       }
 	    }
		 // 댓글 삭제
		  function deleteReply(replyNo, replyWriter){
		  	if('${loginUser.userNickName}' == replyWriter){
		  		if(confirm("댓글을 삭제하시겠습니까?")){
		  			location.href='rdelete.lb?replyNo='+ replyNo + '&refBoardNo=${b.localBoardNo}'
		  		}
		  	}else{
		  		alert("댓글 작성자만 삭제 가능합니다")
		  	}
		  }    	
    
    </script>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>