<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<script type="text/javascript" src="script/jquery-3.4.1.min.js"></script>
<style>
textarea {
	resize: none;
}

.contentView {
	border: none;
	width: 100%;
	height: auto;
	resize: none;
	overflow: display;
}

.nap {
	color: black;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".contentarea").keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 최대 200자)"); //글자수 실시간 카운팅

			if (content.length > 200) {
				alert("최대 200자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 200));
				$('#counter').html("(200 / 최대 200자)");
			}
		});

		function adjustHeight() {
			var textEle = $('.contentView');
			textEle[0].style.height = 'auto';
			var textEleHeight = textEle.prop('scrollHeight');
			textEle.css('height', textEleHeight);
		}
		;

		adjustHeight();
		getRecommend();
	});

	var updateCheckNum = 0;

	function board_delete() {
		var returnValue = confirm("삭제하겠습니까?");

		if (returnValue == true) {
			document.removeForm.action = "board_delete";
			document.removeForm.submit();
		}
	}
	function reply_update() {
		var theForm = document.re_updateForm;

		if (theForm.content.value == "") {
			alert("내용을 입력하세요.");
			return false;
		} else if (theForm.content.value.length > 200) {
			alert("최대 200자까지 가능합니다.");
			return false;
		}

		theForm.action = "reply_update";
		theForm.submit();

	}
	function reply_updateForm(seq, content, writer, indate, bseq) {
		updateCheckNum++;
		if (updateCheckNum > 1) {
			alert("댓글수정을 완료해주세요.");
			return false;
		}
		var d1 = "#d" + seq + "_1";
		var d2 = "#d" + seq + "_2";
		var target = "#contentBox" + seq;
		$(target).remove();
		var divString = "<div style=' background-color:white'><form method='post' name='re_updateForm'>";
		divString += "<input type='hidden' name='reply_seq' value='"+seq+"'>";
		divString += "<input type='hidden' name='bseq' value='"+bseq+"'>";
		divString += "<b>"
				+ writer
				+ "</b><small style='color:#B9B9B9'>"
				+ "&emsp;"
				+ indate
				+ "</small><hr><textarea class='form-control' name='content'  cols='100' rows='5'>";
		divString += content + "</textarea><div style='text-align:right'>";
		divString += "<a onclick='reply_update()'><small><i class='fas fa-pen'></i>";
		divString += "수정&nbsp;</small></a>";
		divString += "<a href='reply_delete?reply_seq=" + seq + "&bseq=" + bseq
				+ "' onclick='return reply_delete()'><small>";
		divString += "<i class='fas fa-trash-alt'></i>"
		divString += "삭제&nbsp; </small></a></div></div></form></div>";

		$(d1).html(divString);
	}

	function go_reply() {
		if (document.replyForm.content.value == "") {
			alert("내용을 입력하세요.");
			return false;
		}

		document.replyForm.action = "insert_board_reply";
		document.replyForm.submit();
	}

	function reply_delete() {
		var dvalue = confirm("삭제하시겠습니까?");

		if (dvalue == true) {
			return true;
		} else {
			return false;
		}
	}

	function getRecommend() {
		$.ajax({
			type : 'GET',
			url : 'get_board_recommend',
			dataType : "json",
			data : $("#recommendForm").serialize(),
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				var cnt = data.length;
				console.log(cnt);
				var good = 0;
				var bad = 0;
				if (cnt > 0) {
					for (i = 0; i < cnt; i++) {
						if (data[i] > 0) {
							good = data[i];
						} else if (data[i] < 0) {
							bad = data[i] * -1;
						}
					}
				}
				if (good > 0) {
					$("#goodCnt").html(good);
				} else {
					$("#goodCnt").html(0);
				}

				if (bad > 0) {
					$("#badCnt").html(bad);
				} else {
					$("#badCnt").html(0);
				}

				recommend_check();

			},
			error : function(request, status, error) {
				console.log("에 러");
			}
		});
	}

	function recommend_check() {
		$.ajax({
			type : 'GET',
			url : 'board_recommend_check',
			dataType : "json",
			data : $("#recommendForm").serialize(),
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
				if (data.gob == '100') {
					console.log("로그인 하지 않음");
				} else {
					var gob = data.gob;
					var good = document.getElementById("good_btn");
					var bad = document.getElementById("bad_btn");
					if (gob == '1') {
						good.className = "btn btn-danger";
						bad.setAttribute("disabled", "disabled");
					} else if (gob == '-1') {
						bad.className = "btn btn-danger";
						good.setAttribute("disabled", "disabled");
					} else {
						good.className = "btn btn-ligth";
						bad.className = "btn btn-ligth";
						good.removeAttribute("disabled");
						bad.removeAttribute("disabled");
					}
					getRecommend();
				}
			},
			error : function(request, status, error) {
				console.log("에 러");
			}
		});
	}

	function good_btn_click() {
		$.ajax({
			type : 'GET',
			url : 'board_recommend?click=1',
			dataType : "json",
			data : $("#recommendForm").serialize(),
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {

				if (data == 0) {
					alert("로그인이 필요합니다.");
				} else {
					recommend_check();
				}

			},
			error : function(request, status, error) {
				console.log("에 러");
			}
		});
	}

	function bad_btn_click() {
		$.ajax({
			type : 'GET',
			url : 'board_recommend?click=-1',
			dataType : "json",
			data : $("#recommendForm").serialize(),
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {

				if (data == 0) {
					alert("로그인이 필요합니다.");
				} else {
					recommend_check();
				}

			},
			error : function(request, status, error) {
				console.log("에 러");
			}
		});
	}
