<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-21
  Time: 오후 4:17
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
        아이디: <input type="text" onblur="emailCheck()" id="memberId" name="memberId"><br>
        <span id="emailCheck-result"></span><br>
        비밀번호: <input type="password" name="memberPw"><br>
        이름: <input type="text" name="memberName"><br>
        나이: <input type="text" name="memberAge"><br>
        이메일: <input type="text" name="memberEmail"><br>
        전화번호: <input type="text" name="memberMobile"><br>
        <input type="submit" value="가입">
        <a href="javascript:history.back()">뒤로가기</a>
    </form>
<script src="/resources/js/jquery.js"></script>

</body>

<script>
    const emailCheck = () => {
        const memberId = document.getElementById("memberId").value;
        const emailCheckResult = document.getElementById("emailCheck-result");
        $.ajax ({
            type: "post",
            url: "/member/email-check",
            data: {"memberId": memberId},
            dataType: "text",
            success: function (result) {
                if ( result == "ok") {
                    emailCheckResult.innerHTML = "사용가능한 아이디 입니다.";
                    emailCheckResult.style.color = "#2183d3";
                } else {
                    emailCheckResult.innerHTML = "이미 사용중이거나 올바른 아이디가 아닙니다.";
                    emailCheckResult.style.color = "red";
                }
            },
            error: function () {
                alert("오타체크");
            }
        });
    }
</script>
</html>
