<%--
  Created by IntelliJ IDEA.
  User: IONCOMMUNICATIONS
  Date: 2017-07-27
  Time: 오후 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/cosmo.css"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less"/>
<script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="noticeWrite" name="noticeWrite" method="POST" action="/notice/writeSubmit">
    <div class="page-header">
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="navbar-header">
                <a onclick="main()" class="navbar-brand">DKU Metting</a>
            </div>
            <div class="navbar-collapse collapse" id="navbar-main">
                <ul class="nav navbar-nav">

                    <li class="active">
                        <a onclick="notice()">공지사항</a>
                    </li>

                    <li>
                        <a onclick="dating()">소개팅</a>
                    </li>

                    <li>
                        <a onclick="meeting()">미팅</a>
                    </li>

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a> ${userEmail} 님 안녕하세요 </a></li>
                    <li><a href="http://builtwithbootstrap.com/" target="_blank">내 정보</a></li>
                    <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">고객센터</a></li>
                </ul>
            </div>
        </div>
    </div>


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
            <button type="button" class="btn btn-warning btn-sm">Back</button>
            <button type="button" class="btn btn-success btn-sm" onclick="noticeSubmit();">Success</button>
        </div>
    </div>

    <div class="modal-footer">
        <center>
            <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
        </center>
    </div>

</form>
</body>
</html>

<script type="text/javascript">
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "noticeContent", //textarea에서 지정한 id와 일치해야 합니다.
        sSkinURI: "/resources/se2/SmartEditor2Skin.html",
        fCreator: "createSEditor2",
        htParams : {fOnBeforeUnload : function(){}}
    });
</script>

<script>
    function noticeSubmit() {

        var noticeHTMLValue = oEditors.getById["noticeContent"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#noticeWrite").submit();
    }
</script>


