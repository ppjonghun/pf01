/**
 * 
 */
function po_seq_check(){
	if(document.frm.seq.value==""){
		alert("번호를 입력하세요.");
		return false;
	}
	
	if(document.frm.anotherForm.checked){
	
		if(document.frm.formName.value==""){
			alert("폼이름을 입력하세요.");
			return false;
		}
		
		var url = "po_seq_check?seq="+document.frm.seq.value+
		"&formName="+document.frm.formName.value + "&anotherForm=" + document.frm.anotherForm.value;
	}else{
		var url = "po_seq_check?seq="+document.frm.seq.value;
	}
	
	window.open(url,"_blank","width=600, height=400, " +
	"menubar=no, scrollbar=yes, toolbar=no, resizeable=no");
}

function seq_ok(){
	if(document.frm.anotherForm.checked){
		if(document.frm.formName.value==""){
			alert("폼이름을 입력하세요.");
			return false;
		}
		
		if(document.frm.po_seq.value != document.frm.seq.value + "_" + document.frm.formName.value){
			alert("중복체크를 해주세요.");
			return false;
		}
		opener.frm.po_seq.value = document.frm.seq.value + "_" + document.frm.formName.value;
	}else{
		
		if(document.frm.po_seq.value != document.frm.seq.value){
			alert("중복체크를 해주세요.");
			return false;
		}
		opener.frm.po_seq.value = document.frm.seq.value;
	}
	opener.frm.seq.value = document.frm.seq.value;
	opener.frm.anotherForm.value = document.frm.anotherForm.value;
	opener.frm.formName.value = document.frm.formName.value;
	
	opener.frm.seq.readOnly = true;
	opener.frm.formName.readOnly = true;
	
	self.close();
}

function po_insert(){
	var num = 0;
	var theForm = document.frm;
	
	if(theForm.normal.checked){
		num++;
	}	
	if(theForm.fighting.checked){
		num++;
	}
	if(theForm.flying.checked){
		num++;
	}
	if(theForm.poison.checked){
		num++;
	}
	if(theForm.ground.checked){
		num++;
	}
	if(theForm.rock.checked){
		num++;
	}
	if(theForm.bug.checked){
		num++;
	}
	if(theForm.ghost.checked){
		num++;
	}
	if(theForm.steel.checked){
		num++;
	}
	if(theForm.fire.checked){
		num++;
	}
	if(theForm.water.checked){
		num++;
	}
	if(theForm.grass.checked){
		num++;
	}
	if(theForm.electric.checked){
		num++;
	}
	if(theForm.psychic.checked){
		num++;
	}
	if(theForm.ice.checked){
		num++;
	}
	if(theForm.dragon.checked){
		num++;
	}
	if(theForm.dark.checked){
		num++;
	}
	if(theForm.fairy.checked){
		num++;
	}
	
	if(num==0){
		alert("타입을 선택하세요.");
		return false;
	}else if(theForm.seq.value==""){
		alert("번호를 입력하세요.");
		return false;
	}else if(theForm.po_seq.value==""){
		alert("번호 중복체크를 해주세요.");
		return false;
	}else if(theForm.name.value==""){
		alert("이름을 입력하세요.");
		return false;
	}else if(theForm.max_cp.value==""){
		alert("최대 CP를 입력하세요.");
		return false;
	}else if(theForm.att.value==""){
		alert("공격력을 입력하세요.");
		return false;
	}else if(theForm.def.value==""){
		alert("방어력을 입력하세요.");
		return false;
	}else if(theForm.hp.value==""){
		alert("체력을 입력하세요.");
		return false;
	}else if(theForm.uploadFile.value==""){
		alert("사진을 등록하세요.");
		return false;
	}
	
	
	document.frm.action="insert_pokemon";
	document.frm.submit();
}

function go_update(){
	var num = 0;
	var theForm = document.frm;
	
	if(theForm.normal.checked){
		num++;
	}	
	if(theForm.fighting.checked){
		num++;
	}
	if(theForm.flying.checked){
		num++;
	}
	if(theForm.poison.checked){
		num++;
	}
	if(theForm.ground.checked){
		num++;
	}
	if(theForm.rock.checked){
		num++;
	}
	if(theForm.bug.checked){
		num++;
	}
	if(theForm.ghost.checked){
		num++;
	}
	if(theForm.steel.checked){
		num++;
	}
	if(theForm.fire.checked){
		num++;
	}
	if(theForm.water.checked){
		num++;
	}
	if(theForm.grass.checked){
		num++;
	}
	if(theForm.electric.checked){
		num++;
	}
	if(theForm.psychic.checked){
		num++;
	}
	if(theForm.ice.checked){
		num++;
	}
	if(theForm.dragon.checked){
		num++;
	}
	if(theForm.dark.checked){
		num++;
	}
	if(theForm.fairy.checked){
		num++;
	}
	
	if(num==0){
		alert("타입을 선택하세요.");
		return false;
	}else if(theForm.name.value==""){
		alert("이름을 입력하세요.");
		return false;
	}else if(theForm.max_cp.value==""){
		alert("최대 CP를 입력하세요.");
		return false;
	}else if(theForm.att.value==""){
		alert("공격력을 입력하세요.");
		return false;
	}else if(theForm.def.value==""){
		alert("방어력을 입력하세요.");
		return false;
	}else if(theForm.hp.value==""){
		alert("체력을 입력하세요.");
		return false;
	}
	
	
	document.frm.action="update_pokemon";
	document.frm.submit();
}

