<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-22
  Time: 오후 4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<header id="header">


    <ul class="icons">
        <c:choose>
            <c:when test="${sessionScope.id == null}">
                <%--        <li><a href="/">Home</a></td>--%>
                <%--        <li><a href="/member/login-form">로그인</a></td>--%>
                <%--        <li><a href="/member/save-form">회원가입</a></td>--%>
            </c:when>
            <c:when test="${sessionScope.memberId == 'khc4572'}">
                <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                <span id="login_log" style="border-bottom: 1px solid white;">${sessionScope.memberId} 님, 환영합니다.</span>
                <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="/member/admin-form">관리자페이지</a></li>
                <li><a href="/member/logout-form">로그아웃</a></li>
                <li><a href="/member/update-form">마이페이지</a></li>
            </c:when>
            <c:otherwise>
                <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                <span id="login_log" style="border-bottom: 1px solid white;">${sessionScope.memberId} 님, 환영합니다.</span>
                <span class="glyphicon glyphicon-heart-empty" style="color: white;" aria-hidden="true"></span>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <li><a href="/member/logout-form">로그아웃</a></li>
                <li><a href="/member/update-form">마이페이지</a></li>
            </c:otherwise>
        </c:choose>
        <%--        <li><a href="/board/paging">글목록</a></td>--%>
    </ul>

</header>
</body>
</html>
