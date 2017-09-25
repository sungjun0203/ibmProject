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
			<p>네 정보는 3조가 가져간다.</p>
			<small>IBM GBS 3조 <cite title="Source Title"></cite></small>
		</blockquote>
		
		<div class =col-sm-12">
			<div class="col-sm-6">
			<p class="text-primary"> - 내가 쓴 글 - </p>
			
				<table class="table table-striped table-hover "> 
				  <thead>
				    <tr>
				      <th>#</th>
				      <th>Column heading</th>
				      <th>Column heading</th>
				      <th>Column heading</th>
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
				    <tr class="info">
				      <td>3</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="success">
				      <td>4</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="danger">
				      <td>5</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="warning">
				      <td>6</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="active">
				      <td>7</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				  </tbody>
				</table> 
			</div>
			
			<div class="col-sm-6">
			
			<p class="text-primary"> - 내가 쓴 댓글 - </p>
				<table class="table table-striped table-hover ">
				  <thead>
				    <tr>
				      <th>#</th>
				      <th>Column heading</th>
				      <th>Column heading</th>
				      <th>Column heading</th>
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
				    <tr class="info">
				      <td>3</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="success">
				      <td>4</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="danger">
				      <td>5</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="warning">
				      <td>6</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
				    <tr class="active">
				      <td>7</td>
				      <td>Column content</td>
				      <td>Column content</td>
				      <td>Column content</td>
				    </tr>
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
