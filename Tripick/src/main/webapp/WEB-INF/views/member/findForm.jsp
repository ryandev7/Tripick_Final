<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
		display: block;
	}
	/* 기본 스타일 설정 */
	body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, button {
		margin: 0;
		padding: 0;
		font-family: "Malgun Gothic",dotum,gulim,sans-serif;
	}
	.help_find .tab_find {
		overflow: hidden;
		background: #fbfbfb;
	}
	.tab_find{
		margin-left:2px;
	}
	.cont_find {
		position: relative;
		z-index: 1;
		margin-top: -1px;
		width: 100%;
		padding: 124px 99px 125px 99px;
		border: 1px solid #666;
	}
	
	/* content 영역 사이즈설정 */
	#content {
		min-height: 960px;
		position: relative;
		z-index: 1;
		margin: 200px auto 80px auto;
		width: 960px;
	}



	/* 상단바 스타일 조정*/
	.help_find .tab_find li {
		float: left;
		margin-left: -1px;
		width: 480px;
		height: 50px;
		border: 1px solid #e4e5e7;
		border-bottom: 1px solid #444;
	}

	.help_find * {
		box-sizing: border-box;
		letter-spacing: -1px;
	}

	.help_find .link_find {
		display: block;
		font-size: 15px;
		line-height: 48px;
		text-align: center;
		color: #222;
	}

	
	/* 상단 버튼 눌렸을때   */
	.help_find .on .link_find {
		font-size: 16px;
		font-weight: bold;
		line-height: 47px;
		color: #444;
	}


	/* 상단 아이디 버튼 눌렸을때   */
	.help_find .tab_find .on {
		position: relative;
		z-index: 2;
		border-color: #666;
		border-bottom-color: #fff;
		background: #fff;
	}
	
	
	ol, ul, li {
		list-style: none;
	}


	ul {
		list-style-type: disc;
	}
	

	fieldset {
		display: block;
		border:0;
		margin-inline-start: 2px;
		margin-inline-end: 2px;
		padding-block-start: 0.35em;
		padding-inline-start: 0.75em;
		padding-inline-end: 0.75em;
		padding-block-end: 0.625em;
		min-inline-size: min-content;

	}

	.help_find .desc_find {
		margin-bottom: 25px;
		font-size: 15px;
		font-weight: bold;
		line-height: 15px;
		color: #444;
	}
	.help_find .wrap_lab {
		display: table-cell;
		position: relative;
		padding: 26px 0 0 39px;
		width: 185px;
		vertical-align: top;
	}
	.help_find .wrap_input {
		display: table-cell;
		position: relative;
		padding: 12px 20px;
		width: 575px;
		background: #fff;
		vertical-align: top;
	}

	.help_find .lab_find {
		display: block;
		font-size: 15px;
		line-height: 15px;
		color: #666;
	}

	.help_find .list_find li {
		border-bottom: 1px solid #eaeaea;
		font-size: 0;
		background: #f7f7f7;
	}
	.help_find .box_input {
		display: inline-block;
		position: relative;
		border: 1px solid #dbdbdb;
		vertical-align: top;
	}

	.help_find .inp_find {
		display: block;
		padding: 0 18px 1px 18px;
		width: 336px;
		height: 38px;
		border: 0;
		font-size: 15px;
		line-height: 40px;
		letter-spacing: normal;
		color: #444;
		vertical-align: middle;
	}
	
	/* 작은 버튼 */
	.help_find .btn_basic2.type03 {
		top: 12px;
		width: 115px;
	}
	.btn_basic2.type03 {
		border: 0;
		margin-top: 4px;
		color: #fffaa;
		font-weight: bold;
		background-color: #8EE5EE;
	}

	.help_find .btn_basic2 {
		position: absolute;
		left: 367px;
		top: 57px;
		min-width: 94px;
		padding: 6px 18px 8px;
	}


	/* 아래 버튼 */
	.help_find .wrap_link {
		display: block;
		margin: 40px auto 0;
		font-size: 0;
		text-align: center;
	}

	.help_find .wrap_link .btn_biggest_type01, .help_find .wrap_link .btn_biggest_type03, .help_find .wrap_link .btn_biggest_type04 {
		margin: 0 5px;
		padding: 11px 8px 14px;
		width: 212px;
		height: 60px;
		font-size: 20px;
		letter-spacing: -2px;
	}
	
	/* 큰 버튼 */
	.btn_biggest_type01 {
		display: inline-block;
		padding: 13px 8px 14px;
		width: 200px;
		height: 50px;
		border: 1px solid #5f75eb;
		box-sizing: border-box;
		color: #fff;
		font-size: 16px;
		line-height: normal;
		text-align: center;
		vertical-align: top;
		background-color: #6b80f1;
	}

	/* 아이디 출력 부분 */
	#result_id{
		font-weight: bold;
		margin-top:20px;
		font-size: 20px;
		text-align:center;
		color:blue;
	}
	
	/* 아이디 찾기 버튼 */
	#btn_cert_search{
		background-color: green;
	}

  </style>


