<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>



	<div id="outer">
		<div id="wrap">
			<jsp:include page="../common/header.jsp" />
			<br><br><br><br><br><br>
			<div id="main">
				<div align="center">
					<h2>회원탈퇴</h2>
				</div>

				<div align="center">
					<div>
						<!-- <div>
						<h4>탈퇴 유의사항</h4>
						<div>
							* 탈퇴하실 경우 구매내역 확인은 물론 로그인 후 가능한 모든 기능은 사용하실 수 없습니다.<br>
							* 탈퇴하신 후에 회원 정보의 복구는 불가능하며, 보유하신 쿠폰이나 적립금도 모두 무효화됩니다.<br>
							* 탈퇴하신 후 동일한 이메일, 휴대폰 번호로 재 가입은 탈퇴일로부터 90일 이후 가능합니다.</div>
						</div>
					</div> -->

						<form id="frm" name="frm" action="deleteMember.my" method="POST">
							<input type="hidden" hidden="" name="userId"
								value="${ loginUser.userId }">
							<div>
								<fieldset style="width: 100px">
									<legend>탈퇴사유</legend>
									<div>
										<div align="center">
											<textarea cols="50" rows="10" name="withdrawal"
												placeholder="탈퇴사유를 적어주세요!"></textarea>
										</div>

										<label for="userPwd">Password : </label> <input
											type="password" class="form-control" id="userPwd"
											placeholder="Please Enter Password" name="userPwd" required>
										<br>
									</div>
								</fieldset>

								<div class="btn-bottom-area">
									<button type="button" onclick="history.go(-1)">
										<span>취소</span>
									</button>
									<button type="button" id="btn">
										<span>확인</span>
									</button>
								</div>
							</div>
						</form>

						<script type="text/javascript">
							$('#btn').click(function() {
								
								var pass = $('#userPwd').val();
								
								$.ajax({
									url : "passchk.my",
									data : {
										pass : pass
									},
									type : "post",
									success : function(result){
										if(result == 'Y') {
											alert("비밀번호가 일치합니다!");
											$('#frm').submit();
										} else {
											alert("비밀번호가 일치하지 않습니다!");
										}
									},
									error : function(){
										alert("인증실패");
									}
								});
								
							})
		            </script>
					</div>
				</div>
			</div>


			<jsp:include page="../common/footer.jsp" />


		</div>
	</div>
</html>








