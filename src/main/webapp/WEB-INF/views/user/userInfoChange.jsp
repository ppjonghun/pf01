<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="mypageMenu.jsp"%>
<script type="text/javascript" src="script/user.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(document.frm.phone.value!=null){
		var phone=document.frm.phone.value;
		var phone2 = phone.substring(4,8);
		var phone3 = phone.substring(9);		
		document.frm.phone2.value = phone2;
		document.frm.phone3.value = phone3;
		}
		
		if(document.frm.address.value!=null){
		var address = document.frm.address.value;
		var addr = address.split("_");
		document.frm.addr1.value=addr[0];
		document.frm.addr2.value=addr[1];
		}
	});
	
	function go_change(){
		var theForm = document.frm;
		if(theForm.name.value==""){
			alert("이름을 입력하세요.");
			theForm.name.focus();
			return false;
		}else if(theForm.birth.value==""){
			alert("생년월일을 입력하세요.");
			theForm.birth.focus();
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
			alert("이메일을 입력하세요.");
			theForm.email.focus();
			return false;
		}
		
		theForm.phone.value = theForm.phone1.value+"-"+theForm.phone2.value+"-"+theForm.phone3.value;
		theForm.address.value = theForm.addr1.value+"_"+ theForm.addr2.value;
		
		theForm.action = "user_info_change";
		theForm.submit();
	}
</script>
<div style="margin: 20px; height: 600px">
	<article style="float: right; width: 730px;">
		<div class="form-group">
			<form name="frm" method="post" action="">
				<table class="table">
					<thead>
						<tr>
							<th colspan="2"><h1>회원 정보 변경</h1></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아이디<input type="hidden" name="userid" value="${loginUser.userid }"></td>
							<td><c:if test="${loginUser.grade eq '2' }">
									<i class="fas fa-hammer"></i>&nbsp;</c:if>${loginUser.userid }</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" class="form-control form-control-sm"
								value="${loginUser.name }" name="name"></td>
						</tr>
						<tr>
							<td>생년월일</td>
							<td><input type="text" class="form-control form-control-sm"
								id="birth" name="birth" placeholder="ex)20200101" value="${loginUser.birth }"></td>
						</tr>
						<tr>
							<td>전화번호<input type="hidden" value="${loginUser.phone}" name="phone"></td>
							<td><div class="form-row">
									<div class="col-3">
										<select name="phone1" class="form-control form-control-sm"
											id="validationCustom04" required>											
											<option value="010">010</option>
											<option value="011">011</option>
										</select>
									</div>
									<div class="col-3">
										<input type="text" name="phone2" value=""
											onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' maxlength="4"
											class="form-control form-control-sm" id="validationCustom03"
											required>
									</div>
									<div class="col-md-3 mb-3">
										<input type="text" name="phone3" value=""
											onkeydown='return onlyNumber(event)'
											onkeyup='removeChar(event)' maxlength="4"
											class="form-control form-control-sm" id="validationCustom05"
											required>
									</div>
								</div></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input value="${loginUser.email }" type="text" name="email" id="email" class="form-control form-control-sm" id="exampleFormControlInput1" placeholder="name@example.com"></td>
						</tr>
						<tr>
							<td>주소<input type="hidden" name="address" value="${loginUser.address }"></td>
							<td><div class="form-inline"><input type="text" class="form-control form-control-sm"
								id="zip_num" name="zip_num" readonly="readonly" value="${loginUser.zip_num }"> &nbsp;&nbsp;
								<button type="button" onclick="find_zip_num()" class="btn btn-light btn-sm">주소찾기</button>
								</div>
							<input type="text" class="form-control form-control-sm"
								id="addr1" name="addr1" readonly="readonly"> 
								<input type="text" class="form-control form-control-sm" 
								id="addr2" name="addr2"></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${loginUser.indate }</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right"><button type="button" class="btn btn-primary" onclick="go_change()">변경</button></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</article>
</div>

<%@include file="../footer.jsp"%>