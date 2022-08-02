<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-28
  Time: 오전 9:12
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
                <h2>고객센터</h2>
            </header>

            <section>
                <header class="fb__main__header">

                </header>

                <div>
                    <div data-group_code="1">
                        <div class="container mt-3">

                            <table class="table" style="background-color: #d8bff7">
                                <tr>
                                    <th>
                                        <table>
                                            <tr>
                                                <form action="/board/search" size="10" method="get">
                                                    <th>
                                                    <td><select name="searchType">
                                                        <option value="boardTitle">제목</option>
                                                        <option value="boardWriter">작성자</option>
                                                        <option value="boardCategory">카테고리</option>
                                                    </select></td>
                                                    <td><input type="text" name="q" placeholder="검색어입력.." autofocus></td>
                                                    <td><input type="submit" value="검색"></td>
                                                    </th>
                                                </form>
                                                </th>
                                                <th></th>
                                                <th><c:if test="${sessionScope.memberId!=null}">
                                                    <button class="btn btn-primary" onclick="writeForm()">문의하기</button>
                                                </c:if></th>
                                            </tr>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일자</th>
                                                <th>조회수</th>
                                            </tr>

                                            <c:forEach items="${boardList}" var="board">
                                                <tr>
                                                    <td><strong>${board.id}</strong></td>
                                                    <td>
                                                        <strong><a
                                                                href="/board/detail?page=${paging.page}&id=${board.id}">${board.boardTitle}</a></strong>
                                                    </td>
                                                    <td><strong>${board.boardWriter}</strong></td>
                                                    <td><strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                                                value="${board.boardCreatedDate}"></fmt:formatDate></strong>
                                                    </td>
                                                    <td><strong>${board.boardHits}</strong></td>
                                                </tr>
                                            </c:forEach>
                                        </table>


                                        <ul>
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

                                                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}"
                                                               var="i" step="1">
                                                        <c:choose>
                                                            <c:when test="${i eq paging.page}">
                                                                <li class="page-item active">
                                                                    <a class="page-link">${i}</a>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li class="page-item">
                                                                    <a class="page-link"
                                                                       href="/board/paging?page=${i}">${i}</a>
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
                                        </ul>
                            </table>
                        </div>
                    </div>
                </div>
            </section>
        </section>
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
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>
<script src="/resources/assets/js/jquery.min.js"></script>
<script src="/resources/assets/js/jquery.scrollex.min.js"></script>
<script src="/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="/resources/assets/js/util.js"></script>
<script src="/resources/assets/js/main.js"></script>

</body>
<script>
    const writeForm = () => {
        location.href = "/board/save-form";
    }
</script>

</html>

