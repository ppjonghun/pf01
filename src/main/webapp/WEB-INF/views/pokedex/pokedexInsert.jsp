<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="script/pokedex.js"></script>
<style>
#prevImg {
	width: 190px;
	height: 190px;
}
</style>
<h1>포켓몬 등록</h1>
<hr>
<div style="margin: 20px">
	<form method="post" name="frm" enctype="multipart/form-data">
		<div class="form-group">
			<div class="col-sm">
				<table>
					<tr>
						<th>타입</th>
						<td colspan="4"><div class="custom-control custom-checkbox">
								<table>
									<tr>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="normal" id="normal">
											<label class="custom-control-label" for="normal">노말&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="fighting" id="fighting">
											<label class="custom-control-label" for="fighting">격투&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="flying" id="flying">
											<label class="custom-control-label" for="flying">비행&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="poison" id="poison">
											<label class="custom-control-label" for="poison">독&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="ground" id="ground">
											<label class="custom-control-label" for="ground">땅&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="rock" id="rock"> <label
											class="custom-control-label" for="rock">바위&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="bug" id="bug"> <label
											class="custom-control-label" for="bug">벌레&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="ghost" id="ghost">
											<label class="custom-control-label" for="ghost">고스트&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="steel" id="steel">
											<label class="custom-control-label" for="steel">강철</label></td>
									</tr>
									<tr>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="fire" id="fire"> <label
											class="custom-control-label" for="fire">불꽃&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="water" id="water">
											<label class="custom-control-label" for="water">물&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="grass" id="grass">
											<label class="custom-control-label" for="grass">풀&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="electric" id="electric">
											<label class="custom-control-label" for="electric">전기&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="psychic" id="psychic">
											<label class="custom-control-label" for="psychic">에스퍼&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="ice" id="ice"> <label
											class="custom-control-label" for="ice">얼음&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="dragon" id="dragon">
											<label class="custom-control-label" for="dragon">드래곤&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="dark" id="dark"> <label
											class="custom-control-label" for="dark">악&emsp;&emsp;</label></td>
										<td><input type="checkbox" value="1"
											class="custom-control-input" name="fairy" id="fairy">
											<label class="custom-control-label" for="fairy">페어리</label></td>
										<td></td>
									</tr>
								</table>
							</div></td>
					</tr>
					<tr>
						<th><label for="seq">번호</label>
						<input type="hidden" name="po_seq" value=""></th>
						<td><input type="text" class="form-control form-control-sm"
							id="seq" name="seq" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'></td>
						<td><button class="btn btn-light btn-sm" type="button"
								onclick="po_seq_check()">중복체크</button></td>
						<td><div class="custom-control custom-checkbox">
								<input type="checkbox" value="1" class="custom-control-input"
									name="anotherForm" id="anotherForm"> <label
									class="custom-control-label" for="anotherForm"> <i class="far fa-question-circle"></i> 폼
								</label>
							</div></td>
						<td><input type="text" class="form-control form-control-sm"
							id="formName" name="formName"></td>
					</tr>
					<tr>
						<th><label for="name">이름</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="name" name="name"></td>
						
						<td colspan="3" rowspan="6"><div id="preview"
								style="margin: 10px; height: 220px; border: 1px solid #ccc; text-align: center"></div></td>
					</tr>
					<tr>
						<th><label for="max_cp">최대 CP</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="max_cp" name="max_cp" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<th><label for="att">공격력</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="att" name="att" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<th><label for="def">방어력</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="def" name="def" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<th><label for="hp">체력</label></th>
						<td><input type="text" class="form-control form-control-sm"
							id="hp" name="hp" onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)'></td>
					</tr>
					<tr>
						<th>포켓몬 이미지</th>
						<td>
							<div class="input-group">
								<label class="input-group-btn"> <span
									class="btn btn-light"> <i class="fas fa-image"></i> <input name="uploadFile" id="uploadFile" type="file"
										style="display: none;"
										onchange="$('#upload-file-info').val($(this).val().split('\\').pop())">
								</span>
								</label> <input type="text" class="form-control" id="upload-file-info"
									readonly>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="5"><div style="text-align: right">
						<button class="btn btn-primary btn-sm" type="button"
								onclick="po_insert()">등록</button>
						<button class="btn btn-light btn-sm" type="button"
								onclick="location.href='pokedex_list'">돌아가기</button>
						</div></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>
<script>
	var upload = document.querySelector('#uploadFile');
	var preview = document.querySelector('#preview');

	upload.addEventListener('change', function(e) {

		var parent = document.getElementById('preview');
		var child = document.getElementById('prevImg');
		if (child != null) {
			parent.removeChild(child);
		}
		var get_file = e.target.files;

		var image = document.createElement('img');
		image.id = "prevImg";

		/* FileReader 객체 생성 */
		var reader = new FileReader();

		/* reader 시작시 함수 구현 */
		reader.onload = (function(aImg) {
			console.log(1);

			return function(e) {
				console.log(3);
				/* base64 인코딩 된 스트링 데이터 */
				aImg.src = e.target.result
			};
		})(image)

		if (get_file) {
			/* 
			    get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
			    onload 에 설정했던 return 으로 넘어간다.
			    이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
			 */
			reader.readAsDataURL(get_file[0]);
			console.log(2);
		}

		preview.appendChild(image);
	});	
</script>
<%@include file="../footer.jsp"%>