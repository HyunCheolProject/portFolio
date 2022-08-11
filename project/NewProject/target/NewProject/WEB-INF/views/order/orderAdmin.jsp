<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-08-10
  Time: 오후 6:40
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
            <a href="/order/adminFindAll">주문목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="javascript:history.back()">뒤로가기</a><br><br>
            <header class="major">
                <h2>주문목록</h2>
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
                            <c:if test="${sessionScope.memberId == 'khc4572'}">
                                <td style="color: black"><b></b></td>
                            </c:if>
                            <td style="color: black"><b>주문일시</b></td>
                            <c:if test="${sessionScope.memberId == 'khc4572'}">
                                <td style="color: black"><b>삭제</b></td>
                            </c:if>
                        </tr>
                        <c:forEach items="${orderAdminList}" var="orderAdmin">
                            <form action="/order/update" method="post">
                                <tr class="align-center">
                                    <td style="color: black"><b><input type="hidden" name="id" value="${orderAdmin.id}"></b>
                                    </td>
                                    <td style="color: black"><b>${orderAdmin.orderName}</b></td>
                                    <td style="color: black"><b>${orderAdmin.orderProduct}</b></td>
                                    <td style="color: black"><b>${orderAdmin.orderAmount}</b></td>
                                    <td style="color: black" class="align-center"><b
                                            id="statusResult1">${orderAdmin.orderStatus}</b></td>
                                    <c:if test="${sessionScope.memberId == 'khc4572'}">
                                        <td style="color: black"><b><select name="orderStatus" class="align-center"
                                                                            id="statusResult2"
                                                                            onchange="statusUpdate2()"
                                                                            style="width: 210px">
                                            <option value="주문접수">주문접수</option>
                                            <option value="배송준비중">배송준비중</option>
                                            <option value="배송중">배송중</option>
                                            <option value="배송완료">배송완료</option>
                                        </select><br>
                                            <button type="submit">수정</button>
                                        </b></td>
                                    </c:if>
                                        <%--                                    <td style="color: black"><b>--%>
                                        <%--                                        <button>수정</button>--%>
                                        <%--                                    </b></td>--%>


                                    <td style="color: black"><b><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                                value="${orderAdmin.orderCreatedDate}"></fmt:formatDate></b>
                                    </td>
                                    <c:if test="${sessionScope.memberId == 'khc4572'}">
                                        <td style="color: black"><b><a href="/order/delete?id=${orderAdmin.id}">삭제</a></b>
                                        </td>
                                    </c:if>
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
