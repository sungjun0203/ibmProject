
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/cosmo.css"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less"/>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>

<div class="container">
<form id="noticeForm" name="noticeForm" method="POST" action="">
<input type ="hidden" id="noticeNumber" name="noticeNumber">
    <div class="well">
        공지사항
    </div>

    <table class="table table-striped table-hover text-center">
        <thead>
        <tr class=info>
            <th class=text-center>번호</th>
            <th class=text-center>제목</th>
            <th class=text-center>작성자</th>
            <th class=text-center>등록일</th>
            <th class=text-center>조회수</th>
        </tr>
        </thead>

        <c:forEach items="${noticeInformation}" var="notice">

        <tbody>
        <tr>
            <td width="10%">${notice.NOTICE_NUMBER}</td>
            <td width="40%" onclick="noticeRead(${notice.NOTICE_NUMBER});">${notice.NOTICE_TITLE}</td>
            <td width="20%">${notice.NOTICE_WRITER} (관리자)</td>
            <td width="20%">${notice.NOTICE_DATE}</td>
            <td width="10%">${notice.NOTICE_VIEW_AMT}</td>
        </tr>
        </c:forEach>


        </tbody>
    </table>
    
     <td width="20%">
                    <a class="btn btn-danger" style="float:right;" onclick="noticeWrite();">글쓰기</a>
                </td>

</div>

<div class="modal-footer">
    <center>
        <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
    </center>
</div>


</body>

<script>
    function main() {
        location.href = "/main/main";
    }
    function notice() {
        location.href = "/notice/noticeList";
    }
    function noticeRead(boardNumberClick){
    	
    	$("#noticeNumber").val(boardNumberClick);
    	
    	$("#noticeForm").attr("action", "/notice/noticeRead");
		$("#noticeForm").submit();
    }
    function dating() {
        location.href = "/board/dating";
    }
    function meeting() {
        location.href = "/board/meeting";
    }
    function noticeWrite() {
    	
    	 $.ajax({
             url: "/common/userTypeCheck",
             dataType: "text",
             type: "POST",
             success: function (data) {
            	 alert(data);
                 if (data == "관리자") {
                     location.href = "/notice/noticeWrite";
                 }
                 else {
                     alert("당신은 관리자가 아닙니다");
                 }
             },
             error: function (request, status, error) {
                 alert("code:" + request.status + "\n" + "error:" + error);
             }
         });
    	
       
    }
    function contact() {
        location.href = "/contact/";
    }
</script>

</html>
