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
.icon:hover {
	background-color: #aaaaaa;
	text-decoration: none;
}

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
</style>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript" src="script/user.js"></script>
<link rel="stylesheet" href="css/main.css">
<style>
.input-group input-group-lg {
	width: 300px;
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
						<li class="nav-item"><a class="nav-link"
							href="mypage?menu=main"><i class="fas fa-user"></i>  &nbsp;${loginUser.userid }
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
		<hr>
		<br> <br>
		<div align="center">
			<form name="frm" method="post" action="">
				<table>
					<tr>
						<td colspan="2">
							<div class="form-group">
								<label for="userid">아이디</label> <input type="text"
									class="form-control" id="userid" name="userid">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="form-group">
								<label for="pwd">비밀번호</label> <input type="password"
									class="form-control" id="pwd" name="pwd">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><c:if test="${message != null }">
								<p style="color: red">${message }</p>
							</c:if>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="2"><input type="button" style="width: 300px"
							class="btn btn-outline-primary" onclick="go_login()" value="로그인"></td>
					</tr>
					<tr>
						<td colspan="2">&nbsp;</td>
					</tr>
					<tr>
						<td><a href="find_id_pwd?find=id">아이디 </a>/<a
							href="find_id_pwd?find=pwd"> 비밀번호 찾기</a></td>
						<td><a href="join">회원가입</a></td>
					</tr>
				</table>
			</form>
		</div>

		<%@ include file="../footer.jsp"%>