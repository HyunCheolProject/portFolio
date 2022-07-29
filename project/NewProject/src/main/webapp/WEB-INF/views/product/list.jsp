<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-29
  Time: 오전 10:09
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
  <c:forEach items="${productList}" var="product">
    <tr>
      <td>${product.id}</td>
      <td><a href="/product/detail?id=${product.id}">${product.productName}</a></td>
      <td>${product.productWriter}</td>
      <td><fmt:formatDate pattern="yyyy-MM-dd" value="${product.productCreatedDate}"></fmt:formatDate></td>
      <td>${product.productHits}</td>
    </tr>
  </c:forEach>

</table>
<a href="javascript:history.back()">뒤로가기</a>

</body>
</html>
