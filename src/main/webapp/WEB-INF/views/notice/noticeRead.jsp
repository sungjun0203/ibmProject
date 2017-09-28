<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/cosmo.css"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less"/>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<html>
<head>
    <title>공지사항 읽기</title>
</head>
<body>
<jsp:include page="../headerAndFooter/header.jsp"></jsp:include>
<form id = "noticeRead" name="noticeRead" mothod="POST" action = "">
	<div class="container">
		<table class="table table_striped" style=border:solid>
			<thead>
				<tr>
					<th> 공지사항 번호 </th>
					<th>${noticeReadInformation.NOTICE_NUMBER}</th>
				</tr>
				</thead>
				<tbody>
					<tr> 관리자
					<td name = "cc" id="cc">${noticeReadInformation.NOTICE_WRITER}</td>
						<td> 등록일 </td>
						<td> ${noticeReadInformation.NOTICE_DATE}</td>
					 </tr>
				</tbody>
		</table>
		
		<div class="panel panel-info">
			<div class="panel-heading">
			 제목: ${fn:replace(noticeReadInformation.NOTICE_TITLE, cn, br)}
			</div>
		</div class="panel-body" style=height:80%>
<c:choose>
	<c:when test= '${noticeReadInformation.NOTICE_FILE_NAME eq null }'>
	</c:when>
	
</c:choose>

			<p>${fn:replace(noticeReadInformation.NOTICE_CONTENT, cn, br)}<p>

		</div>
	</div>
	
	<div style="text-align: right; margin-top: 5px; margin-bottom: 5px">
		<button type="button" class ="btn btn-warning btn-sm" onclick="noticeBack()">뒤로가기</button>
		<button type="button" class ="btn btn-warning btn-sm" onclick="noticeDelete()">삭제</button>
		
	</div>
	<input type="hidden" id="noticeNumber" name="noticeNumber">
	<input type="hidden" id="noticeTitle" name="noticeTitle">
	<input type="hidden" id="noticeWriter" name="noticeWriter">
</form>

</body>
</html>
	 




  <%-- <div class="page-header">
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a onclick="main()" class="navbar-brand">IBM Board Project</a>
            </div>
            <div class="navbar-collapse collapse" id="navbar-main">
                <ul class="nav navbar-nav">

                    <li>
                        <a onclick="notice()">공지사항</a>
                    </li>


                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a> '${userInformation.name}'님 안녕하세요 </a></li>
                    <li><a target="_blank" onclick="contact()">내 정보</a></li>
                    <li><a target="_blank" onclick="contact()">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<form id="noticeWrite" name="noticeWrite" method="POST" action="/notice/writeSubmit">
    <div class="container">
        <div>
            <div class="well">
                공지사항 작성
            </div>
        </div>

        <div class="form-group has-error">
            <label class="control-label" for="noticeTitle">제목</label>
            <input type="text" class="form-control" id="noticeTitle" name="noticeTitle">
        </div>

        <textarea style="width: 100%" rows="25" name="noticeContent" id="noticeContent" cols="200"></textarea>

        <div style="text-align: right; margin-top: 5px; margin-bottom: 5px">
            <button type="button" class="btn btn-warning btn-sm" onclick="noticeBack();">Back</button>
            <button type="button" class="btn btn-success btn-sm" onclick="noticeSubmit();">Submit</button>
        </div>
    </div> --%>

<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>
</form>
</body>
</html>

<script>
	function noticeSubmit() {
    	$("#noticeWrite").submit();
	}
    function noticeBack() {
    	location.href="/main/main"
    }
</script>