<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-25
  Time: 오후 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save.jsp</title>
</head>
<body>
  <h2>글작성</h2>
  <form action="/board/save" method="post" enctype="multipart/form-data">
    제목: <input type="text" name="boardTitle"><br>
    작성자: <input type="text" name="boardWriter"><br>
    비밀번호: <input type="password" name="boardPw"><br>
    내용: <textarea name="boardContents" id="" cols="10" rows="5"></textarea><br>
    첨부파일: <input type="file" name="boardFile"><br>
    <input type="submit" value="작성">
    <a href="javascript:history.back()">뒤로가기</a>


  </form>
</body>
</html>
