<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-27
  Time: 오후 3:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update.jsp</title>
</head>
<body>
<h2>글 수정페이지</h2>
<form action="/board/update" method="post" id="updateForm">
    글번호: <input type="text" name="id" value="${boardUpdate.id}" readonly><br>
    제목: <input type="text" name="boardTitle" value="${boardUpdate.boardTitle}"><br>
    작성자: <input type="text" name="boardWriter" value="${boardUpdate.boardWriter}" readonly><br>
    비밀번호: <input type="password" name="boardPw" id="pwConfirm" value="${boardUpdate.boardPw}"><br>
    내용: <textarea name="boardContents" id="" cols="40" rows="10">${boardUpdate.boardContents}</textarea><br>
    <input type="button" onclick="boardUpdated()" value="수정">
</form>
</body>

<script>
    const boardUpdated = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${boardUpdate.boardPw}';
        if ( pwConfirm == pwDB) {
            updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>
</html>