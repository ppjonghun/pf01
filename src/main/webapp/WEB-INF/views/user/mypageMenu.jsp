<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav style="float: left">
	<ul class="nav flex-column nav-pills">
		<li class="nav-item"><a
			class="nav-link <c:if test="${now eq 'main' }">active</c:if>"
			href="mypage?menu=main">내정보</a></li>
		<li class="nav-item"><a
			class="nav-link <c:if test="${now eq 'change' }">active</c:if>"
			href="mypage?menu=change">내정보 수정</a></li>
		<li class="nav-item"><a
			class="nav-link <c:if test="${now eq 'changePwd' }">active</c:if>"
			href="mypage?menu=changePwd">비밀번호 변경</a></li>
		<li class="nav-item"><a
			class="nav-link <c:if test="${now eq 'withdrawal' }">active</c:if>"
			href="mypage?menu=withdrawal">회원탈퇴</a></li>
		<c:if test="${loginUser.grade eq '2' }">
			<li class="nav-item"><a class="nav-link">--------------</a></li>
			<li class="nav-item"><a
				class="nav-link <c:if test="${now eq 'userManagement' }">active</c:if>"
				href="user_list">회원관리</a></li>
			<c:if test="${now eq 'am_userDetail' }">
				<li class="nav-item"><a class="nav-link active"
					href="#">회원정보</a></li>
			</c:if>
			<li class="nav-item"><a
				class="nav-link <c:if test="${now eq 'bannerManagement' }">active</c:if>"
				href="banner_management">메인배너 설정</a></li>
		</c:if>
	</ul>
</nav>

