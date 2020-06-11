<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../user/mypageMenu.jsp"%>
<script type="text/javascript">
	function go_user_search() {
		if (document.frm.searchCondition.value == "") {
			alert("검색조건을 선택해 주세요.");
			return false;
		} else if (document.frm.keyword.value == "") {
			alert("검색단어를 입력해 주세요.");
			return false;
		}
		document.frm.action = "user_list";
		document.frm.submit();
	}

	function remove_userList() {
		var check = $("input:checkbox[name=selectUser]:checked").length;
		if(check == 0){
			alert("삭제할 회원을 선택하세요.");
			return false;
		}
		
		var value = confirm("선택된 계정을 삭제하겠습니까?");
		if(value == false){
			return false;
		}
		
		document.userListForm.action="admin_user_remove";
		document.userListForm.submit();
	}
</script>
<div style="margin: 20px; height: 1000px">
	<article style="float: right; width: 730px;">
		<table class="table">
			<thead>
				<tr>
					<th colspan="4"><h1>회원 관리</h1></th>
				</tr>
				<tr>
					<td colspan="4">
						<form class="form-inline" name="frm" action="">
							<div class="input-group mb-3">
								<select class="custom-select my-1 mr-sm-2"
									name="searchCondition" id="SearchCondition">
									<option value="" selected>검색조건</option>
									<option value="userid">아이디</option>
									<option value="name">이름</option>
								</select>
							</div>
							<div class="input-group mb-3">
								<input type="text" name="keyword" class="form-control"
									aria-describedby="button-addon2">
								<div class="input-group-append">
									<button onclick="go_user_search()"
										class="btn btn-outline-secondary" type="button"
										id="button-addon2">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</form>
					</td>
				</tr>
			</thead>
		</table>
		<form name="userListForm" action="" method="post">
			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th>아이디</th>
						<th>이름</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${userList }" var="user">
						<tr>
							<td><div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input"
										id="${user.userid }" name="selectUser" value="${user.userid }"
										<c:if test="${user.grade eq '2' }">disabled</c:if>>
									<label class="custom-control-label" for="${user.userid }"></label>
								</div></td>
							<td><c:if test="${user.grade eq '2' }">
									<i class="fas fa-hammer"></i>&nbsp;</c:if><a href="admin_management_userDetail?userid=${user.userid }">${user.userid }<c:if test="${user.userid eq loginUser.userid }"> (me) </c:if></a></td>
							<td>${user.name }</td>
							<td>${user.indate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" style="text-align: right">
							<button type="button" onclick="remove_userList()" class="btn btn-danger btn-sm">회원
								삭제</button>
						</td>
					</tr>

				</tbody>
			</table>
		</form>
		<div class="row">
			<div class="btn-toolbar" role="toolbar"
				aria-label="Toolbar with button groups" style="margin: auto">
				<div class="btn-group mr-5" role="group">
					<c:if test="${paging.startPage!= paging.nowPage }">
						<button
							onclick="location.href='user_list?nowPage=${paging.nowPage-1}&cntPerPage=${paging.cntPerPage}'"
							type="button" class="btn btn-light">
							<i class="fas fa-caret-left"></i>
						</button>
					</c:if>

					<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
						var="p">

						<c:choose>
							<c:when test="${paging.nowPage == p }">
								<button
									onclick="location.href='user_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}'"
									type="button" class="btn btn-primary">${p }</button>
							</c:when>
							<c:otherwise>
								<button
									onclick="location.href='user_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}'"
									type="button" class="btn btn-light">${p }</button>
							</c:otherwise>
						</c:choose>

					</c:forEach>

					<c:if test="${paging.lastPage!= paging.nowPage }">
						<button
							onclick="location.href='user_list?nowPage=${paging.nowPage+1}&cntPerPage=${paging.cntPerPage}'"
							type="button" class="btn btn-light">
							<i class="fas fa-caret-right"></i>
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</article>
</div>
<%@include file="../footer.jsp"%>