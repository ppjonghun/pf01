/**
 * 
 */


		
function go_board_write(){
	location.href = "board_write";
}

function board_insert(){
	
	if(document.frm.kind.checked){
		if(document.frm.uploadFile.value==""){
			alert("이미지를 등록하세요.");
			return false;
		}
	}
	
	if(document.frm.title.value==""){
		alert("제목을 입력하세요.");
		document.frm.title.focus();
		return false;
	}else if(document.frm.content.value==""){
		alert("내용을 입력하세요.");
		document.frm.content.focus();
		return false;
	}else if(document.frm.uploadFile.value!=""){		
		pathpoint = document.frm.uploadFile.value.lastIndexOf('.');
		filepoint = document.frm.uploadFile.value.substring(pathpoint+1,document.frm.uploadFile.length);
		filetype = filepoint.toLowerCase();
		if(filetype=='jpg' || filetype=='gif' || filetype=='png' || filetype=='jpeg' || filetype=='bmp') {
			// 정상적인 이미지 확장자 파일인 경우
		} else {
			alert('첨부파일은 이미지만 가능합니다.');
			parentObj  = document.frm.uploadFile.parentNode
			node = parentObj.replaceChild(document.frm.uploadFile.cloneNode(true),obj);
			return false;
		}
	}
	
	document.frm.action="board_write";
	document.frm.submit();
}