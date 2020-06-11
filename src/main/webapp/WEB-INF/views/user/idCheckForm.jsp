<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript" src="script/user.js"></script>

<title>Insert title here</title>
</head>
<body>
	<h1>아이디 중복확인</h1>
	<hr>
	<form name="frm" method="post" action="id_check">
		<table>
			<tr>
				<th><label for="userid">아이디</label></th>
				<td><input type="text" class="form-control form-control-sm"
					id="userid" name="userid" value="${userid }"></td>
				<td><input type="submit" class="btn btn-light btn-sm"
					value="중복체크"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<c:if test="${message == 1 }">
				<tr>
					<td colspan="2">사용할 수 있는 아이디입니다.</td>
					<td><input type="button" onclick="id_ok()"
						class="btn btn-primary btn-sm" value="사용하기" onclick="id_ok()"></td>
				</tr>
			</c:if>
			<c:if test="${message == 0 }">
				<td colspan="3">사용할 수 없는 아이디입니다.</td>
			</c:if>
		</table>
	</form>
</body>
</html>