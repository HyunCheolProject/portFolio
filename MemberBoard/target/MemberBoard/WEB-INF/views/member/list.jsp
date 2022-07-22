<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-22
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="/resources/js/jquery.js"></script>

<html>
<head>
    <title>list.jsp</title>
</head>
<body>
    <h2>회원목록</h2>
    <table>
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>이름</th>
            <th>나이</th>
            <th>이메일</th>
            <th>전화번호</th>
            <th>조회</th>
            <th>삭제</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
            <tr>
                <td>${member.id}</td>
                <td>${member.memberId}</td>
                <td>${member.memberName}</td>
                <td>${member.memberAge}</td>
                <td>${member.memberEmail}</td>
                <td>${member.memberMobile}</td>
                <td><a href="/member/detail?id=${member.id}">조회</a></td>
                <td><a href="/member/delete?id=${member.id}">삭제</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
