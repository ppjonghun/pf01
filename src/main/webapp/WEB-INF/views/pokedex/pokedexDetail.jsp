<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
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
	});

	function update_pokemon() {
		document.frm.action = "update_pokemon?po_seq="
				+ document.frm.po_seq.value;
		document.frm.submit();
	}
	function delete_pokemon() {

		var returnValue = confirm("삭제하겠습니까?");

		if (returnValue == true) {
			document.frm.action = "delete_pokemon?po_seq="
					+ document.frm.po_seq.value;
			document.frm.submit();
		}
	}

	var updateCheckNum = 0;

	function reply_update() {
		var theForm = document.re_updateForm;

		if (theForm.content.value == "") {
			alert("내용을 입력하세요.");
			return false;
		} else if (theForm.content.value.length > 200) {
			alert("최대 200자까지 가능합니다.");
			return false;
		}

		theForm.action = "pokedex_reply_update";
		theForm.submit();

	}

	function reply_updateForm(seq, content, writer, indate, po_seq) {
		updateCheckNum++;
		if (updateCheckNum > 1) {
			alert("댓글수정을 완료해주세요.");
			return false;
		}
		var d1 = "#d" + seq + "_1";
		var d2 = "#d" + seq + "_2";
		var target = "#contentBox" + seq;
		$(target).remove();//
		var divString = "<div style=' background-color:white;text-align: left'><form method='post' name='re_updateForm'>";
		divString += "<input type='hidden' name='reply_seq' value='"+seq+"'>";
		divString += "<input type='hidden' name='po_seq' value='"+po_seq+"'>";
		divString += "<b>" + writer + "</b><small style='color:#B9B9B9'>"
				+ "&emsp;" + indate
				+ "</small><hr><textarea name='content'  cols='100' rows='5'>";
		divString += content + "</textarea><div style='text-align:right'>";
		divString += "<a onclick='reply_update()'><small>";
		divString += "<i class='fas fa-pen'></i>수정&nbsp;</small></a>";
		divString += "<a href='pokedex_reply_delete?reply_seq=" + seq
				+ "&po_seq=" + po_seq
				+ "' onclick='return reply_delete()'><small>";
		divString += "<i class='fas fa-trash-alt'></i>삭제&nbsp; </small></a></div></div></form></div>";

		$(d1).html(divString);
	}

	function go_reply() {
		if (document.replyForm.content.value == "") {
			alert("내용을 입력하세요.");
			return false;
		}

		document.replyForm.action = "insert_pokedex_reply";
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
</script>
<div style="margin: 20px">
	<table class="table" style="text-align: center">
		<thead>
			<tr>
				<th colspan="3"><c:set var="po_seq" value="${pokemon.po_seq}"></c:set>
					<c:choose>
						<c:when test="${fn:length(po_seq) > 4 }">${fn:substring(po_seq, 0 , 3) }</c:when>
						<c:otherwise>${pokemon.po_seq }</c:otherwise>
					</c:choose> . ${pokemon.name }</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td rowspan="5"><div>
						<img width="200px" height="200px"
							src="pokemonImages/${pokemon.image}">
					</div></td>
				<th>타입</th>
				<td><c:if test="${pokemon.bug eq '1' }">
						<img src="type2/ico_2_bug.png">
					</c:if> <c:if test="${pokemon.dark eq '1' }">
						<img src="type2/ico_2_dark.png"> 악 &emsp;
										</c:if> <c:if test="${pokemon.dragon eq '1' }">
						<img src="type2/ico_2_dragon.png"> 드래곤&emsp;
										</c:if> <c:if test="${pokemon.electric eq '1' }">
						<img src="type2/ico_2_electric.png"> 전기&emsp;
										</c:if> <c:if test="${pokemon.fairy eq '1' }">
						<img src="type2/ico_2_fairy.png"> 페어리&emsp;
										</c:if> <c:if test="${pokemon.fighting eq '1' }">
						<img src="type2/ico_2_fighting.png"> 격투&emsp;
										</c:if> <c:if test="${pokemon.fire eq '1' }">
						<img src="type2/ico_2_fire.png"> 불꽃&emsp;
										</c:if> <c:if test="${pokemon.flying eq '1' }">
						<img src="type2/ico_2_flying.png"> 비행&emsp;
										</c:if> <c:if test="${pokemon.ghost eq '1' }">
						<img src="type2/ico_2_ghost.png"> 고스트&emsp;
										</c:if> <c:if test="${pokemon.grass eq '1' }">
						<img src="type2/ico_2_grass.png"> 풀&emsp;
										</c:if> <c:if test="${pokemon.ground eq '1' }">
						<img src="type2/ico_2_ground.png"> 땅&emsp;
										</c:if> <c:if test="${pokemon.ice eq '1' }">
						<img src="type2/ico_2_ice.png"> 얼음&emsp;
										</c:if> <c:if test="${pokemon.normal eq '1' }">
						<img src="type2/ico_2_normal.png"> 노말&emsp;
										</c:if> <c:if test="${pokemon.poison eq '1' }">
						<img src="type2/ico_2_poison.png"> 독&emsp;
										</c:if> <c:if test="${pokemon.psychic eq '1' }">
						<img src="type2/ico_2_psychic.png"> 에스퍼&emsp;
										</c:if> <c:if test="${pokemon.rock eq '1' }">
						<img src="type2/ico_2_rock.png"> 바위&emsp;
										</c:if> <c:if test="${pokemon.steel eq '1' }">
						<img src="type2/ico_2_steel.png"> 강철&emsp;
										</c:if> <c:if test="${pokemon.water eq '1' }">
						<img src="type2/ico_2_water.png"> 물&emsp;
										</c:if></td>
			</tr>
			<tr>
				<th>MAX CP</th>
				<td>${pokemon.max_cp }</td>
			</tr>
			<tr>
				<th>공격력</th>
				<td>${pokemon.att }</td>
			</tr>
			<tr>
				<th>방어력</th>
				<td>${pokemon.def }</td>
			</tr>
			<tr>
				<th>체력</th>
				<td>${pokemon.hp }</td>
			</tr>
			<tr>
				<td colspan="3"><c:if test="${loginUser.grade eq '2' }">
						<div style="float: right">
							<form name="frm" action="">
								<input type="hidden" name="po_seq" value="${pokemon.po_seq }">
								<button type="button" class="btn btn-light btn-sm"
									onclick="update_pokemon()">수정하기</button>
								<button type="button" class="btn btn-light btn-sm"
									onclick="delete_pokemon()">삭제하기</button>
							</form>
						</div>
					</c:if></td>
			</tr>
			<tr bgcolor="#ECECEC">
				<td colspan="3">
					<div style="background-color: white; padding: 10px;">
						<form name="replyForm" action="" method="post">
							<input type="hidden" name="kind" value="pokedex"> <input
								type="hidden" name="seq" value="${pokemon.po_seq}">
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
				<td colspan="3" style="text-align: left">&emsp;<i class="far fa-comment-dots"></i> <b>댓글</b>&emsp;<small>총 ${pokemon.replyCnt }개</small></td>
			</tr>
		</tbody>
		<c:choose>
			<c:when test="${replyList.size() == '0' }">
				<tr bgcolor="#eeeeee">
					<td colspan="3"><div
							style="margin: 1px 20px; text-align: left">댓글이 없습니다.</div></td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="reply" items="${replyList }">
					<tr bgcolor="#eeeeee">
						<td colspan="3">
							<div id="d${reply.reply_seq }_1"
								style="margin: 1px 20px; background-color: white"></div>
							<div id="contentBox${reply.reply_seq }"
								style="margin: 1px 20px; background-color: white; text-align: left">
								<b>${reply.writer }</b><small style="color: #B9B9B9">&emsp;|&emsp;${reply.indate }</small>
								<hr>
								<c:out value="${reply.content }" />
								<div style="text-align: right">
									<c:if
										test="${(reply.writer eq loginUser.userid) or (loginUser.grade eq '2') }">
										<div>
											<a
												onclick="reply_updateForm('${reply.reply_seq}', '${reply.content }', '${reply.writer }', '${reply.indate }','${pokemon.po_seq}')">
												<small><i class="fas fa-pen"></i>수정&nbsp;</small>
											</a> <a
												href="pokedex_reply_delete?reply_seq=${reply.reply_seq }&po_seq=${pokemon.po_seq}"
												onclick="return reply_delete()"><small><i class="fas fa-trash-alt"></i> 삭제&nbsp; </small></a>
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