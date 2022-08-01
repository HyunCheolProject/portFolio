<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-27
  Time: 오후 2:56
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
                <h2>상세페이지</h2>
            </header>

            <div class="container" style="line-height: 170%">
                제목: ${board.boardTitle}<br>
                작성자: ${board.boardWriter}<br>
                비밀번호: ${board.boardPw}<br>
                내용: ${board.boardContents}<br>
                작성일자: <fmt:formatDate pattern="yyyy-MM-dd" value="${board.boardCreatedDate}"></fmt:formatDate><br>
                조회수: ${board.boardHits}<br>

                <c:if test="${sessionScope.memberId eq board.boardWriter}"><button class="button big" onclick="boardUpdate()">수정</button></c:if>&nbsp;
                <c:if test="${sessionScope.memberId eq board.boardWriter or sessionScope.memberId == 'khc4572'}"><button class="button big" onclick="boardDelete()">삭제</button></c:if>&nbsp;

            </div>
            <br>
            <div class="container mb-5">

                <div class="input-group mb-3 card" id="comment-list">
                    <table class="table">
                        <tr>
                            <th>댓글번호</th>
                            <th>작성자</th>
                            <th>내용</th>
                            <th>작성시간</th>
                        </tr>
                        <c:forEach items="${commentList}" var="comment">
                            <tr>
                                <td><strong>${comment.id}</strong></td>
                                <td><strong>${comment.commentWriter}</strong></td>
                                <td><strong>${comment.commentContents}</strong></td>
                                <td><strong><fmt:formatDate pattern="yyyy-MM-dd"
                                                            value="${comment.commentCreatedDate}"></fmt:formatDate></strong>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
                <br>
                <div id="comment-write" class="input-group mb-3 card">
                    <div class="form-floating" style="text-align: left">
                        &nbsp;&nbsp;<strong for="commentWriter">작성자</strong>
                        <input type="text" id="commentWriter" class="form-control" placeholder="작성자">
                    </div>
                    <div class="form-floating" style="text-align: left">
                        &nbsp;&nbsp;<strong for="commentContents">내용</strong>
                        <textarea name="commentContents" id="commentContents" cols="10" rows="5"
                                  placeholder="내용"></textarea>
                    </div>
                    <br>
                    <button id="comment-write-btn" class="btn btn-primary">댓글작성</button>
                </div>
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
<script src="/resources/assets/js/browser.min.js"></script>
<script src="/resources/assets/js/breakpoints.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


</body>

<script>
    const boardUpdate = () => {
        location.href = "/board/update-form?id=${board.id}";
    }
    const boardDelete = () => {
        location.href = "/board/pwCheck?id=${board.id}";
    }

    $("#comment-write-btn").click(function () {

        const commentWriter = document.getElementById("commentWriter").value;
        const commentContents = $("#commentContents").val();
        const boardId = '${board.id}';
        $.ajax({
            type: "post",
            url: "/comment/save",
            data: {
                "commentWriter": commentWriter,
                "commentContents": commentContents,
                "boardId": boardId
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
                    output += "<td>" + result[i].commentWriter + "</td>";
                    output += "<td>" + result[i].commentContents + "</td>";
                    output += "<td>" + moment(result[i].commentCreatedDate).format("YYYY-MM-DD") + "</td>";
                    output += "</tr>";
                }
                output += "</table>";
                document.getElementById('comment-list').innerHTML = output;
                document.getElementById('commentWriter').value = '';
                document.getElementById('commentContents').value = '';
            },
            // error: function (result) {
            //     alert("어디가 틀렸을까");
            // }
        });
    });
</script>

</html>