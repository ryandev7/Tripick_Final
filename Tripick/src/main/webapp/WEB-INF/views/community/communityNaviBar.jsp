<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티메뉴바</title>
<style>
.nav-container {
    width: 220px;
    background-color: #F4B7B4;
    border-top: 1pt solid white;
    height: 100%;
    margin-top: 30px;
    position: relative;
}
.nav-titlebox {
    margin: 50px 0 20px 25px;
    text-align: left;
}
#nav-titlebox__title {
    font-family: 'Jua', sans-serif;
    font-size: 30px;
    color: #A9E2F3;
}
.nav-list {
    font-family: 'Nanum Gothic Coding', sans-serif;
    font-weight: bold;
    list-style: none;
    padding-left: 0;
}
.nav-list__item {
    font-size: 20px;
    text-align: left;
    margin-top: 24px;
    margin-left: 25px;
    color: blue;
}
.nav-list__item > a {
    text-decoration-line: none;
    color: #53868b;
}
.nav-list__item > a:hover {
    color: #7ac5cd;
}
</style>
</head>
<body>

    <%-- localboard, mate 목록에 include --%>
    <div class="nav-container" style="background-color: #98F5FF">
        <%-- 제목 --%>
        <div class="nav-titlebox" >
            <span id="nav-titlebox__title" style="color: black">커뮤니티</span>
        </div>
        <hr class="line--horizon" style="margin: 0 20px 0 20px;">
        <%-- 네비게이션 리스트 : 지역별 게시판, 동행 MATE --%>
        <ul class="nav-list">
            <li class="nav-list__item">
                <a href="list.lb">
                    지역별게시판
                </a>
            </li>
            <li class="nav-list__item">
                <a href="list.mb">
                    동행 MATE
                </a>
            </li>
        </ul>
    </div>
</body>
</html>