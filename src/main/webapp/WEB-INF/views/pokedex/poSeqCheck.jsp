<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
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
</style>

<title>Insert title here</title>
<script type="text/javascript" src="script/pokedex.js"></script>
<script>
	function go_check() {
		if (document.frm.seq.value == "") {
			alert("번호를 입력하세요.");
			return false;
		}

		if (!document.frm.anotherForm.checked) {
			document.frm.formName.value = "";
		}

		document.frm.submit();
	}
</script>
</head>
<body>
	<h1>포켓몬 번호 중복확인</h1>
	<hr>
	<form name="frm" method="post" action="po_seq_check">
		<input type="hidden" name="po_seq" value="${po_seq }">
		<table>
			<tr>
				<th><label for="seq">번호</label></th>
				<td><input type="text" class="form-control form-control-sm"
					id="seq" name="seq" value="${seq }"
					onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td>
				<td><button type="button" class="btn btn-light btn-sm"
						onclick="go_check()">중복체크</button></td>
				<td><div class="custom-control custom-checkbox">
						<input type="checkbox" value="1" class="custom-control-input"
							name="anotherForm" id="anotherForm" ${anotherForm }> <label
							class="custom-control-label" for="anotherForm"> <i
							class="far fa-question-circle"></i> 폼
						</label>
					</div></td>
				<td><input type="text" class="form-control form-control-sm"
					id="formName" name="formName" value="${formName }"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<c:if test="${message eq '1' }">
				<tr>
					<td colspan="2">&emsp;${po_seq } 는 사용할 수 있는 번호입니다.</td>
					<td><input type="button" onclick="seq_ok()"
						class="btn btn-primary btn-sm" value="사용하기"></td>
				</tr>
			</c:if>
			<c:if test="${message eq '0' }">
				<td colspan="3">&emsp;${po_seq } 는 이미 사용중인 번호입니다.</td>
			</c:if>
		</table>
	</form>
</body>
</html>