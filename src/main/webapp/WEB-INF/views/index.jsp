<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style type="text/css">
/* banner */
.banner {
	position: relative;
	width: 890px;
	height: 325px;
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 890px;
	height: 325px;
	margin: 0;
	padding: 0;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript" language="JavaScript">
	$(document).ready(
			function() {
				var $banner = $(".banner").find("ul");

				var $bannerWidth = $banner.children().outerWidth();//이미지의 폭
				var $bannerHeight = $banner.children().outerHeight(); // 높이
				var $length = $banner.children().length;//이미지의 갯수
				var rollingId;

				//정해진 초마다 함수 실행
				rollingId = setInterval(function() {
					rollingStart();
				}, 4000);//다음 이미지로 롤링 애니메이션 할 시간차

				function rollingStart() {
					$banner.css("width", $bannerWidth * $length + "px");
					$banner.css("height", $bannerHeight + "px");
					//alert(bannerHeight);
					//배너의 좌측 위치를 옮겨 준다.
					$banner.animate({
						left : -$bannerWidth + "px"
					}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
						//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
						$(this).append(
								"<li>" + $(this).find("li:first").html()
										+ "</li>");
						//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
						$(this).find("li:first").remove();
						//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
						$(this).css("left", 0);
						//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
					});
				}
			});
</script>
<div class="contents" style="margin: 20px">
	<div class="banner">
		<ul>
			<c:forEach var="board" items="${bList }" varStatus="status">
				<li><a href="board_detail?bseq=${board.bseq }&nowPage=1"><img
						src="board/${board.image}" width="890px" height="300px"></a>
					<div
						style="background-color: #A2E9FF; text-align: center; width: 890px; height: 25px; margin: 0">
						<a href="board_detail?bseq=${board.bseq }&nowPage=1">${board.title }</a>
					</div></li>
			</c:forEach>
		</ul>
	</div>
	<div
		style="text-align: center; background-color: black; padding: 10px 0">
		<c:forEach var="board" items="${bList }" varStatus="status">
			<a href="board_detail?bseq=${board.bseq }&nowPage=1"><img
				src="board/${board.image}" width="80px" height="30px"></a>
		</c:forEach>
	</div>
</div>
<div class="clear"></div>
<div style="margin: 10px 20px;">
	<table>
		<tr>
			<td width="450px"><table class="table table-sm">
					<thead>
						<tr>
							<th colspan="3">최근 게시글</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
						</tr>
						<c:forEach var="l_board" items="${latelyBoardList}">
							<tr>
								<td><a href="board_detail?bseq=${l_board.bseq }&nowPage=1">${l_board.title }<c:if
											test="${l_board.replyCnt != '0' }">
											<span style="color: red">[ ${l_board.replyCnt } ]</span>
										</c:if></a></td>
								<td>${l_board.writer }</td>
								<td>${l_board.indate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table></td>
			<td width="450px"><table class="table table-sm">
					<thead>
						<tr>
							<th colspan="3">인기 게시글</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
						</tr>
						<c:forEach var="p_board" items="${popBoardList}">
							<tr>
								<td><a href="board_detail?bseq=${p_board.bseq }&nowPage=1">${p_board.title }<c:if
											test="${p_board.replyCnt != '0' }">
											<span style="color: red">[ ${p_board.replyCnt } ]</span>
										</c:if></a></td>
								<td>${p_board.writer }</td>
								<td>${p_board.indate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
</div>
<%@ include file="footer.jsp"%>