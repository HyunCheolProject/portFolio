<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-27
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>detail.jsp</title>
</head>
<body>
<div class="container">
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


    <button onblur="paging()">페이징목록</button>
    <br>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
</body>
<script>
    const paging = () => {
        location.href = "/board/paging?page=${page}";
    }
</script>
</html>
