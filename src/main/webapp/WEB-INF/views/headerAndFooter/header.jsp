<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
						<li><a onclick="myInformation()">내 정보</a></li>

					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><a target="_blank" onclick="admin()">관리자</a></li>
						<li><a target="_blank" style="color:red" onclick="logout();">로그아웃</a></li>
					</ul>
					
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>