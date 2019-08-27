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
				<a href="main" target="_self"><img
					src="/res/images/logo_no_bg.png" alt="logo"></a>
			</div>
			<div id="rank">
				<p>${ user.name }
					Welcome! | <input type="button" value="LOGOUT"
						onclick="location.href='/logout'">
				</p>
				<p>User Rank : 1 / User Point : ${ user.point }</p>
			</div>
		</header>
		<span id="content-title"><p>User's Fishbowl</p></span>
		<div id="pot_frame">
			<div class="my_fish">
				<figure class="snip1273">
					<img src="/res/images/default_fish.jpg" alt="Default_img" />
					<figcaption>
						<h3>Fish Name</h3>
						<p>Date :</p>
						<p>Point :</p>
						<p>Spec :</p>
						<hr>
						<form method="get">
							<button type="button" onclick="window.location.href='/point'">
								<i class="fas fa-map-marked-alt"></i>
							</button>
						</form>
					</figcaption>
				</figure>
			</div>
			<div class="my_fish">
				<figure class="snip1273">
					<img src="/res/images/default_fish.jpg" alt="Default_img" />
					<figcaption>
						<h3>Fish Name</h3>
						<p>Date :</p>
						<p>Point :</p>
						<p>Spec :</p>
						<hr>
						<form method="get">
							<button type="button" onclick="window.location.href='/point'">
								<i class="fas fa-map-marked-alt"></i>
							</button>
						</form>
					</figcaption>
				</figure>
			</div>
			<div class="my_fish">
				<figure class="snip1273">
					<img src="/res/images/default_fish.jpg" alt="Default_img" />
					<figcaption>
						<h3>Fish Name</h3>
						<p>Date :</p>
						<p>Point :</p>
						<p>Spec :</p>
						<hr>
						<form method="get">
							<button type="button" onclick="window.location.href='/point'">
								<i class="fas fa-map-marked-alt"></i>
							</button>
						</form>
					</figcaption>
				</figure>
			</div>
			<div id="page_btn">
				<form>
					<button type="button">
						<i class="fas fa-caret-left"></i>
					</button>
					page_num
					<button type="button">
						<i class="fas fa-caret-right"></i>
					</button>
				</form>
			</div>
			<div id="all_maps">
				<form method="get">
					<button type="button" onclick="window.location.href='/point'">
						<i class="fas fa-map-marker-alt"></i>
					</button>
				</form>
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