<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-28
  Time: 오전 9:12
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
    <style>
        .card {
            margin: 100px; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
            border: 100px;
            padding: 30px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</head>
<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header" class="alt">
        <span class="logo"><img src="\resources\images/logo.svg" alt=""/></span>
        <h1>쿸팡</h1>
        <p>식재료 주문은 쿸팡에서!<br/>
            <a href="https://twitter.com/ajlkn">지금 바로 구경하세요!</a></p>
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
                <h2>주문/결제</h2>
            </header>

            <section>
                <form action="/member/save" method="post" enctype="multipart/form-data">
                    <div class="main; card">
                        <div class="style-a">
                            <div style="text-align: left">
                                <strong>구매자정보</strong><br>
                                <table style="color: black;">
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" style="width: 600px; display: inline"
                                                   value="${sessionScope.memberId}">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>배송주소</td>
                                        <td><input type="text" style="width: 300px; display: inline" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
                                            <input type="button" style="width: 200px; display: inline"
                                                   value="우편번호찾기"><br><br>
                                            <input type="text" style="width: 800px;" placeholder="주소"><br>
                                            <input type="text" style="width: 465px; display: inline" placeholder="상세주소">&nbsp;&nbsp;&nbsp;
                                            <input type="text" style="width: 320px; display: inline" placeholder="참고항목"></td>
                                    </tr>
                                    <tr>
                                        <td>연락처</td>
                                        <td><select id="memberMobile2" style="width: 130px; display: inline" onchange="mobileNumber2()" name = "memberMobile">
                                            <option value="KT">KT</option>
                                            <option value="SKT">SKT</option>
                                            <option value="LG">LG</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                            <select id="memberMobile3" style="width: 130px; display: inline" onchange="mobileNumber3()" name = "memberMobile">
                                                <option value="010">010</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>&nbsp;&nbsp;&nbsp;
                                            -&nbsp;&nbsp;&nbsp;
                                            <input type="text" style="width: 280px; display: inline" onblur="mobileNumber()" id="memberMobile" name="memberMobile" class="from-control"  placeholder="휴대폰번호입력('-'포함)">
                                        </td>
                                    </tr>
                                </table>
                                <div style="text-align: left">
                                    <strong>결제정보</strong>
                                </div>
                                <table style="color: black">
                                    <tr>
                                        <td>상품명</td>
                                        <td><input type="text"></td>
                                    </tr>
                                    <tr>
                                        <td>수량</td>
                                        <td><input type="text" style="width: 70px; display: inline">&nbsp;&nbsp;&nbsp;개</td>
                                    </tr>
                                    <tr>
                                        <td>가격</td>
                                        <td><input type="text" style="width: 200px; display: inline">&nbsp;&nbsp;&nbsp;원</td>
                                    </tr>
                                    <%--                                    <tr>--%>
                                    <%--                                        <td>결제</td>--%>
                                    <%--                                        <td><a href="" class="button">결제하기</a></td>--%>
                                    <%--                                    </tr>--%>
                                </table>
                            </div>
                            <a href="" class="button">결제하기</a>
                        </div>
                        <br>

                    </div>
                </form>
            </section>
        </section>
    </div>

</div>
</section>
</section>

</div>

<!-- Footer -->
<footer id="footer">
    <section>
        <h2>Aliquam sed mauris</h2>
        <p>Sed lorem ipsum dolor sit amet et nullam consequat feugiat consequat magna adipiscing tempus etiam dolore
            veroeros. eget dapibus mauris. Cras aliquet, nisl ut viverra sollicitudin, ligula erat egestas velit,
            vitae tincidunt odio.</p>
        <ul class="actions">
            <li><a href="generic.html" class="button">Learn More</a></li>
        </ul>
    </section>
    <section>
        <h2>Etiam feugiat</h2>
        <dl class="alt">
            <dt>Address</dt>
            <dd>1234 Somewhere Road &bull; Nashville, TN 00000 &bull; USA</dd>
            <dt>Phone</dt>
            <dd>(000) 000-0000 x 0000</dd>
            <dt>Email</dt>
            <dd><a href="#">information@untitled.tld</a></dd>
        </dl>
        <ul class="icons">
            <li><a href="#" class="icon brands fa-twitter alt"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon brands fa-facebook-f alt"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon brands fa-instagram alt"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon brands fa-github alt"><span class="label">GitHub</span></a></li>
            <li><a href="#" class="icon brands fa-dribbble alt"><span class="label">Dribbble</span></a></li>
        </ul>
    </section>
    <p class="copyright">&copy; Untitled. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>

</div>

<!-- Scripts -->
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>

</html>