<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<style>
#pokedex {
	border-collapse: collapse;
	border-radius: 0.8em;
	overflow: hidden;
	width: 100%;
	text-align: center;
	border: 1px solid #ccc;
}

#pokedex td {
	border: 1px solid #ccc
}

.back {
	border-collapse: collapse;
	border-radius: 0.8em;
	overflow: hidden;
	background-color: #eee;
	margin: 3px;
	height: 20px;
	text-align: center;
}
</style>
<script type="text/javascript" src="script/pokedex.js"></script>
<script type="text/javascript">
	function insert_pokemon() {
		document.frm.action = "insert_pokemon";
		document.frm.submit();
	}

	$(document).ready(function() {

		var url = "";

		$(".custom-control-input").change(function() {

			var allcb = $(".custom-control-input");
			var checkNum = 0;

			for (var i = 0; i < allcb.length; i++) {
				if (allcb[i].checked == true) {
					checkNum++;
					if (checkNum > 2) {
						alert("타입은 2개까지만 선택 가능합니다.");
						$(this).prop("checked", false);
						return false;
					}
				}
			}
			for (var i = 0; i < allcb.length; i++) {
				if (allcb[i].checked == true) {
					url += allcb[i].id + "=1&";
				}
			}
			url = url.slice(0, (url.length - 1));
			document.searchRequirement.action = "pokedex_list?" + url;
			document.searchRequirement.submit();
		});

	});
