<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-29
  Time: 오전 10:27
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
            max-width: 800px;
            margin: 0 auto; /* Added */
            float: none; /* Added */
            margin-bottom: 10px; /* Added */
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }

        input[type=text] {
            width: 700px;
            margin: auto;
        }

        textarea {
            margin: auto;
            width: 700px;
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

                <div class="container">
                    <img src="${pageContext.request.contextPath}/upload/${product.productFileName}"
                         alt="" height="300" width="300"><br>
                    상품번호: ${product.id}<br>
                    작성자: ${product.productWriter}<br>
                    상품명: ${product.productName}<br>
                    비밀번호: ${product.productPw}<br>
                    내용: ${product.productContents}<br>
                    작성일자:<fmt:formatDate pattern="yyyy-MM-dd" value="${product.productCreatedDate}"></fmt:formatDate><br>
                    조회수: ${product.productHits}<br>

                    <c:if test="${sessionScope.memberId eq 'khc4572'}"><button class="button big" onclick="productUpdate()">수정</button></c:if>
                    <c:if test="${sessionScope.memberId eq 'khc4572'}"><button class="button big" onclick="productDelete()">삭제</button></c:if>&nbsp;
                    <br>
                </div>
                <br>

                <div class="container mb-5">

                    <div class="input-group mb-3 card" id="review-list">
                        <strong>후기</strong>
                        <table class="table">
                            <tr>
                                <th>댓글번호</th>
                                <th>작성자</th>
                                <th>내용</th>
                                <th>작성시간</th>
                            </tr>
                            <c:forEach items="${reviewList}" var="review">
                                <tr>
                                    <td style="color: black"><b>${review.id}</b></td>
                                    <td style="color: black"><b>${review.reviewWriter}</b></td>
                                    <td style="color: black"><b>${review.reviewContents}</b></td>
                                    <td style="color: black"><strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                value="${review.reviewCreatedDate}"></fmt:formatDate></strong>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                    <br>
                    <c:if test="${sessionScope.memberId != null}">
                    <div id="review-write" class="input-group mb-3 card">
                        <div class="form-floating" style="text-align: left">
                            &nbsp;&nbsp;<strong for="reviewWriter">작성자</strong>
                            <input type="text" id="reviewWriter" class="form-control" value="${sessionScope.memberId}" readonly>
                        </div>
                        <div class="form-floating" style="text-align: left">
                            &nbsp;&nbsp;<strong for="reviewContents">내용</strong>
                            <textarea name="reviewContents" id="reviewContents" cols="10" rows="5"
                                      placeholder="내용"></textarea>
                        </div>
                        <br>
                        <button id="review-write-btn" class="btn btn-primary">후기작성</button>
                    </div>
                    </c:if>
                    <br>
                    <a href="javascript:history.back()">뒤로가기</a>

                </div>
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

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


</body>

<script>
    const productUpdate = () => {
        location.href = "/product/update-form?id=${product.id}";
    }
    const productDelete = () => {
        location.href = "/product/pwCheck?id=${product.id}";
    }
    $("#review-write-btn").click(function () {

        const reviewWriter = document.getElementById("reviewWriter").value;
        const reviewContents = $("#reviewContents").val();
        const productId = '${product.id}';
        $.ajax({
            type: "post",
            url: "/review/save",
            data: {
                "reviewWriter": reviewWriter,
                "reviewContents": reviewContents,
                "productId": productId
            },
            dataType: "json",
            success: function (result) {
                console.log(result);
                let output = "<table class='table'>";
                output += "<tr><th>댓글번호</th>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성시간</th></tr>";
                for (let i in result) {
                    output += "<tr>";
                    output += "<td>" + result[i].id + "</td>";
                    output += "<td>" + result[i].reviewWriter + "</td>";
                    output += "<td>" + result[i].reviewContents + "</td>";
                    output += "<td>" + moment(result[i].reviewCreatedDate).format("YYYY-MM-DD") + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('review-list').innerHTML = output;
                document.getElementById('reviewWriter').value = '';
                document.getElementById('reviewContents').value = '';
            },
            // error: function (result) {
            //     alert("어디가 틀렸을까");
            // }
        });
    });
</script>
</html>
