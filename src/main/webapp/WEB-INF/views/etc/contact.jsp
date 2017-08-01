<%--
  Created by IntelliJ IDEA.
  User: Jun
  Date: 2017-07-29
  Time: 오후 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="http://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/bootstrap/cosmo.css"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/bootswatch.less"/>
<link rel="stylesheet/less" type="text/css" href="/resources/bootstrap/variables.less"/>

<!-- Libraries CSS Files -->
<link href="/resources/bell/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">



<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="page-header">
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <a onclick="main()" class="navbar-brand">DanKook University Meeting System</a>
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
</div>

<div class="container">

    <div class="well">
        고객센터
    </div>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <h2 class="section-title">Contact Us</h2>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-lg-5 offset-lg-2 ">
                    <div class="info">
                        <div>
                            <i class="fa fa-angellist text-center" ></i> <br>
                            <a href="http://WWW.BBongJun.com/" target="_blank">www.BBongJun.com</a></li>
                        </div>
                        &nbsp;

                        <div>
                            <i class="fa fa-envelope text-center"></i>
                            <p class="text-warning">sungjun0204@naver.com</p>
                        </div>

                        <div>
                            <i class="fa fa-phone"></i>
                            <p>KaKaoTalk ID : fancy0203</p>
                        </div>

                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="form">
                        <div id="sendmessage">Your message has been sent. Thank you!</div>
                        <div id="errormessage"></div>
                        <form action="/contact/contactSendOK" method="post" role="form" class="contactForm" >
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="phone" id="phone" placeholder="Your PhoneNumber" data-rule="phone" data-msg="Please enter a valid phone" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                                <div class="validation"></div>
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                                <div class="validation"></div>
                            </div>
                            <div class="text-center"><button type="submit">Send Message</button></div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>

</div>
<div class="modal-footer">
    <center>
        <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
    </center>
</div>
</body>
</html>
