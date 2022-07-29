<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-29
  Time: 오전 10:27
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
    글번호: ${product.id}<br>
    작성자: ${product.productWriter}<br>
    비밀번호: ${product.productPw}<br>
    내용: ${product.productContents}<br>
    작성일자:<fmt:formatDate pattern="yyyy-MM-dd" value="${product.productCreatedDate}"></fmt:formatDate><br>
    조회수: ${product.productHits}<br>
    <img src="${pageContext.request.contextPath}/upload/${product.productFileName}"
         alt="" height="100" width="100"><br>

    <button onclick="boardUpdate()">수정</button>
    <button onclick="boardDelete()">삭제</button>
    <button onblur="paging()">페이징목록</button>
    <br>
</div>
</body>
</html>