</script>
<div style="margin: 20px;">
	<table class="table table-sm">
		<tr>
			<td colspan="3"><h4>${board.title }</h4></td>
		</tr>
		<tr>
			<td>${board.writer }</td>
			<td>조회 ${board.cnt }</td>
			<td>${board.indate }</td>
		</tr>
		<tr>
			<td colspan="3"><br> <br> <c:if
					test="${board.image != null }">
					<div style="text-align: center">
						<img src="board/${board.image}" width="700px" height="300px">
					</div>
				</c:if> <br> <textarea class="contentView" readOnly><c:out
						value="${board.content}" /></textarea><br> <br> <br> <br>
				<div style="text-align: center">
					<form name="recommendForm" id="recommendForm">
						<input type="hidden" name="boardSeq" value="${board.bseq}">
						<button type="button" class="btn btn-light" id="good_btn"
							name="good_btn" onclick="good_btn_click()">
							<i class="far fa-thumbs-up fa-2x"></i>
							<div style="margin: auto" id="goodCnt">0</div>
						</button>
						&nbsp;
						<button type="button" class="btn btn-light" id="bad_btn"
							name="bad_btn" onclick="bad_btn_click()">
							<i class="far fa-thumbs-down fa-2x"></i>
							<div style="margin: auto" id="badCnt">0</div>
						</button>
					</form>
				</div></td>
		</tr>
		<tr>
			<td colspan="3"><br> <c:choose>
					<c:when test="${nap.pre_title eq '이전글이 없습니다' }">
						<a class="nap">&nbsp;&nbsp;<i class="fas fa-caret-up"></i>&nbsp;&nbsp;&nbsp;${nap.pre_title }
						</a>
					</c:when>
					<c:otherwise>
						<a class="nap" href="board_detail?bseq=${nap.pre_bseq }">&nbsp;&nbsp;<i
							class="fas fa-caret-up"></i>&nbsp;&nbsp;&nbsp;${nap.pre_title }
						</a>
					</c:otherwise>
				</c:choose><br> 현재 : <b>${board.title }</b><br> <c:choose>
					<c:when test="${nap.next_title eq '다음글이 없습니다' }">
						&nbsp;&nbsp;<i class="fas fa-caret-down"></i>&nbsp;&nbsp;&nbsp;${nap.next_title }
						
					</c:when>
					<c:otherwise>
						<a class="nap" href="board_detail?bseq=${nap.next_bseq }">&nbsp;&nbsp;<i
							class="fas fa-caret-down"></i>&nbsp;&nbsp;&nbsp;${nap.next_title }
						</a>
					</c:otherwise>
				</c:choose><br> <br></td>
		</tr>
		<tr>
			<td colspan="3"><div style="float: right; text-align: right"
					class="row">
					<button class="btn btn-light"
						onclick="location.href='board_list?nowPage=${nowPage}'">
						<i class="fas fa-bars"></i> 목록
					</button>
					<button class="btn btn-light" onclick="go_board_write()">
						<i class="fas fa-pen"></i> 글쓰기
					</button>
					<c:if test="${board.writer eq loginUser.userid}">
						<div>
							<button class="btn btn-light"
								onclick="location.href='board_update?bseq=${board.bseq}'">
								<i class="fas fa-pen"></i> 글수정
							</button>
						</div>
					</c:if>
					<c:if
						test="${(board.writer eq loginUser.userid) or (loginUser.grade eq '2') }">
						<form name="removeForm" action="">
							<button class="btn btn-light" onclick="board_delete()">
								<i class="fas fa-trash-alt"></i> 글삭제
							</button>
							<input type="hidden" name="bseq" value="${board.bseq }">
							<input type="hidden" name="nowPage" value="${nowPage }">
						</form>
					</c:if>
				</div></td>
		</tr>
		<tr bgcolor="#ECECEC">
			<td colspan="3">
				<div style="background-color: white; padding: 10px;">
					<form name="replyForm" action="" method="post" id="replyForm">
						<input type="hidden" name="kind" value="board"> <input
							type="hidden" name="seq" value="${board.bseq}">
						<c:if test="${loginUser != null }">
							<input type="hidden" name="writer" value="${loginUser.userid }">
						</c:if>
						<div class="input-group">
							<textarea rows="5" style="resize: none" name="content"
								class="form-control contentarea" aria-label="With textarea"
								<c:if test="${loginUser == null }">
							readOnly placeholder="로그인후 댓글을 남길수 있습니다."</c:if>></textarea>
							<br> <span style="color: #aaa;" id="counter">(0 / 최대
								200자)</span><br>
						</div>
						<div style="text-align: right">
							<button onclick="go_reply()" class="btn btn-light"
								<c:if test="${loginUser == null }">
							disabled</c:if>>등록</button>
						</div>
					</form>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="3" style="text-align: left">&emsp;<i
				class="far fa-comment-dots"></i> <b>댓글</b>&emsp;<small>총
					${board.replyCnt }개</small></td>
		</tr>
		<c:choose>
			<c:when test="${replyList.size() == '0' }">
				<tr bgcolor="#eeeeee">
					<td colspan="3"><div style="margin: 1px 20px;">댓글이 없습니다.</div></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="reply" items="${replyList }">
					<tr bgcolor="#eeeeee">
						<td colspan="3">
							<div id="d${reply.reply_seq }_1"
								style="margin: 1px 20px; background-color: white"></div>
							<div id="contentBox${reply.reply_seq }"
								style="margin: 1px 20px; background-color: white">
								<b>${reply.writer }</b><small style="color: #B9B9B9">&emsp;|&emsp;${reply.indate }</small>
								<hr>
								<c:out value="${reply.content}" />
								<div style="text-align: right">
									<c:if
										test="${(reply.writer eq loginUser.userid) or (loginUser.grade eq '2') }">
										<div>
											<a
												onclick="reply_updateForm('${reply.reply_seq}', '${reply.content }', '${reply.writer }', '${reply.indate }','${board.bseq}')">
												<small><i class="fas fa-pen"></i>수정&nbsp;</small>
											</a> <a
												href="reply_delete?reply_seq=${reply.reply_seq }&bseq=${board.bseq}"
												onclick="return reply_delete()"><small><i
													class="fas fa-trash-alt"></i> 삭제&nbsp; </small></a>
										</div>
									</c:if>
								</div>
							</div>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>

	</table>

</div>
<%@include file="../footer.jsp"%>