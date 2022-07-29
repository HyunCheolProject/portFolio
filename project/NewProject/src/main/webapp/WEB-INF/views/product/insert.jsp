<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-29
  Time: 오전 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>insert.jsp</title>
</head>
<body>
<h2>글작성</h2>
<form action="/product/insert" method="post" enctype="multipart/form-data">
  상품명: <input type="text" name="productName"><br>
  작성자: <input type="text" name="productWriter"><br>
  비밀번호: <input type="password" name="productPw"><br>
  내용: <textarea name="productContents" id="" cols="100" rows="100"></textarea><br>
  가격: <input type="text" name="productPrice"><br>
  첨부파일: <input type="file" name="productFile"><br>
  <input type="submit" value="작성">
  <a href="javascript:history.back()">뒤로가기</a>
</form>
</body>
</html>
