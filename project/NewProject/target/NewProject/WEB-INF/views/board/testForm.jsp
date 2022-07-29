<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-28
  Time: 오전 10:57
  To change this template use File | Settings | File Templates.
--%>
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
            <li><a href="/">Home</a></li>
            <li><a href="/board/paging">식재료</a></li>
            <li><a href="/board/test">ㅇㅇㅇ</a></li>
            <li><a href="/board/paging">목록</a></li>
            <li><a href="/member/save-form" class="active">회원가입</a></li>
            <li><a href="/member/login-form">로그인</a></li>
            <li><a href="/board/save-form">글작성</a></li>
            <li><a href="/board/test-form">test2</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <div id="main">

        <!-- First Section -->
        <section id="first" class="main special">
            <header class="major">
                <h2>상품</h2>
            </header>

            <section>
                <header class="fb__main__header">
                    <%--                <div class="fb__main__header__wrap">--%>
                    <%--                    <h3 class="fb__title">이달의 특가</h3>--%>
                    <%--                </div>--%>
                    <nav class="fb__main__nav">
                        <a href="#goodsWhatsNew" data-group_code="1"
                           class="active devWhatsNewTab">쌀</a>
                        <a href="#goodsWhatsNew" data-group_code="2"
                           class=" devWhatsNewTab">육류</a>
                        <a href="#goodsWhatsNew" data-group_code="3"
                           class=" devWhatsNewTab">생선</a>
                        <a href="#goodsWhatsNew" data-group_code="4"
                           class=" devWhatsNewTab">채소</a>
                        <a href="#goodsWhatsNew" data-group_code="5"
                           class=" devWhatsNewTab">조미료</a>
                    </nav>
                </header>

                <div>
                    <div data-group_code="1">
                        <ul class="fb__items listType4">
                            <div>
                                <div class="item__info">
                                    <c:forEach items="${boardList}" var="board">
                                        <li style="display: flex; display: inline-block;margin-right: 100px;">
                                            <div class="board-id-wrap">
                                                <span class="board-id">${board.id}</span>
                                            </div>
                                            <div class="bord-id-wrap">
                                                <a href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a>
                                            </div>
                                            <div class="board-id-wrap">
                                                    ${board.boardWriter}
                                            </div>
                                            <div class="board-id-wrap">
                                                <fmt:formatDate pattern="yyyy-MM-dd"
                                                                value="${board.boardCreatedDate}"></fmt:formatDate>
                                            </div>
                                            <div class="board-id-wrap">
                                                    ${board.boardHits}
                                            </div>

                                        </li>
                                    </c:forEach>
                                </div>

                                <div class="container align-center">
                                    <ul class="pagination justify-content-center">
                                        <%-- c:choose c:when 등을 쓰려면 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 태그를 써야함 --%>
                                        <c:choose> <%-- else if문과 같음 --%>
                                            <%-- 현재 페이지가 1페이지면 이전 글자만 보여줌 --%>
                                            <c:when test="${paging.page<=1}">
                                                <li class="page-item disabled">
                                                    <a class="page-link">[이전]</a>
                                                </li>
                                            </c:when>
                                            <%-- 1페이지가 아닌 경우에는 [이전]을 클릭하면 현재페이지보다 1 작은 페이지 요청 --%>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link"
                                                       href="/board/paging?page=${paging.page-1}">[이전]</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
                                            <c:choose>
                                                <c:when test="${i eq paging.page}">
                                                    <li class="page-item active">
                                                        <a class="page-link">${i}</a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="page-item">
                                                        <a class="page-link" href="/board/paging?page=${i}">${i}</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:choose>
                                            <c:when test="${paging.page>=paging.maxPage}">
                                                <li class="page-item disabled">
                                                    <a class="page-link">[다음]</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item">
                                                    <a class="page-link"
                                                       href="/board/paging?page=${paging.page+1}">[다음]</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </ul>
                                </div>
                            </div>
                        </ul>
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
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery.scrollex.min.js"></script>
<script src="/resources/js/jquery.scrolly.min.js"></script>
<script src="/resources/js/browser.min.js"></script>
<script src="/resources/js/breakpoints.min.js"></script>
<script src="/resources/js/util.js"></script>
<script src="/resources/js/main.js"></script>

</body>

</html>
