<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-25
  Time: 오후 2:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>detail.jsp</title>
</head>
<body>
    <h2>상세페이지</h2>
    글번호: ${board.id}<br>
    제목: ${board.boardTitle}<br>
    작성자: ${board.boardWriter}<br>
    비밀번호: ${board.boardPw}<br>
    내용: ${board.boardContents}<br>
    작성일자:<fmt:formatDate pattern="yyyy-MM-dd" value="${board.boardCreatedDate}"></fmt:formatDate><br>
    조회수: ${board.boardHits}<br>
    <img src="${pageContext.request.contextPath}/upload/${board.boardFileName}"
         alt="" height="100" width="100"><br>
    <a href="javascript:history.back()">뒤로가기</a>

</body>
</html>
