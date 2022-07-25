<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-21
  Time: 오후 5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update.jsp</title>
</head>
<body>
    <h2>회원정보 수정</h2>
    <form action="/member/update" method="post">
        회원번호: <input type="hidden" name="id" value="${updateMember.id}"><br>
        아이디: <input type="text" name="memberId" value="${updateMember.memberId}" readonly><br>
        비밀번호: <input type="password" name="memberPw" value="${updateMember.memberPw}"><br>
        이름: <input type="text" name="memberName" value="${updateMember.memberName}" readonly><br>
        나이: <input type="text" name="memberAge" value="${updateMember.memberAge}" readonly><br>
        이메일: <input type="text" name="memberEmail" value="${updateMember.memberEmail}"><br>
        전화번호: <input type="text" name="memberMobile" value="${updateMember.memberMobile}"><br>
        <input type="submit" value="수정">
        <a href="javascript:history.back()">뒤로가기</a>
    </form>
</body>
</html>
