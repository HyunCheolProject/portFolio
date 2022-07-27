<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-27
  Time: 오전 10:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>detail.jsp</title>
</head>
<body>
    <h2>회원정보</h2>
    아이디: ${member.memberId}<br>
    비밀번호: ${member.memberPw}<br>
    이름: ${member.memberName}<br>
    나이: ${member.memberAge}<br>
    이메일: ${member.memberEmail}<br>
    전화번호: ${member.memberMobile}<br>
    <button onclick="updateForm(${member.id})">정보수정</button>
    <button onclick="deleteForm(${member.id})">탈퇴</button>
    <br>
    <a href="javascript:history.back()">뒤로가기</a>
</body>
<script>
    const updateForm = (id) => {
        location.href = "/member/update-form?id" + id;
    }
</script>
</html>
