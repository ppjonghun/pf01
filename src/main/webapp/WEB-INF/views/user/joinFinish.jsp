<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
body.menu-show {
	overflow: hidden;
	position: fixed;
	height: 100%;
	width: 100%;
}

* {
	line-height: 1.5;
	font-weight: 400;
	color: #000000;
	font-family: 'Jua', "Poppins", Arial, sans-serif;
}
.icon:hover {
	background-color: #aaaaaa;
	text-decoration: none;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript" src="script/user.js"></script>
<script type="text/javascript">
	function index_go() {
		document.frm.action = "index";
		document.frm.submit();
	}
	function login_go() {
		document.frm.action = "login";
		document.frm.submit();
	}
</script>
<link rel="stylesheet" href="css/main.css">
<style>
.form-group {
	padding: 0;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div id="top_nav">
		<nav style="background-color: #EFEFEF">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="index"><i class="fas fa-home"></i></a></li>
				<c:choose>
					<c:when test="${loginUser == null }">
						<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="mypage"><i class="fas fa-user"></i> &nbsp;${loginUser.userid }
						</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
	<div id="wrap">
		<header>
			<div class="clear"></div>
			<div id="logo">
				<img src="images/P_logo.png" width="300px" height="auto">
			</div>
		</header>
		<div align="center">
			<hr>
			<br>
			<h3>회원가입 완료</h3>
			<br>
			<hr>
			<div style="width: 80%">
				<form method="get" name="frm">
					<button onclick="index_go()" type="button"
						class="btn btn-primary btn-lg btn-block">메인화면으로 이동</button>
					<button onclick="login_go()" type="button"
						class="btn btn-secondary btn-lg btn-block">로그인</button>
				</form>
			</div>
		</div>

		<%@ include file="../footer.jsp"%>