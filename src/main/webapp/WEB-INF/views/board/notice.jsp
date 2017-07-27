<%--
  Created by IntelliJ IDEA.
  User: Jun
  Date: 2017-07-27
  Time: 오전 12:51
  To change this template use File | Settings | File Templates.
--%>
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

<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a onclick ="main()" class="navbar-brand">DKU Metting</a>

        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">

                <li class="active">
                    <a onclick ="notice()" >공지사항</a>
                </li>

                <li>
                    <a onclick ="dating()">소개팅</a>
                </li>

                <li>
                    <a onclick ="meeting()">미팅</a>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a> ${userEmail} 님 안녕하세요 </a></li>
                <li><a href="http://builtwithbootstrap.com/" target="_blank">내 정보</a></li>
                <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">고객센터</a></li>
            </ul>

        </div>
    </div>

    <div class="container">

        <div class="well">
            공지사항
        </div>

        <table class="table table-striped table-hover text-center">
            <thead>
            <tr class=info>
                <th class = text-center>번호</th>
                <th class = text-center>제목</th>
                <th class = text-center>작성자</th>
                <th class = text-center>등록일</th>
                <th class = text-center>조회수</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td width="10%">1</td>
                <td width="40%">김우현 바보</td>
                <td width="20%">박성준 짱짱맨</td>
                <td width="20%">2017.07.27 04:25</td>
                <td width="10%">120022</td>
            </tr>
            <tr>
                <td>2</td>
                <td>Column content</td>
                <td>Column content</td>
                <td>Column content</td>
            </tr>

            </tbody>
        </table>

        <div >
            <table width="100%" style="margin-top:5px;">
                <tr>
                    <td width="20%"></td>
                    <td width="60%" style="text-align: center;">
                        <div>
                            <ul class="pagination" style="text-align: center" >
                                <li class="disabled"><a href="#">&laquo;</a></li>
                                <li class="active"><a href="#">1</a></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&raquo;</a></li>
                            </ul>

                        </div>
                    </td>
                    <td width="20%">
                        <a class="btn btn-danger" style="float:right;" onclick="noticeWrite();">글쓰기</a>
                    </td>
                </tr>
            </table>
        </div>


    </div>


</div>


</body>

<script>
    function main() {
        location.href = "/main/main";
    }

    function notice() {
        location.href = "/board/notice";
    }

    function dating() {
        location.href = "/board/dating";
    }

    function meeting() {
        location.href = "/board/meeting";
    }

    function noticeWrite(){
        location.href= "/notice/write";
    }
</script>

</html>

