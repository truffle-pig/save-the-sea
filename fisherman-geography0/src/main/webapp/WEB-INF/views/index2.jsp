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
		<link rel="stylesheet" href="/res/assets/css/noscript.css" /></noscript>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- logo -->
		<div id="login-logo"> 
			<img src="/res/images/logo_no_bg.png" alt="logo">
		</div>
		<!-- Main -->
		<header>
			<div id="kakao">
			<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=a3f9cdf6ff350244d4e4e19401521bfd&redirect_uri=http://localhost:8080/login&response_type=code">
			<img src="/res/img/yellow_login_kakao.png">
		</a>
		</div>
        </header>

		<!-- Footer -->
		<footer id="footer">
			<ul class="copyright">
				<li> &copy;copyright &nbsp Data Campus Team Truffle</li>
			</ul>
		</footer>
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