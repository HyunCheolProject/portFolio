<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-08-08
  Time: 오후 1:31
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
            <a href="/member/detail">내 정보</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/cart/findAll">장바구니</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="/order/list">배송조회</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:history.back()">뒤로가기</a><br><br>
            <header class="major">
                <h2>배송조회</h2>
            </header>

            <section>
                <div class="container">
                    <table>
                        <tr class="align-center">
                            <%--                            <td style="color: black"><b>주문번호</b></td>--%>
                            <td></td>
                            <td style="color: black"><b>주문자</b></td>
                            <td style="color: black"><b>상품명</b></td>
                            <td style="color: black"><b>수량</b></td>
                            <td style="color: black"><b>배송상태</b></td>
                            <td style="color: black"><b>주문일시</b></td>
                        </tr>
                        <c:forEach items="${orderList}" var="order">
                            <form action="/order/update" method="post">
                                <tr class="align-center">
                                    <td style="color: black"><b><input type="hidden" name="id" value="${order.id}"></b>
                                    </td>
                                    <td style="color: black"><b>${order.orderName}</b></td>
                                    <td style="color: black"><b>${order.orderProduct}</b></td>
                                    <td style="color: black"><b>${order.orderAmount}</b></td>
                                    <td style="color: black" class="align-center"><b
                                            id="statusResult1">${order.orderStatus}</b></td>
                                    <td style="color: black"><b><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                                value="${order.orderCreatedDate}"></fmt:formatDate></b>
                                    </td>

                                </tr>
                            </form>
                        </c:forEach>
                    </table>
                </div>
            </section>

            <a href="javascript:history.back()">뒤로가기</a>

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
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>
<script>
    // const statusUpdate = (id) => {
    //     $.ajax({
    //         type: "post",
    //         url: "/order/status",
    //         data: {
    //             "id": id
    //         },
    //         dataType: "json",
    //         success: function (result) {
    //
    //         }
    //     })
    // }

    function statusUpdate2() {
        const statusUpdate2 = document.getElementById("statusResult2").value;
        const statusUpdate1 = document.getElementById("statusResult1");
        statusUpdate1.innerHTML = statusUpdate2;
    }
</script>
</html>
