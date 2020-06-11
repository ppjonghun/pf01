<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="mypageMenu.jsp" %>
<div style="margin: 20px; height:500px">
<article style="float:right;width: 730px;">
	<table class="table">
		<thead>
			<tr>
				<th colspan="2"><h1>회원 정보</h1></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>아이디</td>
				<td><c:if test="${loginUser.grade eq '2' }"><i class="fas fa-hammer"></i>&nbsp;</c:if>${loginUser.userid }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${loginUser.name }</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><fmt:parseDate value="${loginUser.birth }" var="dateFmt"
						pattern="yyyyMMdd" /> <fmt:formatDate value="${dateFmt }"
						pattern="yyyy-MM-dd" var="birth" />${birth}</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${loginUser.phone }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><c:if test="${loginUser.email ==null }">등록된 이메일이 없습니다.</c:if>
					<c:if test="${loginUser.email !=null }">${loginUser.email }</c:if></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><c:if test="${loginUser.address ==null }">등록된 주소가 없습니다.</c:if>
					<c:if test="${loginUser.address !=null }">${loginUser.zip_num}<br>${loginUser.address }</c:if></td>
			</tr>
			<tr>
				<td>가입일</td>
				<td>${loginUser.indate }</td>
			</tr>
		</tbody>
	</table>
	</article>
</div>

<%@include file="../footer.jsp"%>