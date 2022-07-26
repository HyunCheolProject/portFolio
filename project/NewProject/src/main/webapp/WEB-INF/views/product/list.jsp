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
        input[type=text] {
            width: 400px;
            margin: auto;
        }

        .submitType {
            width: 150px;
            margin: auto;
        }

        .searchType {
            width: 200px;
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
                <h2>상품</h2>
            </header>

            <section>
                <header class="fb__main__header">
                    <form action="/product/search" method="get">
                        <div class="input-group">
                            <select class="searchType form-control" name="searchType" style="display: inline">
                                <option value="productName">상품이름</option>
                                <option value="productCategory">상품종류</option>
                            </select>
                            <input class="form-control" type="text" name="q" placeholder="검색어입력.."
                                   style="display: inline" autofocus>
                            <input class="form-control submitType" type="submit" value="검색" style="display: inline">
                        </div>
                    </form>
                </header>

                <div>
                    <div data-group_code="1">
                        <ul class="fb__items listType4">
                            <div>
                                <div class="item__info">
                                    <c:forEach items="${productList}" var="product">
                                        <li style="display: flex; display: inline-block;margin-right: 100px;">
                                            <div>
                                                <a href="/product/detail?page=${paging.page}&id=${product.id}"><img
                                                        src="${pageContext.request.contextPath}/upload/${product.productFileName}"
                                                        alt="" height="250" width="250"></a>
                                            </div>
                                            <div class="product-id-wrap">
                                                <a href="/product/detail?page=${paging.page}&id=${product.id}">${product.productName}</a>
                                            </div>
                                            <div class="product-id-wrap">
                                                <strong><fmt:formatNumber type="number"
                                                                          value="${product.productPrice}"/>원</strong>
                                            </div>
                                        </li>
                                    </c:forEach>
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

</html>

