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
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a href="../" class="navbar-brand">DKU Metting</a>
            <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
            <ul class="nav navbar-nav">

                <li>
                    <a href="../help/">공지사항</a>
                </li>

                <li>
                    <a href="../help/">소개팅</a>
                </li>

                <li>
                    <a href="../help/">미팅</a>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="http://builtwithbootstrap.com/" target="_blank">내 정보</a></li>
                <li><a href="https://wrapbootstrap.com/?ref=bsw" target="_blank">고객센터</a></li>
            </ul>

        </div>

        <div>

            <%--<a href="javascript:chgImg(-1)">Previous</a>--%>
            <%--<a href="javascript:chgImg(1)">Next</a>--%>

            <img src="/resources/image/test1.jpg" name="slideshow" width="500" height="300">
        </div>


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
            </tbody>
        </table>

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
            </tbody>
        </table>


    </div>
</div>



<script language="javascript" type="text/javascript">
    <!-- Begin
    var imagepath = "/resources/image/"
    NewImg = new Array (
        "test1.jpg",
        "test2.jpg",
        "test3.jpg",
        "test4.jpg"
    );
    var ImgNum = 0;
    var ImgLength = NewImg.length - 1;
    var delay = 2000; //자동전환시 시간설정(1000=1초)
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
    //  End -->
</script>
</body>
</html>
