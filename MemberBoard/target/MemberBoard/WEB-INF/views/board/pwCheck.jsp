<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-25
  Time: 오후 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>pwCheck.jsp</title>
</head>
<body>
    <h2>비밀번호 체크 페이지</h2>
    <form action="/board/delete" method="post">
        <label for="pwConfirm">비밀번호를 입력해주세요</label>
        <input type="text" id="pwConfirm"><br>
        <input type="button" value="삭제" onclick="pwCheck()">
    </form>
</body>
<script>
    const pwCheck = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${board.boardPw}';
        if (pwConfirm == pwDB) {
            location.href = "/board/delete?id=${board.id}";
        } else {
            alert("비밀번호가 일치하지 않습니다.");
            location.href = "/board/detail?id=${board.id}";
        }
    }
</script>
</html>
