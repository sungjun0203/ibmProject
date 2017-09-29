<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/bootstrap/cosmo.css" />
<link rel="stylesheet/less" type="text/css"
	href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css"
	href="/resources/bootstrap/variables.less" />
<html>
<head>
<title>공지사항 읽기</title>
</head>
<body>
	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>
	<form id="noticeRead" name="noticeRead" mothod="POST" action="">
		<div class="container">
			<table class="table table_striped" style="border: solid">
				<thead>
					<tr>
						<th>공지사항 번호</th>
						<th>${noticeReadInformation.NOTICE_NUMBER}</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						관리자
						<td name="cc" id="cc">${noticeReadInformation.NOTICE_WRITER}</td>
						<td>등록일</td>
						<td>${noticeReadInformation.NOTICE_DATE}</td>
					</tr>
				</tbody>
			</table>

			<div class="panel panel-info">
				<div class="panel-heading">제목:
					${fn:replace(noticeReadInformation.NOTICE_TITLE, cn, br)}</div>
			</div>
			<p>${fn:replace(noticeReadInformation.NOTICE_CONTENT, cn, br)}
			<p>
			<div style="text-align: right; margin-top: 5px; margin-bottom: 5px">
				<button type="button" class="btn btn-warning btn-sm" onclick="noticeBack()">뒤로가기</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="noticeDelete()">삭제</button>
			</div>

		</div>

		<input type="hidden" id="noticeNumber" name="noticeNumber"> <input
			type="hidden" id="noticeTitle" name="noticeTitle"> <input
			type="hidden" id="noticeWriter" name="noticeWriter">
	</form>

</body>
</html>



<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>
</form>
</body>
</html>

<script>
	function noticeSubmit() {
		$("#noticeWrite").submit();
	}
	function noticeBack() {
		location.href = "/main/main"
	}
	
	function noticeDelete(){
		
		var noticeNumber = ${noticeReadInformation.NOTICE_NUMBER};
		
		$.ajax({
	        url : "/notice/noticeDelete",
	        dataType : "text",
	        type : "POST",
	        data : {"noticeNumber":noticeNumber},
	        success: function(resultString) {
	            if(resultString=="successDelete") {
	            	alert("관리자 인증 성공");
	            	$("#noticeRead").attr("action", "/notice/noticeList");
	            	$("#noticeRead").submit();
	            }
	            else{
	            	alert("당신은 관리자가 아닙니다");
	            }
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"error:"+error);
	        }
	    });
	}
	
	function main() {
		location.href = "/main/main";
	}
	function notice() {
		location.href = "/notice/noticeList";
	}
	function myInformation() {
		location.href = "/my/index";
	}
	function admin() {
		location.href = "/admin/index";
	}
	
	function logout() {
		$.ajax({
	        url : "/common/logout",
	        type : "POST",
	        success: function(data) {
	            location.href="/";
	        }
	    });
	}
</script>