<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-25
  Time: 오후 1:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>list.jsp</title>
    <script src="/resources/js/jquery.js"></script>

</head>
<body>
    <h2>글목록</h2>
    <table class="table">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일자</th>
            <th>조회수</th>
        </tr>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td>${board.id}</td>
                <td>${board.boardTitle}</td>
                <td>${board.boardWriter}</td>
                <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.boardCreatedDate}"></fmt:formatDate></td>
                <td>${board.boardHits}</td>
            </tr>
        </c:forEach>

    </table>
</body>
</html>
