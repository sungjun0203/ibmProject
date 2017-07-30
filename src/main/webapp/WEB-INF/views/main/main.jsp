<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: IONCOMMUNICATIONS
  Date: 2017-07-25
  Time: 오후 2:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/cosmo.css"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less"/>

<html>
<head>
    <title>메인</title>

</head>
<body>
<div class="page-header">
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
            <a onclick="main()" class="navbar-brand">DKU Metting</a>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">

                <li>
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
                <li><a> '${userInformation.name}'님 안녕하세요 </a></li>
                <li><a target="_blank" onclick="contact()">내 정보</a></li>
                <li><a target="_blank" onclick="contact()">고객센터</a></li>
            </ul>
        </div>
    </div>
</div>



<div class="container">

    <%--<a href="javascript:chgImg(-1)">Previous</a>--%>
    <%--<a href="javascript:chgImg(1)">Next</a>--%>

    <img src="/resources/image/image1.jpg" name="slideshow" width="60%" height="140">

    <table class="text-center" width="40%" style="display:inline;" >
        <tr>
            <td rowspan="4" width="50%">
                 <img src="/resources/image/myImage.jpg" align="center" width="140" style="height: auto;">
            </td>
            <td width="30%" > ${userInformation.name} </td>
        </tr>
        <tr>
            <td width="30%" > 쪽지 </td>
        </tr>
        <tr>
            <td width="30%" > 내가 보낸거</td>
        </tr>
        <tr>
            <td width="30%"> 요청 받은거</td>
        </tr>


    </table>



&nbsp;
    <div style="margin-top:11px; margin-bottom:11px;">
        <span class="label label-primary">공지사항</span>

        <span class="label label-default" style="float: right" name="noticeMore" id="noticeMore" onclick="notice()">더 보기 </span>

    </div>
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr class="info">
            <td width="10%"> </td>
            <td width="40%">제목</td>
            <td width="20%">작성자</td>
            <td width="20%">등록일</td>
            <td width="10%"> </td>
        </tr>
        </thead>


        <tbody>
<c:forEach items="${recentNoticeList}" var="notice">
        <tr>
            <td width="10%"> </td>
            <td width="40%">${notice.noticeTitle}</td>
            <td width="20%">${notice.name}</td>
            <td width="20%">${notice.noticeDate}</td>
            <td width="10%"> </td>
        </tr>
</c:forEach>
        </tbody>
    </table>


    &nbsp;
    <table class="table table-striped table-hover text-center">
        <thead>
        <tr class="warning">
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
            <th>조회수</th>
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
        </tbody>
    </table>


</div>

<div class="modal-footer">
<center>
    <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
</center>
</div>



</body>

<script language="javascript" type="text/javascript">
    <!-- Begin
    var imagepath = "/resources/image/"
    NewImg = new Array (
        "image1.jpg",
        "image2.gif"

    );
    var ImgNum = 0;
    var ImgLength = NewImg.length - 1;
    var delay = 2500; //자동전환시 시간설정(1000=1초)
    var lock = false;
    var run;
    function chgImg(direction) {
        if (document.images) {
            ImgNum = ImgNum + direction;
            if (ImgNum > ImgLength) {
                ImgNum = 0;
            }
            if (ImgNum < 0) {
                ImgNum = ImgLength;
            }
            document.slideshow.src = imagepath+NewImg[ImgNum];
        }
    }
    window.onload = function auto() {
        if (lock == true) {
            lock = false;
            window.clearInterval(run);
        }
        else if (lock == false) {
            lock = true;
            run = setInterval("chgImg(1)", delay);
        }
    }

    function main(){
        location.reload();
    }

    function notice(){
        location.href="/notice/noticeList";
    }

    function dating(){
        location.href="/board/dating";
    }

    function meeting(){
        location.href="/board/meeting";
    }

    function contact(){
        location.href="/contact/";
    }


    //  End -->
</script>


</html>
