<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head lang="ko">
    <title>어부지리</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/res/assets/css/main.css" />
    <noscript>
        <link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script>
        $(".hover").mouseleave(
            function () {
                $(this).removeClass("hover");
            }
        );
    </script>
</head>

<body class="is-preload">

    <div id="wrap">
        <!-- logo -->
        <header>
            <div id="content-logo">
                <a href="/login" target="_self"><img src="/res/images/logo_no_bg.png" alt="logo"></a>
            </div>
            <div id="rank">
                <p>User ID Welcome! | Logout</p>
            </div>
        </header>
        <div class="open_file">
            <input type="file" id="get_img">
        </div>
        <div class="fish_info">
            <div class="fish_data">
                <h1>이름</h1>
                <p>Contents</p>
                <h1>금지 기간&길이</h1>
                <p>Contents</p>
                <h1>분포</h1>
                <p>Contents</p>
                <h1>서식지</h1>
                <p>Contents</p>
                <h1>형태</h1>
                <p>Contents</p>
                <h1>산란</h1>
                <p>Contents</p>
                <h1>성장</h1>
                <p>Contents</p>
                <h1>회유</h1>
                <p>Contents</p>
                <h1>먹이</h1>
                <p>Contents</p>
                <h1>체색</h1>
                <p>Contents</p>
                <img src="/res/images/avatar.jpg" alt="your_fish">
            </div>

        </div>
    </div>




    <!-- Scripts -->
    <script>
        if ('addEventListener' in window) {
            window.addEventListener('load', function () { document.body.className = document.body.className.replace(/\bis-preload\b/, ''); });
            document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
        }
    </script>

</body>

</html>