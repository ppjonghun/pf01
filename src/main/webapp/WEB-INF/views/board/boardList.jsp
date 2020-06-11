<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<style>
span{
	color:red;
}
</style>
<script type="text/javascript">
	

	function go_search() {
		if (document.frm.searchCondition.value == "") {
			alert("검색조건을 선택해 주세요.");
			return false;
		} else if (document.frm.keyword.value == "") {
			alert("검색단어를 입력해 주세요.");
			return false;
		}
		document.frm.action = "board_list";
		document.frm.submit();
	}
</script>
<h1>게시판</h1>
<div style="margin: 20px">
	<form class="form-inline" name="frm" action="">
		<div class="input-group mb-3">
			<select class="custom-select my-1 mr-sm-2" name="searchCondition"
				id="SearchCondition">
				<option value="" selected>검색조건</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
		</div>
		<div class="input-group mb-3">
			<input type="text" name="keyword" class="form-control"
				aria-describedby="button-addon2">
			<div class="input-group-append">
				<button onclick="go_search()" class="btn btn-outline-secondary"
					type="button" id="button-addon2">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</div>
	</form>
		<table class="table table-sm table-hover">
			<thead class="thead-light" align="center">
				<tr>
					<th></th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회</th>
				</tr>
			</thead>
			<c:forEach items="${boardList }" var="board">
				<c:choose>
					<c:when test="${board.kind == '1' }">
						<tr bgcolor="#FFFFCC">
							<td>${board.bseq }</td>
							<td><a
								href="board_detail?bseq=${board.bseq }&nowPage=${paging.nowPage}"><b>${board.title } <c:if test="${board.replyCnt != '0' }"><span>[ ${board.replyCnt } ]</span></c:if></b></a></td>
							<td>${board.writer }</td>
							<td>${board.indate }</td>
							<td>${board.cnt }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${board.bseq }</td>
							<td><a
								href="board_detail?bseq=${board.bseq }&nowPage=${paging.nowPage}">${board.title }
								<c:if test="${board.replyCnt != '0' }"><span>[ ${board.replyCnt } ]</span></c:if></a></td>
							<td>${board.writer }</td>
							<td>${board.indate }</td>
							<td>${board.cnt }</td>
						</tr>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			<tr>
				<td colspan="5"><div style="text-align: right">
						<button class="btn btn-light" onclick="go_board_write()">
							<i class="fas fa-pen"></i>
							글쓰기
						</button>
					</div></td>
			</tr>
			<tr>
				<td colspan="5">&nbsp;</td>
			</tr>
		</table>
	<div class="row">
		<div class="btn-toolbar" role="toolbar"
			aria-label="Toolbar with button groups" style="margin: auto">
			<div class="btn-group mr-5" role="group">
				<c:if test="${paging.startPage!= paging.nowPage }">
					<button
						onclick="location.href='board_list?nowPage=${paging.nowPage-1}&cntPerPage=${paging.cntPerPage}'"
						type="button" class="btn btn-light">
						<i class="fas fa-caret-left"></i>
					</button>
				</c:if>

				<c:forEach begin="${paging.startPage}" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${paging.nowPage == p }">
							<button
								onclick="location.href='board_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}'"
								type="button" class="btn btn-primary">${p }</button>
						</c:when>
						<c:otherwise>
							<button
								onclick="location.href='board_list?nowPage=${p }&cntPerPage=${paging.cntPerPage}'"
								type="button" class="btn btn-light">${p }</button>
						</c:otherwise>
					</c:choose>

				</c:forEach>

				<c:if test="${paging.lastPage!= paging.nowPage }">
					<button
						onclick="location.href='board_list?nowPage=${paging.nowPage+1}&cntPerPage=${paging.cntPerPage}'"
						type="button" class="btn btn-light">
						<i class="fas fa-caret-right"></i>
					</button>
				</c:if>
			</div>
		</div>
		<%-- ${paging} --%>
	</div>
</div>
<%@ include file="../footer.jsp"%>