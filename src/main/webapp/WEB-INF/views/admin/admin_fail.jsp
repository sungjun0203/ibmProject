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
<link rel="stylesheet" type="text/css" 	href="/resources/bootstrap/cosmo.css" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less" />
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less" />

<html>
<head>
<title>관리자</title>

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
						<li><a> '${userInformation.name}'님 안녕하세요 </a></li>
						<li><a target="_blank" onclick="contact()">고객센터</a></li>
						<li><a target="_blank" onclick="contact()">관리자</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
	
		너는 관리자아님

	</div>

	<div class="modal-footer">
		<center>
			<p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
		</center>
	</div>

</body>

<script language="javascript" type="text/javascript">

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

    function contact() {
        location.href = "/contact/";
    }
    
    function admin() {
    	location.href = "/admin"
    }


    //  End -->
</script>


</html>
