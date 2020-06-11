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
	function onlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			return false;
	}

	function removeChar(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
			return;
		else
			event.target.value = event.target.value.replace(/[^0-9]/g, "");
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
		<div align="center">
			<hr>
			<br>
			<h3>회원가입</h3>
			<br>
			<hr>
			<form name="frm" method="post" action="">
				<div class="form-group">
					<table>
						<tr>
							<th><label for="userid">아이디</label></th>
							<td><input type="text" class="form-control form-control-sm"
								id="userid" name="userid"></td>
							<td><input type="button" class="btn btn-light btn-sm"
								onclick="id_check()" value="중복체크"> <input type="hidden"
								name="idCheck" value=""></td>
						</tr>
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password"
								class="form-control form-control-sm" id="pwd" name="pwd">

							</td>
							<td></td>
						</tr>
						<tr>
							<th><label for="pwdCheck">비밀번호 확인</label></th>
							<td><input type="password"
								class="form-control form-control-sm" id="pwdCheck"
								name="pwdCheck"></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th><label for="name">이름</label></th>
							<td><input type="text" class="form-control form-control-sm"
								id="name" name="name"></td>
							<td></td>
						</tr>
						<tr>
							<th><label for="birth">생년월일</label></th>
							<td><input type="text" class="form-control form-control-sm"
								id="birth" name="birth" placeholder="ex)20200101"></td>
							<td></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><div
									class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" id="male"
										name="gender" value="1"> <label
										class="custom-control-label" for="male">남자</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" id="female"
										name="gender" value="2"> <label
										class="custom-control-label" for="female">여자</label>
								</div></td>
							<td></td>
						</tr>
						<tr>
							<th>전화번호<input type="hidden" name="phone"></th>
							<td><div class="form-row">
									<div class="col-3">
										<select name="phone1" class="form-control form-control-sm"
											id="validationCustom04" required>
											<option value="010">010</option>
											<option value="011">011</option>
										</select>
									</div>
									<div class="col-3">
										<input type="text" name="phone2"
											onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' maxlength="4"
											class="form-control form-control-sm" id="validationCustom03"
											required>
									</div>
									<div class="col-md-3 mb-3">
										<input type="text" name="phone3"
											onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' maxlength="4"
											class="form-control form-control-sm" id="validationCustom05"
											required>
									</div>
								</div></td>
							<td></td>
						</tr>
						<tr>
							<th><label for="email"></label> 이메일</th>
							<td><input type="text" name="email" id="email"
								class="form-control form-control-sm"
								id="exampleFormControlInput1" placeholder="name@example.com"></td>
							<td></td>
						</tr>
						<tr>
							<th>주소<input type="hidden" name="address"></th>
							<td>
								<div class="form-inline">
									<input type="text" class="form-control form-control-sm"
										id="zip_num" name="zip_num" readonly="readonly">
									&nbsp;&nbsp;
									<button type="button" onclick="find_zip_num()"
										class="btn btn-light btn-sm">주소찾기</button>
								</div> <input type="text" class="form-control form-control-sm"
								id="addr1" name="addr1" readonly="readonly"> <input
								type="text" class="form-control form-control-sm" id="addr2"
								name="addr2">
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<th colspan="3" style="text-align: center">이용 약관</th>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3"><textarea class="form-control" rows="15"
									cols="100" style="resize: none" readonly="readonly">
								<%@include file="terms_of_service.jsp"%>								
								</textarea></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center"><div
									class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" id="yes"
										name="contract" value="yes"> <label
										class="custom-control-label" for="yes">동의함</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" class="custom-control-input" id="no"
										name="contract" value="no"> <label
										class="custom-control-label" for="no">동의하지않음</label>
								</div></td>
						</tr>
						<tr>
							<td colspan="3">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center"><button
									type="button" class="btn btn-primary btn-lg"
									onclick="go_join()">회원가입</button>
								<button type="button" class="btn btn-secondary btn-lg"
									onclick="location.href='index'">돌아가기</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

		<%@ include file="../footer.jsp"%>