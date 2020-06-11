<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../user/mypageMenu.jsp" %>
<script>
function remove_user() {	
	var value = confirm("선택된 계정을 삭제하겠습니까?");
	if(value == false){
		return false;
	}	
	document.userForm.action="admin_user_remove";
	document.userForm.submit();
}

function turnOn_admin(){
	var value = confirm("선택된 계정을 관리자로 설정하겠습니까?");
	if(value == false){
		return false;
	}
	document.userForm.action="turnOn_admin";
	document.userForm.submit();	
}
</script>
<div style="margin: 20px; height:500px">
<article style="float:right;width: 730px;">
<form name="userForm" action="" method="post">
<input type="hidden" name="selectUser" value="${user.userid }">
	<table class="table">
		<thead>
			<tr>
				<th colspan="2"><h1>회원 정보</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><c:if test="${user.grade eq '2' }"><i class="fas fa-hammer"></i>&nbsp;</c:if>${user.userid }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${user.name }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:parseDate value="${user.birth }" var="dateFmt"
						pattern="yyyyMMdd" /> <fmt:formatDate value="${dateFmt }"
						pattern="yyyy-MM-dd" var="birth" />${birth}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${user.phone }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><c:if test="${user.email ==null }">등록된 이메일이 없습니다.</c:if>
					<c:if test="${user.email !=null }">${user.email }</c:if></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:if test="${user.address ==null }">등록된 주소가 없습니다.</c:if>
					<c:if test="${user.address !=null }">${user.zip_num}<br>${user.address }</c:if></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${user.indate }</td>
			</tr>
			<tr>
						<td colspan="2" style="text-align: right">
						<c:if test="${user.grade == '1' }"><button type="button" onclick="turnOn_admin()" class="btn btn-success btn-sm">관리자 설정</button>&nbsp;</c:if>						
							<button type="button" onclick="remove_user()" class="btn btn-danger btn-sm">회원
								삭제</button>
						</td>
					</tr>
		</tbody>
	</table>
	</form>
	</article>
</div>

<%@include file="../footer.jsp"%>