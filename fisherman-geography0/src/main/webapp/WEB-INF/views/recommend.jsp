<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat"%>
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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
	$(".hover").mouseleave(function() {
		$(this).removeClass("hover");
	});
</script>
</head>

<body class="is-preload">

	<%
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일 E요일");
		String today = sdf.format(now);
	%>


	<div id="wrap">
		<!-- logo -->
		<header>
			<div id="content-logo">
				<a href="/login" target="_self"><img
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
		<div class="recomend">

			<span class="selector"> <%=today%>
			</span>
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

</body>

</html>