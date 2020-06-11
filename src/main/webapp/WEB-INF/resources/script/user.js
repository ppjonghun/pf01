/**
 * 
 */



function go_login(){
	var theForm = document.frm;
	
	if(theForm.userid.value==""){
		alert("아이디를 입력하세요.");
		return false;
	}
	if(theForm.pwd.value==""){
		alert("비밀번호를 입력하세요.");
		return false;
	}
	
	theForm.action = "login";
	theForm.submit();
}

function id_check(){
	var theForm = document.frm;
	
	if(theForm.userid.value==""){
		alert("아이디를 입력해 주세요.");
		return false;
	}

	var url = "id_check?userid=" + theForm.userid.value;
	
	window.open(url,"_blank","width=400, height=300, " +
				"menubar=no, scrollbar=yes, toolbar=no, resizeable=no");
}

function id_ok(){
	  opener.frm.userid.value=document.frm.userid.value; 
	  opener.frm.idCheck.value=document.frm.userid.value;
	  self.close();
	}

function find_zip_num(){
	var url = "find_zip_num";
	
	window.open(url,"_blank","width=600, height=800, " +
	"menubar=no, scrollbar=yes, toolbar=no, resizeable=no");
}

function go_join(){
	var theForm = document.frm;
	
	if(theForm.userid.value==""){
		alert("아이디를 입력하세요.");
		theForm.userid.focus();
		return false;
	}else if(theForm.idCheck.value==""){
		alert("아이디 중복확인이 필요합니다.");
		return false;
	}else if(theForm.pwd.value==""){
		alert("비밀번호를 입력하세요.");
		theForm.pwd.focus();
		return false;
	}else if(theForm.pwdCheck.value==""){
		alert("비밀번호 확인을 입력하세요.");
		theForm.pwdCheck.focus();
		return false;
	}else if(theForm.pwd.value != theForm.pwdCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		theForm.pwdCheck.focus();
		return false;
	}else if(theForm.name.value==""){
		alert("이름을 입력하세요.");
		theForm.name.focus();
		return false;
	}else if(theForm.birth.value==""){
		alert("생년월일을 입력하세요.");
		theForm.birth.focus();
		return false;
	}else if(theForm.gender.value==""){
		alert("성별을 선택하세요.");
		return false;
	}else if(theForm.phone2.value==""){
		alert("전화번호 앞자리를 입력하세요.");
		theForm.phone2.focus();
		return false;
	}else if(theForm.phone3.value==""){
		alert("전화번호 뒷자리를 입력하세요.");
		theForm.phone3.focus();
		return false;
	}else if(theForm.email.value==""){
		alert("이메일을 입력하세요");
		theForm.email.focus();
		return false;
	}else if(theForm.contract.value=="" || theForm.contract.value=="no"){
		alert("약관에 동의해주세요.");
		return false;
	}
	
	theForm.phone.value = theForm.phone1.value+"-"+theForm.phone2.value+"-"+theForm.phone3.value;
	theForm.address.value = theForm.addr1.value+"_"+ theForm.addr2.value;
	
	theForm.action = "join";
	theForm.submit();
}


