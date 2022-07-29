<%--
  Created by IntelliJ IDEA.
  User: khc_9
  Date: 2022-07-28
  Time: 오전 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li><a href="/board/paging">문의하기</a></li>
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
                        <!-- 상품루프 -->
                        <ul class="fb__items listType4">
                            <div>
                                <div class="item__info">
                                    <!-- 상품 한개 -->
                                    <table>
                                        <tr>
                                            <td>
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013443" class="item__link"
                                                       data-fatid="0000013443">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <div class="item__badge"></div>
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b1.jpg" height="300" width="300"
                                                                 alt="[7월기간한정]계란(특란/국내산) 30구">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013443">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월기간한정]계란(특란/국내산) 30구</strong>


                                                            <!-- 상품가격 -->
                                                            <div class="item__price">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>8,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>38</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>5,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013438" class="item__link"
                                                       data-fatid="0000013438">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <div class="item__badge"></div>
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b2.jpg" height="300" width="300"
                                                                 alt="[7월특가]햇양파(국내산) 15kg">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013438">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가]햇양파(국내산) 15kg</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>27,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>26</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>20,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                            <td>
                                                <!-- 상품 한개 -->
                                                <li class="item__box">
                                                    <!-- 상품링크 -->
                                                    <a href="/shop/goodsView/0000013416" class="item__link"
                                                       data-fatid="0000013416">
                                                        <!-- 상품 상단 -->
                                                        <figure class="item__thumb">
                                                            <!-- 상품 뱃지는 커스텀영역이기 때문에 고개사에 따라 작업 -->
                                                            <!-- 상품 이미지 -->
                                                            <img src="\resources\images/b3.jpg" height="300" width="300"
                                                                 alt="[7월특가](트루델)콩식용유 18L">

                                                            <button type="button" class="item__wish "
                                                                    data-devwishbtn="0000013416">찜버튼
                                                            </button>
                                                        </figure>

                                                        <!-- 상품정보 -->
                                                        <div class="item__info">
                                                            <!-- 브랜드 -->
                                                            <%--                                                        <span class="item__brand">금천식자재마트</span>--%>

                                                            <!-- 상품명 -->
                                                            <strong class="item__name">[7월특가](트루델)콩식용유 18L</strong>

                                                            <!-- 상품가격 -->
                                                            <div class="item__price clearfix">

                                                                <!-- 원가 -->
                                                                <strong class="item__price--strike"><em>65,000</em>원</strong>
                                                                <!-- 할인율 -->
                                                                <strong class="item__price--perc"><em>15</em>%</strong><br>

                                                                <!-- 판매가 -->
                                                                <strong class="item__price--current"><em>55,000</em>원</strong>
                                                            </div>

                                                            <!-- 상품 뱃지 -->
                                                            <div class="item__badge">
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/67.gif'>
                                                                <img src='https://www.oniljang.com/data/enterprise_data/images/icon/64.gif'>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </li>
                                            </td>
                                        </tr>
                                    </table>
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
