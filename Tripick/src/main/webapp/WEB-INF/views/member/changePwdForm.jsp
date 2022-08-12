<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div align="center"> 
<h1> 비밀번호 변경</h1>
<form action="#">
<input type="hidden" value="" name="userId">
비밀번호 입력 : <input type="password" placeholder ="비밀번호를 입력해주세요">
비밀번호 재입력 : <input type="password" placeholder ="비밀번호를 재입력해주세요">
<button type="submit" id="btn">비밀번호 변경</button>
</form>
</div>
</body>
</html>