function order_seq() {
	var order = "";
	order = document.getElementById("order").value;
	var str ="";
	if(order == "normal"){
		 str = "order=seq_desc";
		 document.searchRequirement.order.value="seq_desc";
		str = make_url(str);
	}else if(order == "seq_asc"){
		 str = "order=seq_asc";
		 document.searchRequirement.order.value="seq_asc";
		str = make_url(str);		
	}else if(order == "seq_desc"){
		 str = "order=seq_desc";
		 document.searchRequirement.order.value="seq_desc";
		str = make_url(str);			
	}else{
		str = "order=seq_desc";
		 document.searchRequirement.order.value="seq_desc";
		str = make_url(str);
	}
	

	document.searchRequirement.action = str;
	document.searchRequirement.submit();
}

function order_cp() {
	var order = "";
	order = document.getElementById("order").value;
	var str ="";
	if(order == "normal"){
		 str = "order=cp_desc";
		 document.searchRequirement.order.value="cp_desc";
		str = make_url(str);
	}else if(order == "cp_asc"){
		 str = "order=cp_asc";
		 document.searchRequirement.order.value="cp_asc";
		str = make_url(str);		
	}else if(order == "cp_desc"){
		 str = "order=cp_desc";
		 document.searchRequirement.order.value="cp_desc";
		str = make_url(str);			
	}else{
		str = "order=cp_desc";
		 document.searchRequirement.order.value="cp_desc";
		str = make_url(str);
	}

	document.searchRequirement.action = str;
	document.searchRequirement.submit();
}

function order_att() {
	var order = "";
	order = document.getElementById("order").value;
	var str ="";
	if(order == "normal"){
		 str = "order=att_desc";
		 document.searchRequirement.order.value="att_desc";
		str = make_url(str);
	}else if(order == "att_asc"){
		 str = "order=att_asc";
		 document.searchRequirement.order.value="att_asc";
		str = make_url(str);		
	}else if(order == "att_desc"){
		 str = "order=att_desc";
		 document.searchRequirement.order.value="att_desc";
		str = make_url(str);			
	}else{
		 str = "order=att_desc";
		 document.searchRequirement.order.value="att_desc";
		str = make_url(str);
	}

	document.searchRequirement.action = str;
	document.searchRequirement.submit();
}

function order_def() {
	var order = "";
	order = document.getElementById("order").value;
	var str ="";
	if(order == "normal"){
		 str = "order=def_desc";
		 document.searchRequirement.order.value="def_desc";
		str = make_url(str);
	}else if(order == "def_asc"){
		 str = "order=def_asc";
		 document.searchRequirement.order.value="def_asc";
		str = make_url(str);		
	}else if(order == "def_desc"){
		 str = "order=def_desc";
		 document.searchRequirement.order.value="def_desc";
		str = make_url(str);			
	}else{
		str = "order=def_desc";
		 document.searchRequirement.order.value="def_desc";
		str = make_url(str);
	}

	document.searchRequirement.action = str;
	document.searchRequirement.submit();
}

function order_hp() {
	var order = "";
	order = document.getElementById("order").value;
	var str ="";
	if(order == "normal"){
		 str = "order=hp_desc";
		 document.searchRequirement.order.value="hp_desc";
		str = make_url(str);
	}else if(order == "hp_asc"){
		 str = "order=hp_asc";
		 document.searchRequirement.order.value="hp_asc";
		str = make_url(str);		
	}else if(order == "hp_desc"){
		 str = "order=hp_desc";
		 document.searchRequirement.order.value="hp_desc";
		str = make_url(str);			
	}else{
		str = "order=hp_desc";
		 document.searchRequirement.order.value="hp_desc";
		str = make_url(str);
	}

	document.searchRequirement.action = str;
	document.searchRequirement.submit();
}

function order_refresh(){
	document.searchRequirement.order.value = "refresh";
	document.searchRequirement.action="pokedex_list";
	document.searchRequirement.submit();
}

function pokedex_search(){
	if(document.searchRequirement.keyword.value == ""){
		alert("검색단어를 입력하세요.");
		document.searchRequirement.keyword.focus();
		return false;
	}
	
	document.searchRequirement.action="pokedex_list";
	document.searchRequirement.submit();
}

function make_url(str){
	var url = "pokedex_list?";
	var allcb = $(".custom-control-input");
	
	for (var i = 0; i < allcb.length; i++) {
		if (allcb[i].checked == true) {
			url += allcb[i].id;
			url += "=1&";
		}
	}
	url += str;
	return url;
}



function onlyNumber(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
			|| keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		return false;
}

function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if (keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39)
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}