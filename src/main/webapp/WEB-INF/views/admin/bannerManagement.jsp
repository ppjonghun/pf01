<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@include file="../user/mypageMenu.jsp"%>
<script type="text/javascript">
function used_banner(){
	var uCheck = document.bannerForm.useableCheckbox;
	var num = 0;
	for(var i = 0; i < uCheck.length; i++){
		if(uCheck[i].checked){
			num ++ ;
		}
	}
	if(num == 0){
		alert("체크된 공지글이 없습니다.");
		return false;
	}
	
	document.bannerForm.action = "banner_use";
	document.bannerForm.submit();
	
}


function notused_banner(){
	
	var uCheck = document.bannerForm.usingCheckbox;
	var num = 0;
	for(var i = 0; i < uCheck.length; i++){
		if(uCheck[i].checked){
			num ++ ;
		}
	}
	if(num == 0){
		alert("체크된 공지글이 없습니다.");
		return false;
	}
	
	document.bannerForm.action = "banner_notuse";
	document.bannerForm.submit();
	
}
</script>
<div style="margin: 20px; height: 500px">
	<article style="float: right; width: 730px;">
		<form name="bannerForm" method="post" action="">
			<table class="table">
				<thead>
					<tr>
						<th colspan=""><h1>배너 설정</h1></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>사용가능한 공지글</td>
					</tr>
					<tr>
						<td><c:forEach var="banner" items="${bannerList}"
								varStatus="status">
								<div>
									<c:if test="${banner.status eq '0' }">
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="${status.count }" name="useableCheckbox" value="${banner.bseq}">&nbsp;<label
												class="custom-control-label" for="${status.count }">
												${banner.title}</label>
										</div>
									</c:if>
								</div>
							</c:forEach></td>
					</tr>
					<tr>
						<td><div align="center">

								<button type="button" class="btn btn-light btn-sm" onclick="notused_banner()">
									<i class="fas fa-caret-up" style="font-size: 25px"></i>
								</button>
								<button type="button" class="btn btn-light btn-sm" onclick="used_banner()">
									<i class="fas fa-caret-down" style="font-size: 25px"></i>
								</button>
							</div></td>
					</tr>
					<tr>
						<td>사용중인 공지글</td>
					</tr>
					<tr>
						<td><c:forEach var="banner" items="${bannerList}" varStatus="status">
								<div>
									<c:if test="${banner.status eq '1' }" >
								<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="${(status.count * -1) }" name="usingCheckbox" value="${banner.bseq}">&nbsp;<label
												class="custom-control-label" for="${ (status.count * -1 )}">
												${banner.title}</label>
										</div>
							</c:if>
								</div>
							</c:forEach></td>
					</tr>
				</tbody>
			</table>
		</form>
	</article>
</div>

<%@include file="../footer.jsp"%>