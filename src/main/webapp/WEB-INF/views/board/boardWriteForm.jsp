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
</script>
<style>
#hiddenCheckbox {
	visibility: hidden;
}
</style>
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
							name="kind" id="customCheck1"> <label
							class="custom-control-label" for="customCheck1">공지사항</label>
					</div>
				</c:if>
				<c:if test="${loginUser.grade == '1' }">
					<div id="hiddenCheckbox" class="custom-control custom-checkbox">
						<input type="checkbox" value="1" class="custom-control-input"
							name="kind" id="customCheck1"> <label
							class="custom-control-label" for="customCheck1">공지사항</label>
					</div>
				</c:if>
				<input type="text" class="form-control" id="title"
					placeholder="제목을 입력하세요." name="title"><br> <span
					style="color: #aaa;" id="titleCounter">(0 / 최대 70자)</span><br>
				<br>
				<small>* 파일은 이미지 파일만 가능합니다.</small><br>
				<div class="input-group">
					<label class="input-group-btn"> <span class="btn btn-light">
							<i class="fas fa-image"></i> <input name="uploadFile"
							id="my-file-selector" type="file" style="display: none;"
							onchange="$('#upload-file-info').val($(this).val().split('\\').pop())">
					</span>
					</label> <input type="text" class="form-control" id="upload-file-info"
						readonly>
				</div>
				<textarea id="contentarea" name="content" class="form-control"
					rows="15" style="resize: none"></textarea>
				<span style="color: #aaa;" id="counter">(0 / 최대 900자)</span><br>
				<br>
				<div style="text-align: right">
					<button type="button" class="btn btn-light"
						onclick="board_insert()">
						<i class="fas fa-pen"></i> 등록
					</button>
				</div>
			</div>
		</div>

	</form>
</div>
<%@include file="../footer.jsp"%>