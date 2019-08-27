<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<a href="/main" target="_self"><img
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
		<div class="open_file">
			<form action="/fileUpload" id="fileUpload" name="fileUpload"
				method="post" enctype="multipart/form-data">

				파일 : <input type="file" name="file"><br> <input
					type="submit" name="업로드" value="제출"><br>
			</form>
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