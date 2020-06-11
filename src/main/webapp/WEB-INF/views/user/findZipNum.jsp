<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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

#thisWrap {
	width: 450px;
	margin: 0 auto 0 auto;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<script type="text/javascript" src="script/user.js"></script>
<script type="text/javascript">
	function result(zip_num, sido, gugun, dong) {
		opener.document.frm.zip_num.value = zip_num;
		opener.document.frm.addr1.value = sido + " " + gugun + " " + dong;
		self.close();
	};
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="thisWrap">
		<h1>우편 번호 찾기</h1>
		<hr>

		<form method="post" name="frm" action="find_zip_num"
			class="form-inline" style="width: 80%; margin: 0 auto 0 auto">
			<div class="form-group mb-2">
				<i class="fas fa-search"></i>
			</div>
			<div class="form-group mx-sm-3 mb-2">
				<input type="text" class="form-control" name="dong"
					placeholder="동이름 검색 ex)신월동">
			</div>
			<button type="submit" class="btn btn-info mb-2">찾기</button>
		</form>

		<table class="table table-sm">
			<thead>
				<tr align="center">
					<th width="150">우편번호</th>
					<th>주소</th>
				</tr>
			</thead>
			<c:forEach items="${addressList}" var="addressVO">
				<tr>
					<td align="center">${addressVO.zip_num}</td>
					<td><a href="#"
						onclick="return result('${addressVO.zip_num}'
,'${addressVO.sido}', '${addressVO.gugun}','${addressVO.dong}')">
							${addressVO.sido} ${addressVO.gugun} ${addressVO.dong}
							${addressVO.bunji } </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>