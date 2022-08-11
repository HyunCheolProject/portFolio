<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-08-06
  Time: 오후 2:18
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
                <form action="/order/save" name="orderForm" method="post">
                    <div class="main; card">
                        <div class="style-a">
                            <div style="text-align: left">
                                <strong>구매자정보</strong><br>
                                <table style="color: black;">
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" name="orderName" style="width: 600px; display: inline"
                                                   value="${sessionScope.memberId}" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>배송주소</td>
                                        <td><input type="text" name="postcode" id="postcode"
                                                   style="width: 300px; display: inline"
                                                   placeholder="우편번호" readonly>&nbsp;&nbsp;&nbsp;
                                            <input type="button" onclick="findPostcode()"
                                                   style="width: 200px; display: inline"
                                                   value="우편번호찾기"><br><br>
                                            <input type="text" name="address" id="address" style="width: 800px;"
                                                   placeholder="주소" readonly><br>
                                            <input type="text" name="detailAddress" id="detailAddress"
                                                   style="width: 465px; display: inline" placeholder="상세주소">&nbsp;&nbsp;&nbsp;
                                            <input type="text" name="extraAddress" id="extraAddress"
                                                   style="width: 320px; display: inline" placeholder="참고사항"></td>
                                        <br>

                                    </tr>
                                    <tr>
                                        <td>요청사항</td>
                                        <td>
                                            <input type="text" name="requests" id="requests1Result"
                                                   style="width: 350px; display: inline" onblur="requests1()"
                                                   placeholder="요청사항">
                                            <select id="requests2Result"
                                                    style="width: 350px; display: inline"
                                                    onchange="requests2()">
                                                <option value="배송 시 전화바랍니다.">배송 시 전화바랍니다.</option>
                                                <option value="문 앞에 놓아주세요.">문 앞에 놓아주세요.</option>
                                                <option value="경비실에 맡겨주세요.">경비실에 맡겨주세요.</option>
                                                <option value="직접입력">직접입력</option>
                                            </select>
                                    </tr>
                                    <tr>
                                        <td>연락처</td>
                                        <td><select style="width: 130px; display: inline" name="orderMobile">
                                            <option value="KT">KT</option>
                                            <option value="SKT">SKT</option>
                                            <option value="LG">LG</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                            <select style="width: 130px; display: inline" name="orderMobile">
                                                <option value="010">010</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                            </select>&nbsp;&nbsp;&nbsp;
                                            -&nbsp;&nbsp;&nbsp;
                                            <input type="text" style="width: 280px; display: inline" name="orderMobile"
                                                   class="from-control" placeholder="휴대폰번호입력('-'포함)">
                                        </td>
                                    </tr>
                                </table>
                                <div style="text-align: left">
                                    <strong>결제정보</strong>
                                </div>

                                <table style="color: black">
                                    <input type="hidden" name="cartId" value="${cart.id}">
                                    <input type="hidden" name="productId" value="${cart.productId}">
                                    <tr>
                                        <td>상품명</td>
                                        <td><input type="text" name="orderProduct" value="${cart.cartProduct}" readonly>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>수량</td>
                                        <td><input type="text" name="orderAmount" value="${cart.cartAmount}"
                                                   style="width: 70px; display: inline" readonly>&nbsp;&nbsp;&nbsp;개
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>가격</td>
                                        <td><input type="text" name="orderPrice"
                                                   value="${cart.cartPrice * cart.cartAmount}"
                                        <%--                                                   value="<fmt:formatNumber type="number" value="${cart.cartPrice * cart.cartAmount}"/>"--%>
                                                   style="width: 200px; display: inline" readonly>
                                            &nbsp;&nbsp;&nbsp;원
                                        </td>
                                        <%--                                        <td style="color: black"><b><fmt:formatNumber type="number" value="${cart.cartPrice * cart.cartAmount}"/>&nbsp;원</b></td>--%>

                                    </tr>

                                </table>
                            </div>
                            <button type="button" class="btn btn-primary"
                                    onclick="pay('${cart.cartPrice * cart.cartAmount}')">결제하기
                            </button>
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

<%--결제기능--%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<%--주소 api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

    function findPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;

                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }

    function requests1() {
        const requests1 = document.getElementById("requests1Result").value;
    }

    function requests2() {
        const requests2 = document.getElementById("requests2Result").value;
        const requests1 = document.getElementById("requests1Result");
        requests1.value = requests2;
    }

    const pay = (productPrice) => {
        var IMP = window.IMP;
        IMP.init('imp62204713');
        IMP.request_pay({
            pg: "kakaopay",
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: '결제',
            amount: productPrice,
            buyer_email: '${sessionScope.loginMemberEmail}',
            buyer_name: '${sessionScope.loginMemberName}',
            buyer_tel: '${sessionScope.loginMemberMobile}',
            // buyer_addr: '구매자 주소',
            // buyer_postcode: '구매자 주소',
            // m_redirect_url: ''
        }, function (rsp) {
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                alert(msg);
                orderForm.submit();
            } else {
                var msg = '결제에 실패하였습니다.';
                alert(msg);
            }
        });
    }
</script>

</body>

</html>