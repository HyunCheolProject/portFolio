<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-30
  Time: 오후 4:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>index.jsp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>

    <link rel="stylesheet" href="\resources\assets\css/main.css"/>
    <noscript>
        <link rel="stylesheet" href="\resources\assets\css/noscript.css"/>
    </noscript>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header" class="alt">
        <span class="logo"><img src="\resources\images/logo.svg" alt=""/></span>
        <h1>쿸팡</h1>
        <p>식재료 주문은 쿸팡에서!<br/>
            <a href="/product/findAll">지금 바로 구경하세요!</a></p>
    </header>

    <!-- Nav -->
    <nav id="nav">
        <ul>
            <c:choose>
                <c:when test="${sessionScope.id == null}">
                    <li><a href="/">Home</a></li>
                    <li><a href="/product/findAll">식재료</a></li>
                    <li><a href="/board/paging">고객센터</a></li>
                    <li><a href="/member/save-form" class="active">회원가입</a></li>
                    <li><a href="/member/login-form">로그인</a></li>


                </c:when>
                <c:when test="${sessionScope.memberId == 'khc4572'}">
                                <span class="glyphicon glyphicon-heart-empty" style="color: white;"
                                      aria-hidden="true"></span>
                    <span id="login_log"
                          style="border-bottom: 1px solid white;">${sessionScope.memberId} 님 환영합니다.</span>
                    <li><a href="/member/myPage">마이페이지</a></li>
                    <li><a href="/member/admin-form">관리자페이지</a></li>
                    <li><a href="/member/logout-form">로그아웃</a></li>
                    <br>
                    <span class="glyphicon glyphicon-heart-empty" style="color: white;"
                          aria-hidden="true"></span>
                    <li><a href="/">Home</a></li>
                    <li><a href="/product/findAll">식재료</a></li>
                    <li><a href="/board/paging">고객센터</a></li>
                </c:when>
                <c:otherwise>
                                <span class="glyphicon glyphicon-heart-empty" style="color: white;"
                                      aria-hidden="true"></span>
                    <span id="login_log"
                          style="border-bottom: 1px solid white;">${sessionScope.memberId} 님, 환영합니다.</span>
                    <li><a href="/member/myPage">마이페이지</a></li>
                    <li><a href="/member/logout-form">로그아웃</a></li>
                    <br>
                    <span class="glyphicon glyphicon-heart-empty" style="color: white;"
                          aria-hidden="true"></span>
                    <li><a href="/">Home</a></li>
                    <li><a href="/product/findAll">식재료</a></li>
                    <li><a href="/board/paging">고객센터</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- First Section -->
        <section id="first" class="main special">
            <header class="major">
                <h2>상품수정</h2>
            </header>

            <section>
                <div class="input-group mb-3 card">
                    <form action="/product/update" method="post" name="updateForm" enctype="multipart/form-data">
                        <br>
                        <div style="text-align: left">
                            &nbsp;&nbsp;상품번호 <input type="text" name="id" value="${productUpdate.id}" readonly><br>
                            &nbsp;&nbsp;상품명 <input type="text" name="productName"
                                                   value="${productUpdate.productName}"><br>
                            가격 <input type="text" name="productPrice" value="${productUpdate.productPrice}"><br>
                            카테고리 <input type="text" name="productCategory" value="${productUpdate.productCategory}"><br>
                            &nbsp;&nbsp;작성자 <input type="text" name="productWriter"
                                                   value="${productUpdate.productWriter}" readonly><br>
                            &nbsp;&nbsp;비밀번호 <input type="password" name="productPw" id="pwConfirm"
                        ><br>
                            &nbsp;&nbsp;내용 <textarea name="productContents" cols="40"
                                                     rows="10">${productUpdate.productContents}</textarea><br>
                            첨부파일 <input type="file" name="productFile" ${productUpdate.productFile}><br>
                        </div>
                        <%--                        <input type="submit" value="수정">--%>
                        <input type="button" onclick="productUpdated()" value="수정">
                    </form>
                    &nbsp;
                </div>
                <br>
                <a href="javascript:history.back()">뒤로가기</a>
            </section>
        </section>
    </div>

</div>
</section>
</section>

</div>

<!-- Footer -->
<footer id="footer">

</footer>

</div>

<!-- Scripts -->
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>

<script>
    const productUpdated = () => {
        const pwConfirm = document.getElementById("pwConfirm").value;
        const pwDB = '${productUpdate.productPw}';
        if (pwConfirm == pwDB) {
            updateForm.submit();
        } else {
            alert("비밀번호가 일치하지 않습니다.");
        }
    }
</script>

</html>
