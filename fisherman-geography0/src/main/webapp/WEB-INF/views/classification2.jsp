<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head lang="ko">
<title>어부지리</title>

<style type="text/css">
.loading {
	display: none;
	position: absolute;
	top: -4px;
	left: 0;
	z-index: 99;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.loading strong {
	display: block;
	position: relative;
	top: 50%;
	margin: -75px auto 0 auto;
	width: 200px;
	height: 50px;
	padding: 0 30px;
	border-radius: 10px;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	box-sizing: border-box;
	background: #fff;
	color: #000;
	font-size: 16px;
	line-height: 50px;
	text-align: center;
}
</style>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/res/assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>

</head>

<body class="is-preload">

	<div id="wrap">
		<!-- logo -->
		<header>
			<div id="content-logo">
				<a href="/main"><img
					src="/res/images/logo_no_bg.png" alt="logo"></a>
			</div>
			<div id="rank">
				<p>
				<ul>${loginUser.name}님환영합니다!|
				</ul>
				<c:if test="${loginUser != NULL }">
					<ul>
						<input type="button" value="LOGOUT"
							onclick="location.href='/logout'">
					</ul>
				</c:if>
				</p>
			</div>
		</header>
		<div>
			<div class="fish_info">
				<div class="fish_data">
					<img src="/fishImageDisplay?imageId=${imageId}" alt="your_fish">
					<h1>Prediction:${prediction}</h1>
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

				</div>
			</div>
		</div>
		<div class="loading">

			<strong>분석중입니다!</strong>

		</div>

	</div>
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {

			$('.loading').show();

		});

		$(window).on('load', function() {

			$('.loading').hide();

		});
	</script>

</body>

</html>