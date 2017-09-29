<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"type="text/javascript"></script>
<link rel="stylesheet" type="text/css"	href="/resources/bootstrap/cosmo.css" />
<link rel="stylesheet/less" type="text/css"	href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css"	href="/resources/bootstrap/variables.less" />

<html>
<head>
<title>메인</title>

</head>
<body >

	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>

	<div>
		<div class="container">

<div style="height: 30%">

<form id="noticeReadForm" name="noticeReadForm" method="POST" action="">
<input type="hidden" id="noticeNumber" name="noticeNumber">
</form>
				<div class="col-sm-12">
					<div class="col-sm-8">
						&nbsp;
						<div class="col-sm-12"
							style="margin-top: 11px; margin-bottom: 11px;">
							<span class="label label-primary">공지사항</span> <span
								class="label label-default" style="float: right"
								name="noticeMore" id="noticeMore" onclick="notice()">더 보기
							</span>

						</div>

						<table class="table table-striped table-hover text-center ">
							<thead>
								<tr style="background-color :#cc0000">
									<td width = "40%" style="color:white">제목</th>
									<td width = "30%" style="color:white">작성자</th>
									<td width = "30%" style="color:white">등록일</th>
								</tr>
							</thead>
							<tbody>
<c:forEach items="${noticeInformation}" var="noticeList">
								<tr>
									<td width = "40%" onClick="noticeClick(${noticeList.NOTICE_NUMBER})">${noticeList.NOTICE_TITLE}</td>
									<td width = "30%">${noticeList.NOTICE_WRITER}</td>
									<td width = "30%">${noticeList.NOTICE_DATE}</td>
								</tr>
</c:forEach>
							</tbody>
						</table>
					</div>

					<div class="col-sm-4">

						&nbsp;
						<div class="col-sm-12"
							style="margin-top: 11px; margin-bottom: 11px;">
							<span class="label label-primary">내 정보</span>
						</div>

						<div class="col-sm-12">

							<ul class="list-group">
							
								<li class="list-group-item">- IBM GBS 3조 -</li>
								<li class="list-group-item">${userEmail}</li>
								<li class="list-group-item" style="cursor:pointer;" onclick="myInformation();"><span class="badge">${myCountInformation.myWriteCount}</span>
									내가 쓴 글</li>
								<li class="list-group-item" style="cursor:pointer;" onclick="myInformation();"><span class="badge">${myCountInformation.myReplyCount}</span>
									내가 쓴 댓글</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div>
				&nbsp;
				<div class="col-sm-12" 	style="margin-top: 11px; margin-bottom: 11px; ">

					<div class="col-sm-9">
						<button class="btn btn-primary" onclick="boardWrite();">글쓰기</button>
					</div>

						<div class="col-sm-2">
							<select class="form-control" id="boardArraySelect" name="boardArraySelect" style="height: 40px;">
								<option value="normal">------- 정렬 -------</option>
								<option value="fastWrite">등록일 빠른 순</option>
								<option value="slowWrite">등록일 느린 순</option>
								<option value="likeMany">좋아요 많은 순</option>
								<option value="likeSmall">좋아요 적은 순</option>
							</select>
						</div>
					
					<div class="col-sm-1">
						<button tyle="button" class="btn btn-success" onclick="arrayChange();">적용</button>
					</div>


				</div>
				<form id="boardReadForm" name="boardReadForm" method="GET" action="/board/boardRead">
				<input type = "hidden" id="boardNumber" name="boardNumber">
				<input type = "hidden" id="selectArray" name="selectArray">
					<div class="col-sm-12" style="padding-left:30px; padding-right:40px">
						<table class="table table-striped table-hover text-center" >
							<thead>
								<tr style="background-color :#485563">
									<td width="5%" style="color:white">번호</td>
									<td width="40%" style="color:white">제목</td>
									<td width="10%" style="color:white">작성자</td>
									<td width="20%" style="color:white">등록일</td>
									<td width="25%" style="color:white">좋아요 수</td>
								</tr>
							</thead>

							<tbody style="text-align: center;" >

							<c:forEach items="${boardList}" var="boardList">
								<tr>
									<td width="10%" style="text-overflow:ellipsis; overflow:hidden;"> <nobr>${boardList.BOARD_NUMBER}</td>
									<td width="40%" style="cursor:pointer;" onclick="boardRead(${boardList.BOARD_NUMBER})">${boardList.BOARD_TITLE}</td>
									<td width="10%" style="text-overflow : ellipsis; overflow:hidden;">${boardList.BOARD_WRITER}</td>
									<td width="20%" style="text-overflow : ellipsis; overflow:hidden;">${boardList.BOARD_DATE}</td>
									<td>
										<span class="badge">${boardList.LIKE_COUNT}</span>
												
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						&nbsp;
					</div>
				</form>
			</div>
			</div>
		</div>
	<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>
</body>

<script language="javascript" type="text/javascript">


	function noticeClick(seq){
		$("#noticeNumber").val(seq);
		$("#noticeReadForm").attr("action","/notice/noticeRead");
		$("#noticeReadForm").submit();
	}

	
	function arrayChange(){
		var selectValue = $("#boardArraySelect option:selected").val();
		$("#selectArray").val(selectValue);
		
		$("#boardReadForm").attr("action", "/main/main");
		$("#boardReadForm").submit();
		
	}

	function boardRead(seq){
		$('#boardNumber').val(seq);
		$('#boardReadForm').submit();
	}
	
	function noticeRead(seq){
		$('#boardNumber').val(seq);
		$('#boardReadForm').submit();
	}
	
	function main() {
		location.href = "/main/main";
	}
	
	function boardWrite() {
		location.href = "/board/boardWrite";
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
//  End -->
</script>


</html>