<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-27
  Time: 오전 9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>save.jsp</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="/member/save" method="post">
        아이디: <input type="text" name="memberId"><br>
        비밀번호: <input type="password" name="memberPw"><br>
        이름: <input type="text" name="memberName"><br>
        나이: <input type="text" name="memberAge"><br>
        이메일: <input type="text" name="memberEmail"><br>
        전화번호: <input type="text" name="memberMobile"><br>
        <input type="submit" value="가입">
    </form>
</body>
</html>
