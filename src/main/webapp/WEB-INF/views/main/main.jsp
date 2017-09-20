<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: IONCOMMUNICATIONS
  Date: 2017-07-25
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

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
<title>메인</title>

</head>
<body>

	<div class="page-header">
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a onclick="main()" class="navbar-brand">IBM Board Project</a>
				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav navbar-nav">

						<li><a onclick="notice()">공지사항</a></li>
						<li><a onclick="notice()">내 정보</a></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><a target="_blank" onclick="admin()">관리자</a></li>
						<li><a target="_blank" style="color:red" onclick="logout();">로그아웃</a></li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="container">

			<div style="height: 30%">

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

						<table class="table table-striped table-hover text-center">
							<thead>
								<tr class="warning">
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<td>2</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>
								<tr>
									<td>3</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
								</tr>

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
							
								<li class="list-group-item">박성준</li>
								<li class="list-group-item">sungjun0204@naver.com</li>
								<li class="list-group-item"><span class="badge">14</span>
									내가 쓴 글</li>
								<li class="list-group-item"><span class="badge">2</span>
									내가 쓴 댓글</li>
								
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div>
				&nbsp;
				<div class="col-sm-12"
					style="margin-top: 11px; margin-bottom: 11px;">

					<div class="col-sm-9">
						<button class="btn btn-primary" onclick="boardWrite();">
							글쓰기</button>
					</div>

					<div class="col-sm-3">
						<select class="form-control" id="select" style="height: 40px;">
							<option>등록일 순(올림)</option>
							<option>등록일 순(내림)</option>
							<option>좋아요 기준</option>
						</select>
					</div>

				</div>
				<form id="boardReadForm" name="boardReadForm" method="POST" action="/board/boardRead">
				<input type = "hidden" id="boardNumber" name="boardNumber">
					<div class="col-sm-12">
						<table class="table table-striped table-hover text-center " style=""">
							<thead>
								<tr class="info">
									<td width="5%">번호</td>
									<td width="40%">제목</td>
									<td width="10%">작성자</td>
									<td width="20%">등록일</td>
									<td width="25%">좋아요</td>
								</tr>
							</thead>

							<tbody style="text-align: center;" >

							<c:forEach items="${boardList}" var="boardList">
								<tr>
									<td width="5%"  >${boardList.BOARD_NUMBER}</td>
									<td width="40%" onclick="boardRead(${boardList.BOARD_NUMBER})">${boardList.BOARD_TITLE}</td>
									<td width="10%">${boardList.BOARD_WRITER}</td>
									<td width="20%">${boardList.BOARD_DATE}</td>
									<td>
										<span class="badge">2</span>
												
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
						&nbsp;
				</form>
			</div>
				 
			</div>
		</div>
	</div>

	<div class="modal-footer">
		<center>
			<p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
		</center>
	</div>

</body>

<script language="javascript" type="text/javascript">

	function boardRead(seq){
		alert(seq);
		$('#boardNumber').val(seq);
		$('#boardReadForm').submit();
		
	}
	
	function logout(){
		
		$.ajax({
            url : "/common/logout",
            type : "POST",
            success: function(data) {
                location.href="/";
            }
        });
	}

	function main() {
		location.reload();
	}
	function notice() {
		location.href = "/notice/noticeList";
	}
	function dating() {
		location.href = "/board/dating";
	}
	function meeting() {
		location.href = "/board/meeting";
	}
	function admin() {
		location.href = "/admin/index";
	}
	function boardWrite() {
		location.href = "/board/boardWrite";
	}
//  End -->
</script>


</html>