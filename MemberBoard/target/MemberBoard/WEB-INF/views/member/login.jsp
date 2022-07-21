<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-21
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login.jsp</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="/member/login" method="post">
        아이디: <input type="text" name="memberId"><br>
        비밀번호: <input type="password" name="memberPw"><br>
        <input type="submit" value="로그인">
    </form>
</body>
</html>
