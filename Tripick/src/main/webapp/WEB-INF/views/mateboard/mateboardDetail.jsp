<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동행게시글 상세보기</title>
<style>
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
	<br><br><br><br>
    <div class="content">
    	<br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>

            <br><br>

            <table id="contentArea" algin="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td>${ m.mateTitle }</td>
                    <th>지역</th>
                    <td>${ m.localName }</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${ m.mateWriter }</td>
                    <th>작성일</th>
                    <td>${ m.createDate }</td>
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
                    <td>${ m.count }</td>
                </tr>
                <tr>
                	<th>동행기간</th>
                	<td>${m.firstDate} - ${m.lastDate}</td>
                    <th>모집여부</th>
                    <td>
                    	<c:choose>
							<c:when test="${m.recruitStatus eq 'Y'}">모집중</c:when>
							<c:otherwise>모집완료</c:otherwise>
						</c:choose>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td></td>
                    <c:choose>
                    	<c:when test="${loginUser.userId eq m.mateWriter }">
                    		<td><b>현재인원</b>${m.memberCurCount} / ${m.memberCount}</td>
                    		<td colspan="2"><a class="btn btn-primary">모집마감</a></td>
                    	</c:when>
                    	<c:otherwise>
	                    	<th>현재인원</th>
	                    	<td>${m.memberCurCount} / ${m.memberCount}</td>
                    	</c:otherwise>
                    </c:choose>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${ m.mateContent }</p></td>
                </tr>
            </table>
            <br>

			<c:choose>
			 <c:when test="${ loginUser.userId eq m.mateWriter }">
	            <div align="center">
	                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
	                <a class="btn btn-success" href="">신청현황</a>
	                <a class="btn btn-primary" onclick="postFormSubmit(1)">수정하기</a>
	                <a class="btn btn-danger" data-toggle="modal" data-target="#myModal">삭제하기</a>
	                <a class="btn btn-secondary" href="list.mb">목록으로</a>
	            </div>
			 </c:when>
			 <c:otherwise>
				 <div align="center">
				 	<a class="btn btn-success" onclick="postFormSubmit(3)">신청하기</a>
				 	<a class="btn btn-secondary" href="list.mb">목록으로</a>
				 	<a class="btn btn-warning" data-toggle="modal" data-target='#PostReportModal'>신고하기</a>
				 </div>
			 </c:otherwise>
			</c:choose>

				  <!-- 게시글 삭제모달 -->
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
		    <form action="delete.mb" id="postForm" method="post">
				<input type="hidden" value="${ m.mateNo }" name="mno">
				<input type="hidden" value="${ at.changeName }" name="filePath">
				<input type="hidden" value="${ loginUser.userId }" name="userId">
			</form>
			<script>
				function postFormSubmit(num){
					if(num == 1){ // 수정하기 클릭 시
						$('#postForm').attr('action','updateForm.mb').submit();
					} else if(num == 2){ // 삭제하기 클릭 시
						$('#postForm').attr('action','delete.mb').submit();
					} else{ // 신청하기 클릭 시
						$('#postForm').attr('action','insertApply.mb').submit();
					}
				}
			</script>
            <br><br>
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

               <form name="reportForm" action="report.mb" method="post">
                   <!-- Modal body -->
                   <div class="modal-body">
                    <input type="hidden" name="mateNo" value="${m.mateNo }"> <!-- 코스 번호 : redirect위함 -->
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

               <form name="reportForm" action="report.mb" method="post">
                   <!-- Modal body -->
                   <div class="modal-body">
                    <input type="hidden" name="bno" value="${m.mateNo}"> <!-- 게시글 번호 : redirect위함 -->
                    <input type="hidden" name="writeNo" value="${m.mateNo}"> <!-- 게시글 번호 : redirect위함 -->
                    <input type="hidden" name="userId" value="${loginUser.userId }"> <!-- 신고자 ID -->
                    <input type="hidden" name="divCode" value="M"> <!-- 구분코드 R : 댓글 -->
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
    				url :'rinsert.mb',
    				data : {
    					refBoardNo : ${m.mateNo},
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
    		console.log('${m.mateNo}')
    		$.ajax({
    			url : 'rlist.mb', // 전체조회가 아님! 게시글에 딸린 댓글만 조회해야한다. (현재 게시글 번호만 넘겨야한다.)
    			data : {bno : ${ m.mateNo }},
    			success : function(list){
    				console.log(list);
    				let value='';
	    			for(let i in list){
	    				value += '<tr>'
	    					  + '<th>' + list[i].replyWriter + '</th>'
	    					  + '<td>' + list[i].replyContent + '</td>'
	    					  + '<td>' + list[i].create_date + '</td>'
		                       + '<td id="rpt-reply" onclick="reportReply('+ list[i].replyNo +')" data-toggle="modal" data-target="#replyReportModal">'
		                       + '<img data-replyNo="'+list[i].replyNo+'" id="rpt-btn" title="댓글 신고" src="resources/common-upfiles/rpt-btn.png">'		                       + '<input type="hidden" name="writeNo" value="'+ list[i].replyNo +'">'			
		                       + '</td>'
		                       + '<td id="delete-reply" title="댓글 삭제">❌</td>'
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
    
    </script>
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>