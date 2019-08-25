<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${userId eq null}">
		<a
			href="https://kauth.kakao.com/oauth/authorize?client_id=a3f9cdf6ff350244d4e4e19401521bfd&redirect_uri=http://localhost:8080/login&response_type=code">
			<img src="/res/img/yellow_login_kakao.png">
		</a>
	</c:if>
	<c:if test="${userId ne null}">


		<h1>${userId}로그인 성공입니다</h1>
		<h2>${nickname}</h2>
		<h3>${profileImageURL}</h3>
		<h4>${loginUser.name}</h4>
		<a href="profile?id=${userId}">프로필</a>
		<input type="button" value="로그아웃" onclick="location.href='/logout'">
		<input type="button" value="탈퇴" onclick="location.href='/disconnect'">
	</c:if>
</body>
</html>
