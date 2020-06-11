<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="mypageMenu.jsp"%>
<script type="text/javascript">

function pwd_check(){
	if(document.changePwdForm.userPwd.value != document.changePwdForm.password.value){
		alert("비밀번호를 확인하세요.");
		document.changeForm.password.focus();
		return false;
	}
	
	$("#pwdCheckDiv").remove();
	
	var newdiv = "";
	newdiv += "<table class='table'>";
	newdiv += "<thead>";
	newdiv += "<tr>";
	newdiv += "<th>";
	newdiv += "<h1>비밀번호 변경</h1>";
	newdiv += "</th>";
	newdiv += "</tr>";
	newdiv += "<tbody><tr><td><br><br>새로운 비밀번호 입력</td>";
	newdiv += "<td><br> <br> <input type='password'class='form-control' name='pwd'></td>";
	newdiv += "<td>&nbsp;</td></tr>";
	newdiv += "<tr><td><br><br>비밀번호 확인</td>";
	newdiv += "<td><br><br><input type='password'class='form-control' name='pwd2'></td>";
	newdiv += "<td><br><br><button type='button' class='btn btn-primary'onclick='change_pwd()''>확인</button></td></tr>";
	newdiv += "</tbody></table>";
	
	$("#pwdChangeDiv").html(newdiv);
	
}

function change_pwd(){
	if(document.changePwdForm.pwd.value != document.changePwdForm.pwd2.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.changePwdForm.pwd2.focus();
		return false;
	}
	
	var check = confirm("변경하겠습니까?");
	if(check == true){
		document.changePwdForm.action="user_pwd_change";
		document.changePwdForm.submit();
	}
}
</script>

<div style="margin: 20px; height: 500px">
	<article style="float: right; width: 730px;">
		<form method="post" name="changePwdForm" action="">
			<input type="hidden" name="userid" value="${loginUser.userid }">
			<input type="hidden" name="userPwd" value="${loginUser.pwd }">
			<div id="pwdCheckDiv">
				<table class="table">
					<thead>
						<tr>
							<th colspan="3"><h1>비밀번호 변경</h1></th>
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
			<div id="pwdChangeDiv"></div>
		</form>
	</article>
</div>

<%@include file="../footer.jsp"%>