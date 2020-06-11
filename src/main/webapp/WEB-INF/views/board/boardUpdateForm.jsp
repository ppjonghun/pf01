<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#contentarea").keyup(function(e) {
			var content = $(this).val();
			$('#counter').html("(" + content.length + " / 최대 900자)"); //글자수 실시간 카운팅

			if (content.length > 900) {
				alert("최대 900자까지 입력 가능합니다.");
				$(this).val(content.substring(0, 900));
				$('#counter').html("(900 / 최대 900자)");
			}
		});

		$("#title").keyup(function(e) {
			var title = $(this).val();
			$('#titleCounter').html("(" + title.length + " / 최대 70자)"); //글자수 실시간 카운팅

			if (title.length > 70) {
				alert("최대 70자까지 입력 가능합니다.");
				$(this).val(title.substring(0, 70));
				$('#title').html("(70 / 최대 70자)");
			}
		});
	});

	function board_update() {
		if (document.frm.kind.checked) {
			if (document.frm.uploadFile.value == "") {
				alert("이미지를 등록하세요.");
				return false;
			}
		}

		if (document.frm.title.value == "") {
			alert("제목을 입력하세요.");
			document.frm.title.focus();
			return false;
		} else if (document.frm.content.value == "") {
			alert("내용을 입력하세요.");
			document.frm.content.focus();
			return false;
		} else if (document.frm.uploadFile.value != "") {
			pathpoint = document.frm.uploadFile.value.lastIndexOf('.');
			filepoint = document.frm.uploadFile.value.substring(pathpoint + 1,
					document.frm.uploadFile.length);
			filetype = filepoint.toLowerCase();
			if (filetype == 'jpg' || filetype == 'gif' || filetype == 'png'
					|| filetype == 'jpeg' || filetype == 'bmp') {
				// 정상적인 이미지 확장자 파일인 경우
			} else {
				alert('첨부파일은 이미지만 가능합니다.');
				parentObj = document.frm.uploadFile.parentNode
				node = parentObj.replaceChild(document.frm.uploadFile
						.cloneNode(true), obj);
				return false;
			}
		}

		document.frm.action = "board_update";
		document.frm.submit();
	}
</script>
<div style="margin: 20px; border: 1px solid #ccc">
	<div style="text-align: right">
		<button class="btn btn-light"
			onclick="location.href='board_list?nowPage=${nowPage}'">
			<i class="fas fa-bars"></i> 목록
		</button>
	</div>
	<br>
	<form name="frm" action="" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<div class="col-sm">
				<c:if test="${loginUser.grade == '2' }">
					<div class="custom-control custom-checkbox">
						<input type="checkbox" value="1" class="custom-control-input"
							name="kind" id="customCheck1"
							<c:if test="${board.kind == '1'}">checked</c:if>> <label
							class="custom-control-label" for="customCheck1">공지사항</label>
					</div>
				</c:if>
				<input type="text" class="form-control" id="title"
					placeholder="제목을 입력하세요." name="title" value="${board.title }">
				<input type="hidden" name="bseq" value="${board.bseq }"><br>
				<span style="color: #aaa;" id="titleCounter">(0 / 최대 70자)</span><br>
				<br> <small>* 파일은 이미지 파일만 가능합니다.</small><br>
				<div class="input-group">
					<label class="input-group-btn"> <span class="btn btn-light">
							<i class="fas fa-image"></i> <input name="uploadFile"
							id="my-file-selector" type="file" style="display: none;"
							onchange="$('#upload-file-info').val($(this).val().split('\\').pop())">
					</span>
					</label> <input type="text" name="image" class="form-control"
						id="upload-file-info" readonly value="${board.image }">
				</div>
				<textarea id="contentarea" name="content" class="form-control"
					rows="15" style="resize: none"><c:out
						value="${board.content}" /></textarea>
				<br> <span style="color: #aaa;" id="counter">(0 / 최대
					900자)</span><br>
				<div style="text-align: right">
					<button type="button" class="btn btn-light"
						onclick="board_update()">
						<i class="fas fa-pen"></i> 수정하기
					</button>
				</div>
			</div>
		</div>

	</form>
</div>
<%@include file="../footer.jsp"%>