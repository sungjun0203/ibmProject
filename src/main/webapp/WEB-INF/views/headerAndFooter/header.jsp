<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<script src="http://code.jquery.com/jquery-2.1.1.min.js"type="text/javascript"></script>
<link rel="stylesheet" type="text/css"	href="/resources/bootstrap/cosmo.css" />
<link rel="stylesheet/less" type="text/css"	href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css"	href="/resources/bootstrap/variables.less" />
<html>
<head>
<title>Insert title here</title>
</head>
<body>

<div class="page-header">
		<div class="navbar navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<a onclick="main()" class="navbar-brand" style="cursor:pointer;">IBM Board Project</a>
				</div>
				<div class="navbar-collapse collapse" id="navbar-main">
					<ul class="nav navbar-nav">

						<li><a style="cursor:pointer;" onclick="notice()">공지사항</a></li>
						<li><a style="cursor:pointer;" onclick="myInformation()">내 정보</a></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><a style="cursor:pointer;" target="_blank" onclick="admin()">관리자</a></li>
						<li><a style="cursor:pointer;" target="_blank" style="color:red" onclick="logout();">로그아웃</a></li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>