<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="mypageMenu.jsp"%>
<script type="text/javascript">
	function pwd_check() {
		if (document.wdForm.userPwd.value != document.wdForm.password.value) {
			alert("비밀번호를 확인하세요.");
			document.wdForm.password.focus();
			return false;
		}

		$("#pwdCheckDiv").remove();

		$("#withdrawalForm").css('visibility', 'visible');

	}
	
	function go_withdrawal(){
		var value = confirm("탈퇴 하겠습니까?");
		if(value == true){
			document.wdForm.action="user_withdarawal";
			document.wdForm.submit();
		}
	}
</script>

<div style="margin: 20px; height: 500px">
	<article style="float: right; width: 730px;">
		<form method="post" name="wdForm" action="">
			<input type="hidden" name="userid" value="${loginUser.userid }">
			<input type="hidden" name="userPwd" value="${loginUser.pwd }">
			<div id="pwdCheckDiv">
				<table class="table">
					<thead>
						<tr>
							<th colspan="3"><h1>회원탈퇴</h1></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><br> <br>비밀번호 입력</td>
							<td><br> <br> <input type="password"
								class="form-control " name="password"></td>
							<td><br> <br>
								<button type="button" class="btn btn-primary"
									onclick="pwd_check()">확인</button></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="withdrawalForm" style="visibility: hidden">
				<table class="table">
					<thead>
						<tr>
							<th colspan="3"><h1>회원탈퇴</h1></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3"><br> <br>
								<button type="button" class="btn btn-danger"
									onclick="go_withdrawal()">회원탈퇴</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
	</article>
</div>

<%@include file="../footer.jsp"%>