<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript" src="script/board.js"></script>
<link rel="stylesheet" href="css/main.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
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
</head>
<body>
	<div id="top_nav">
		<nav style="background-color: #EFEFEF">
			<ul class="nav justify-content-end">
				<li class="nav-item"><a class="nav-link active" href="index"><i
						class="fas fa-home"></i></a></li>
				<c:choose>
					<c:when test="${loginUser == null }">
						<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link"
							href="mypage?menu=main"><i class="fas fa-user"></i>
								&nbsp;${loginUser.userid } </a></li>
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
			<div class="clear"></div>
			<div style="margin: 20px;">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link" href="index">홈
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="pokedex_list">도감</a></li>
							<li class="nav-item"><a class="nav-link" href="board_list">게시판</a></li>
						</ul>
					</div>
				</nav>
				<hr>
			</div>
		</header>