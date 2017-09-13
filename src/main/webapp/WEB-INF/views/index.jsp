<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">

<head>
    <meta charset="utf-8">
    <title>IBM Board Project</title>

    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

    <link rel="stylesheet" href="/resources/login/css/animate.css">
    <!-- Custom Stylesheet -->
    <link rel="stylesheet" href="/resources/login/css/style.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
<div class="container">
    <div class="top">
        <h1 id="title" ><span id="logo">IBM <br>
        Board Project</span></h1>
    </div>
    <div class="login-box animated fadeInUp">
        <div class="box-header">
            <h2>Log In</h2>
        </div>

        <form class="form-signin" id="indexForm" name ="indexForm" method="POST">
            <label for="email">E-Mail</label>
            <br/>
            <input type="text" id="email" name="email" value="a@a.com" required="" autofocus="">
            <br/>
            <label for="password">Password</label>
            <br/>
            <input type="password" id="password" name="password" value="0000" required="">
            <br/>
            <button type="submit" onclick="signIn();" >LOGIN</button>
            <button type="button" onclick ="signUp();">SIGN UP</button>
            <br/>
        </form>
    </div>
</div>
</body>



<script>
    $(document).ready(function () {
        $('#logo').addClass('animated fadeInDown');
        $("input:text:visible:first").focus();
    });
    $('#username').focus(function() {
        $('label[for="username"]').addClass('selected');
    });
    $('#username').blur(function() {
        $('label[for="username"]').removeClass('selected');
    });
    $('#password').focus(function() {
        $('label[for="password"]').addClass('selected');
    });
    $('#password').blur(function() {
        $('label[for="password"]').removeClass('selected');
    });

    function signIn(){
        $.ajax({
            url : "/user/loginCheck",
            dataType : "json",
            async : false,
            type : "POST",
            data : $('#indexForm').serializeArray(),
            success: function(data) {
                if(data.resultData=="loginSuccess") {
                    document.indexForm.action = "/main/main";
                    document.indexForm.submit();
                }
                else{
                    alert("loginFail");
                }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"error:"+error);
            }

        });

    }

    function signUp(){
        location.href="/user/signUp"
    }
</script>

</html>
