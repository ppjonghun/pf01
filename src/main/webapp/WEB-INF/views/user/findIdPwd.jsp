<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
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
function find_id(){
	if(document.frm.name.value==""){
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}else if(document.frm.birth.value==""){
		alert("생년월일을 입력하세요.");
		document.frm.birth.focus();
		return false;
	}else if(document.frm.phone2.value==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone2.focus();
		return false;
	}else if(document.frm.phone3.value==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone3.focus();
		return false;
	}
	
	document.frm.phone.value = document.frm.phone1.value+"-"+document.frm.phone2.value+"-"+document.frm.phone3.value;
	document.frm.action = "find_id_pwd";
	document.frm.submit();
}

function find_pwd(){
	if(document.frm.userid.value==""){
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		return false;
	}else if(document.frm.name.value==""){
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}else if(document.frm.birth.value==""){
		alert("생년월일을 입력하세요.");
		document.frm.birth.focus();
		return false;
	}else if(document.frm.phone2.value==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone2.focus();
		return false;
	}else if(document.frm.phone3.value==""){
		alert("전화번호를 입력하세요.");
		document.frm.phone3.focus();
		return false;
	}
	
	document.frm.phone.value = document.frm.phone1.value+"-"+document.frm.phone2.value+"-"+document.frm.phone3.value;
	document.frm.action = "find_id_pwd";
	document.frm.submit();
}

</script>
<c:if test="${find eq 'id' }">
	<div style="margin: 20px">
		<h4>아이디 찾기</h4>
		<hr>
		<form method="post" action="" name="frm">
		<input type="hidden" name="find" value="id">
			<div class="form-group">
				<table>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="name" name="name"></td>
					</tr>
					<tr>
						<th><label for="birth">생년월일</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="birth" name="birth"></td>
					</tr>
					<tr>
						<th>전화번호<input type="hidden" name="phone" value=""></th>
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
						<td colspan="2" style="text-align: right"><button type="button" class="btn btn-primary btn-sm" onclick="find_id()">찾기</button></td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
</c:if>

<c:if test="${find eq 'pwd' }">
	<div style="margin: 20px">
		<h4>비밀번호 찾기</h4>
		<hr>
		<form method="post" name="frm"action="">
		<input type="hidden" value="pwd" name="find">
			<div class="form-group">
				<table>
					<tr>
						<th><label for="userid">아이디</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="userid" name="userid"></td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="name" name="name"></td>
					</tr>
					<tr>
						<th><label for="birth">생년월일</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="birth" name="birth"></td>
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
						<td colspan="2" style="text-align: right"><button type="button" class="btn btn-primary btn-sm" onclick="find_pwd()">찾기</button></td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
</c:if>

<c:if test="${findResult eq 'id' }">
	<div style="margin: 20px">
		<h4>아이디 찾기 결과</h4>
		<hr>
		<c:if test="${findUser == null }">
			<div
				style="width: 400px; background-color: #EFEFEF; margin: 20px; border: 1px solid #ccc">
				결과가 없습니다</div>
		</c:if>
		<c:if test="${findUser != null }">
			<div
				style="width: 400px; background-color: #EFEFEF; margin: 20px; border: 1px solid #ccc">
				<c:forEach var="findUser" items="${findUser}"> &emsp;${findUser.userid }<br></c:forEach> </div>
		</c:if>
		<div style="text-align:right;width: 480px; margin: 20px">
			<button onclick="location.href='find_id_pwd?find=pwd'" type="button" class="btn btn-primary btn-sm">비밀번호 찾기</button>
			<button onclick="location.href='login'" type="button" class="btn btn-primary btn-sm">로그인</button>
			<button onclick="location.href='index'" type="button" class="btn btn-secondary btn-sm">메인</button>
		</div>
		<hr>
	</div>
</c:if>

<c:if test="${findResult eq 'pwd' }">
	<div style="margin: 20px">
		<h4>비밀번호 찾기 결과</h4>
		<hr>
		<c:if test="${findUser == null }">
			<div
				style="width: 400px; background-color: #EFEFEF; margin: 20px; border: 1px solid #ccc">
				입력정보를 확인하세요.</div>
		</c:if>
		<c:if test="${findUser != null }">
			<div
				style="width: 400px; background-color: #EFEFEF; margin: 20px; border: 1px solid #ccc">
				<c:forEach var="findUser" items="${findUser}"> &emsp;${findUser.pwd }<br></c:forEach></div>
		</c:if>
		<div style="text-align:right;width: 480px; margin: 20px;">
			<button onclick="location.href='login'" type="button" class="btn btn-primary btn-sm">로그인</button>
			<button onclick="location.href='index'" type="button" class="btn btn-secondary btn-sm">메인</button>
		</div>
		<hr>
	</div>
</c:if>
<script type="text/javascript" src="script/user.js"></script>
<%@ include file="../footer.jsp"%>
