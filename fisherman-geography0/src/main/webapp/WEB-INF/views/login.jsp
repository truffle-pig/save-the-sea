<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE HTML>
<html>

<head lang="ko">
<title>어부지리</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/res/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="/res/assets/css/noscript.css" />
</noscript>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- logo -->
		<div id="logo">
			<img src="/res/images/logo_no_bg.png" alt="logo">
		</div>
		<!-- Main -->
		<section id="main">
			<header>
				<!-- 여기에 유저 사진을 입력 기본은 따로, -->
				<span class="avatar"><img src="/profileImageDisplay?id=${loginUser.userId}"
					alt="user_profile_image" width="20%" /></span>
				<h2>${loginUser.name}</h2>
			</header>
			<footer>
				<ul class="icons">
					<li><a href="/recommend"><img
							src="/res/images/recommended.png" alt=""></a>Today's pick</li>
					<li><a href="/classification"><img
							src="/res/images/search.png" alt=""></a>Classification</li>
					<li><a href="/fishbowl"><img
							src="/res/images/fishing-net.png" alt=""></a>Fishbowl</li>
				</ul>
				
				<input type="button" value="LOGOUT" onclick="location.href='/logout'">
			</footer>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<ul class="copyright">
				<li>&copy;copyright &nbsp Data Campus Team Truffle</li>
			</ul>
		</footer>
	</div>

	<!-- Scripts -->
	<script>
		if ('addEventListener' in window) {
			window.addEventListener('load', function() {
				document.body.className = document.body.className.replace(
						/\bis-preload\b/, '');
			});
			document.body.className += (navigator.userAgent
					.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
		}
	</script>

</body>

</html>