</script>
<div id="test123"></div>
<div style="margin: 20px;">
	<div>
		<form name="searchRequirement" action="">
			<table style="margin: 0 auto">
				<tr>
					<th colspan="2"><h4>검색조건</h4></th>
				</tr>
				<tr>
					<th bgcolor="#eee"
						style="width: 70px; text-align: center; border-radius: 1em">타입</th>
					<td><div class="custom-control custom-checkbox">
							<table>
								<tr>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.normal eq '1' }">checked</c:if>
										class="custom-control-input" name="normal" id="normal">
										<label class="custom-control-label" for="normal">노말&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.fighting eq '1' }">checked</c:if>
										class="custom-control-input" name="fighting" id="fighting">
										<label class="custom-control-label" for="fighting">격투&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.flying eq '1' }">checked</c:if>
										class="custom-control-input" name="flying" id="flying">
										<label class="custom-control-label" for="flying">비행&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.poison eq '1' }">checked</c:if>
										class="custom-control-input" name="poison" id="poison">
										<label class="custom-control-label" for="poison">독&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.ground eq '1' }">checked</c:if>
										class="custom-control-input" name="ground" id="ground">
										<label class="custom-control-label" for="ground">땅&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.rock eq '1' }">checked</c:if>
										class="custom-control-input" name="rock" id="rock"> <label
										class="custom-control-label" for="rock">바위&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.bug eq '1' }">checked</c:if>
										class="custom-control-input" name="bug" id="bug"> <label
										class="custom-control-label" for="bug">벌레&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.ghost eq '1' }">checked</c:if>
										class="custom-control-input" name="ghost" id="ghost">
										<label class="custom-control-label" for="ghost">고스트&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.steel eq '1' }">checked</c:if>
										class="custom-control-input" name="steel" id="steel">
										<label class="custom-control-label" for="steel">강철</label></td>
								</tr>
								<tr>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.fire eq '1' }">checked</c:if>
										class="custom-control-input" name="fire" id="fire"> <label
										class="custom-control-label" for="fire">불꽃&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.water eq '1' }">checked</c:if>
										class="custom-control-input" name="water" id="water">
										<label class="custom-control-label" for="water">물&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.grass eq '1' }">checked</c:if>
										class="custom-control-input" name="grass" id="grass">
										<label class="custom-control-label" for="grass">풀&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.electric eq '1' }">checked</c:if>
										class="custom-control-input" name="electric" id="electric">
										<label class="custom-control-label" for="electric">전기&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.psychic eq '1' }">checked</c:if>
										class="custom-control-input" name="psychic" id="psychic">
										<label class="custom-control-label" for="psychic">에스퍼&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.ice eq '1' }">checked</c:if>
										class="custom-control-input" name="ice" id="ice"> <label
										class="custom-control-label" for="ice">얼음&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.dragon eq '1' }">checked</c:if>
										class="custom-control-input" name="dragon" id="dragon">
										<label class="custom-control-label" for="dragon">드래곤&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.dark eq '1' }">checked</c:if>
										class="custom-control-input" name="dark" id="dark"> <label
										class="custom-control-label" for="dark">악&emsp;&emsp;</label></td>
									<td><input type="checkbox" value="1"
										<c:if test="${selectType.fairy eq '1' }">checked</c:if>
										class="custom-control-input" name="fairy" id="fairy">
										<label class="custom-control-label" for="fairy">페어리</label></td>
									<td></td>
								</tr>
							</table>
						</div></td>
				</tr>
				<tr>
					<th bgcolor="#eee"
						style="width: 70px; text-align: center; border-radius: 1em">정렬기준
						<input type="hidden" id="order" name="order" value="${order}">
					</th>
					<td><div class="div-row" style="text-align: center">
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-light"
									onclick="order_seq()">
									번호
									<c:if test="${order eq 'seq_asc' }">
										<i class="fas fa-caret-down"></i>
									</c:if>
									<c:if test="${order eq 'seq_desc' }">
										<i class="fas fa-caret-up"></i>
									</c:if>
								</button>
							</div>
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-light" onclick="order_cp()">
									CP
									<c:if test="${order eq 'cp_asc' }">
										<i class="fas fa-caret-down"></i>
									</c:if>
									<c:if test="${order eq 'cp_desc' }">
										<i class="fas fa-caret-up"></i>
									</c:if>
								</button>
							</div>
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-light"
									onclick="order_att()">
									공격력
									<c:if test="${order eq 'att_asc' }">
										<i class="fas fa-caret-down"></i>
									</c:if>
									<c:if test="${order eq 'att_desc' }">
										<i class="fas fa-caret-up"></i>
									</c:if>
								</button>
							</div>
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-light"
									onclick="order_def()">
									방어력
									<c:if test="${order eq 'def_asc' }">
										<i class="fas fa-caret-down"></i>
									</c:if>
									<c:if test="${order eq 'def_desc' }">
										<i class="fas fa-caret-up"></i>
									</c:if>
								</button>
							</div>
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-light" onclick="order_hp()">
									체력
									<c:if test="${order eq 'hp_asc' }">
										<i class="fas fa-caret-down"></i>
									</c:if>
									<c:if test="${order eq 'hp_desc' }">
										<i class="fas fa-caret-up"></i>
									</c:if>
								</button>
							</div>
							<div style="float: left; margin: 0 20px">
								<button type="button" class="btn btn-primary"
									onclick="order_refresh()">초기화</button>
							</div>
						</div></td>
				</tr>
				<tr>
					<th bgcolor="#eee"
						style="width: 70px; text-align: center; border-radius: 1em">이름검색
					</th>
					<td><div class="input-group">
							<input type="text" name="keyword" class="form-control"
								aria-describedby="button-addon2" value="${keyword }">
							<div class="input-group-append">
								<button onclick="pokedex_search()"
									class="btn btn-outline-secondary" type="button"
									id="button-addon2">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div></td>
				</tr>
			</table>
		</form>
	</div>
	<hr>
	<c:if test="${loginUser.grade == '2' }">
		<div style="text-align: right">
			<form name="frm" action="">
				<button type="button" class="btn btn-primary btn-sm"
					onclick="insert_pokemon()">포켓몬 등록</button>
				<hr>
			</form>
		</div>
	</c:if>
	<div>
		<table style="width: 90%" align="center">
			<tr>
				<c:forEach var="pokemon" items="${poList }" varStatus="status">
					<td style="width: 20%"><div id="divtest" style="margin: 5px;"
							onclick="location.href='pokedex_detail?po_seq=${pokemon.po_seq}'">
							<table id="pokedex">
								<tr>
									<th colspan="2" bgcolor="#eee">
									<c:set var="po_seq" value="${pokemon.po_seq}"></c:set>
									<c:choose>										
										<c:when test="${fn:length(po_seq) > 4 }">${fn:substring(po_seq, 0 , 3) }</c:when>
										<c:otherwise>${pokemon.po_seq }</c:otherwise>
									</c:choose>
										. ${pokemon.name } </th>
								</tr>
								<tr>
									<td colspan="2" style="height: 80px"><img width="110px"
										src="pokemonImages/${pokemon.image }"></td>
								</tr>
								<tr>
									<td colspan="2"><c:if test="${pokemon.bug eq '1' }">
											<img src="type/ico_kor_bug.jpg">
										</c:if> <c:if test="${pokemon.dark eq '1' }">
											<img src="type/ico_kor_dark.jpg">
										</c:if> <c:if test="${pokemon.dragon eq '1' }">
											<img src="type/ico_kor_dragon.jpg">
										</c:if> <c:if test="${pokemon.electric eq '1' }">
											<img src="type/ico_kor_electric.jpg">
										</c:if> <c:if test="${pokemon.fairy eq '1' }">
											<img src="type/ico_kor_fairy.jpg">
										</c:if> <c:if test="${pokemon.fighting eq '1' }">
											<img src="type/ico_kor_fighting.jpg">
										</c:if> <c:if test="${pokemon.fire eq '1' }">
											<img src="type/ico_kor_fire.jpg">
										</c:if> <c:if test="${pokemon.flying eq '1' }">
											<img src="type/ico_kor_flying.jpg">
										</c:if> <c:if test="${pokemon.ghost eq '1' }">
											<img src="type/ico_kor_ghost.jpg">
										</c:if> <c:if test="${pokemon.grass eq '1' }">
											<img src="type/ico_kor_grass.jpg">
										</c:if> <c:if test="${pokemon.ground eq '1' }">
											<img src="type/ico_kor_ground.jpg">
										</c:if> <c:if test="${pokemon.ice eq '1' }">
											<img src="type/ico_kor_ice.jpg">
										</c:if> <c:if test="${pokemon.normal eq '1' }">
											<img src="type/ico_kor_normal.jpg">
										</c:if> <c:if test="${pokemon.poison eq '1' }">
											<img src="type/ico_kor_poison.jpg">
										</c:if> <c:if test="${pokemon.psychic eq '1' }">
											<img src="type/ico_kor_psychic.jpg">
										</c:if> <c:if test="${pokemon.rock eq '1' }">
											<img src="type/ico_kor_rock.jpg">
										</c:if> <c:if test="${pokemon.steel eq '1' }">
											<img src="type/ico_kor_steel.jpg">
										</c:if> <c:if test="${pokemon.water eq '1' }">
											<img src="type/ico_kor_water.jpg">
										</c:if></td>
								</tr>
								<tr>
									<td><small>최대 CP</small></td>
									<td><div class="back">
											<small>${pokemon.max_cp }</small>
										</div></td>
								</tr>
								<tr>
									<td><small>공격력</small></td>
									<td><div class="back">
											<small>${pokemon.att }</small>
										</div></td>
								</tr>
								<tr>
									<td><small>방어력</small></td>
									<td><div class="back">
											<small>${pokemon.def }</small>
										</div></td>
								</tr>
								<tr>
									<td><small>체력</small></td>
									<td><div class="back">
											<small>${pokemon.hp }</small>
										</div></td>
								</tr>
							</table>
						</div><br></td>
					<c:if test="${(status.count%5)==0 }">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
<%@ include file="../footer.jsp"%>