</head>
<body>

<jsp:include page="../common/header.jsp"/>

 <div id="content">
	<div class="help_find" id="person_find">
			<ul class="tab_find">
				<li class="on" id="find_cell"><a href="javascript:;" class="link_find">아이디 찾기</a></li>
				<li id="find_mail"><a href="javascript:;" class="link_find">비밀번호 찾기</a></li>
			</ul>
			<div class="cont_find">
				<form action="https://www.saramin.co.kr/zf_user/helpdesk/person-find-secure" method="post" id="find_form">
					<fieldset>
						<p class="desc_find">회원정보에 등록된 정보로 아이디를 찾을 수 있습니다.</p>
						<ul class="list_find">
							<li>
								<div class="wrap_lab"><label for="name" class="lab_find">이름</label></div>
								<div class="wrap_input">
									<span class="box_input">
										<input type="text" name="name" id="name" class="inp_find" placeholder="이름을 입력해주세요">
									</span>
									<p class="message_find" id="msg_name" style="display:none;">이름에 특수문자, 숫자는 사용하실 수 없습니다.</p>
								</div>
							</li>

							<li id="li_cell">
								<div class="wrap_lab"><label for="cell" class="lab_find">이메일 주소</label></div>
								<div class="wrap_input">
									<span class="box_input">
										<input type="text" name="cell" id="cell" class="inp_find" placeholder="이메일주소를 입력해주세요">
									</span>	
									<button type="button" id="btn_cert_cell" class="btn_basic2 type03 btn_cert">인증번호 발송</button>
								</div>
							</li>

							<li id="li_mail" style="display: none;">
								<div class="wrap_lab"><label for="email" class="lab_find">이메일 주소</label></div>
								<div class="wrap_input">
									<span class="box_input">
										<input type="text" name="email" id="email" class="inp_find">
									</span>
									<div class="suggest_email email_list">
										<ul class="list_email">
											<li class="auto_list"><a href="javascript:;" onclick="return false;" class="link_email"><strong class="txt_email"></strong>@naver.com</a></li>
											<li class="auto_list"><a href="javascript:;" onclick="return false;" class="link_email"><strong class="txt_email"></strong>@gmail.com</a></li>
											<li class="auto_list"><a href="javascript:;" onclick="return false;" class="link_email"><strong class="txt_email"></strong>@daum.net</a></li>
											<li class="auto_list"><a href="javascript:;" onclick="return false;" class="link_email"><strong class="txt_email"></strong>@nate.com</a></li>
											<li class="auto_list"><a href="javascript:;" onclick="return false;" class="link_email"><strong class="txt_email"></strong>@outlook.com</a></li>
										</ul>
									</div>
									<p class="message_find" id="msg_mail" style="display:none;">이메일주소를 정확하게 입력해주세요.</p>
									<button type="button" id="btn_cert_mail" class="btn_basic2 type03 btn_cert">인증번호 발송</button>
								</div>
							</li>

							<li>
								<div class="wrap_lab"><label for="findCite" class="lab_find">인증번호</label></div>
								<div class="wrap_input">
									<span class="box_input">
									   <input type="text" name="findCite" id="findCite" class="inp_find" placeholder="인증번호를 입력해주세요">
										<span class="message_find time_find" style="display:none;">남은 시간 (3:00)</span>
									</span>
									<p class="message_find" id="msg_cert_num" style="display:none;">입력시간이 만료되었습니다. 인증번호를 다시 발송해주세요.</p>
									<p class="message_find ok" style="display:none;">인증 성공. 잠시만 기다려주세요.</p>
									<button type="button" id="btn_cert_cell" class="btn_basic2 type03 btn_cert">인증확인</button>
								</div>
							</li>
						</ul>
						
						<p id="result_id">
							당신의 아이디는 "xxxx" 입니다					
						</p>
						
						<div class="wrap_link">
							<button type="button" class="btn_biggest_type01" id="btn_cert_search">아이디 찾기</button>
							<button type="button" class="btn_biggest_type01" id="btn_cert_back">뒤로</button>
	<!--                        <button type="button" class="btn_biggest_type01" id="btn_next" style="display: none">다음</button>-->
						</div>
					</fieldset>
				</form>
			</div>

	</div>
	</div>
	<jsp:include page="../common/footer.jsp"/>
	
 </body>
</html>