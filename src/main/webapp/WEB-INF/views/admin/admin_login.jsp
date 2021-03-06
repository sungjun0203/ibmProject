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
	<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>

	<div class="container" style="height:70%">
		
		<div class="alert alert-dismissible alert-warning">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>관리자 페이지</strong> <br><br> 너는 관리자입니다. 경각심을 가지세요
		</div>
		
		<div class="col-sm-12">
			<div class="col-sm-3">
			</div>
			
			<div class="col-sm-6">
				  <label class="control-label" for="inputSuccess">비밀번호 재 입력</label>
				  <input type="password" style="display:inline; width:50%" class="form-control"  id="adminPassword" name="adminPassword">
				  <button style="display:inline; width:20%" class="btn btn-primary" onclick="adminCheck();"> 로그인 </button>
			</div>
			
			<div class="col-sm-3">
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
    
    function adminCheck(){
    	
    	 $.ajax({
             url : "/admin/reLogin",
             dataType : "json",
             async : false,
             type : "POST",
             data : $('#adminPassword'),
             success: function(data) {
                 if(data.resultData=="loginSuccess") {
                	 location.href = "/admin/management";
                 }
                 else{
                     alert("너 관리자 아니지? 비밀번호 틀림");
                 }
             },
             error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"error:"+error);
             }
         });
    }

    //  End -->
</script>


</html>
