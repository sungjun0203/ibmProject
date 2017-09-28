<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<script src="http://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<link rel="stylesheet" type="text/css" 	href="/resources/bootstrap/cosmo.css" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less" />

<html>
<head>
<title>내 정보</title>

</head>
<body>
	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>

	<div class="container">

		<blockquote>
			<p>관리자페이지</p>
			<small>IBM GBS 3조 <cite title="Source Title"></cite></small>
		</blockquote>
		
		<div class =col-sm-12">
			<div class="col-sm-6">
				<div class="col-sm-12">
					<p class="text-primary col-sm-6"> - 쓴 글 검색 - </p>
					<div class="form-group col-sm-6">
					  <div class="input-group">
					    <input type="text" class="form-control">
					    <span class="input-group-btn">
					      <button class="btn btn-default" type="button" onClick="">검색</button>
					    </span>
					  </div>
					</div>
				</div>

			
				<table class="table table-striped table-hover "> 
				  <thead>
				    <tr class="warning">
				      <th>#</th>
				      <th>제목</th>
				      <th>날짜</th>
				    </tr>
				  </thead>
				  <tbody>
				 <c:forEach items="${myWrite}" var="myWrite">
				    <tr class ="active">
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myWrite.BOARD_NUMBER}</td>
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myWrite.BOARD_TITLE}</td>
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myWrite.BOARD_DATE}</td>
				    </tr>
				    </c:forEach>
				  </tbody>
				</table> 
			</div>
			
			<div class="col-sm-6">
			
			<div class="col-sm-12">
					<p class="text-primary col-sm-6"> - 쓴 댓글 검색 - </p>
					<div class="form-group col-sm-6">
					  <div class="input-group">
					    <input type="text" class="form-control">
					    <span class="input-group-btn">
					      <button class="btn btn-default" type="button">검색</button>
					    </span>
					  </div>
					</div>
				</div>
			
			
				<table class="table table-striped table-hover " style="table-layout:fixed ">
				  <thead>
				    <tr class="info">
				      <th>글 제목</th>
				      <th>댓글 내용</th>
				      <th>날짜</th>
				    </tr>
				  </thead>
				  
				  
				  
				  <tbody>
				  <c:forEach items="${myReply}" var="myReply">
				    <tr class="active">
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myReply.BOARD_TITLE}</td>
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myReply.REPLY_CONTENT}</td>
				      <td style="text-overflow:ellipsis; overflow:hidden"> <nobr>${myReply.REPLY_DATE}</td>
				    </tr>
				   </c:forEach>
				    
				  </tbody>
				</table> 
			</div>
		
		</div>

	</div>

	<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>

</body>

<script language="javascript" type="text/javascript">

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


    //  End -->
</script>


</html>
