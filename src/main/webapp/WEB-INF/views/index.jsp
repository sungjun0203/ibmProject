<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">

<style>
    body {
        padding-top: 200px;
        padding-bottom: 100px;
        background-color: #eee;

    }
    .btn
    {
        outline:0;
        border:none;
        border-top:none;
        border-bottom:none;
        border-left:none;
        border-right:none;
        box-shadow:inset 2px -3px rgba(0,0,0,0.15);
    }
    .btn:focus
    {
        outline:0;
        -webkit-outline:0;
        -moz-outline:0;
    }
    .fullscreen_bg {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-size: cover;
        background-position: 50% 50%;
        background-color: black;
        background-repeat:repeat;
    }
    .form-signin {
        max-width: 280px;
        padding: 15px;
        margin: 0 auto;
        margin-top:50px;
    }
    .form-signin .form-signin-heading, .form-signin {
        margin-bottom: 10px;
    }
    .form-signin .form-control {
        position: relative;
        font-size: 16px;
        height: auto;
        padding: 10px;
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;
        box-sizing: border-box;
    }
    .form-signin .form-control:focus {
        z-index: 2;
    }
    .form-signin input[type="text"] {
        margin-bottom: -1px;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        border-top-style: solid;
        border-right-style: solid;
        border-bottom-style: none;
        border-left-style: solid;
        border-color: #000;
    }
    .form-signin input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        border-top-style: none;
        border-right-style: solid;
        border-bottom-style: solid;
        border-left-style: solid;
        border-color: rgb(0,0,0);
        border-top:1px solid rgba(0,0,0,0.08);
    }
    .form-signin-heading {
        color: #fff;
        text-align: center;
        text-shadow: 0 2px 2px rgba(0,0,0,0.5);
    }

</style>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dankook Uni.v Meeting</title>
</head>
<body>

<div id="fullscreen_bg" class="fullscreen_bg"/>

<div class="container">
    <form class="form-signin" id="indexForm" name ="indexForm" method="POST">
        <h1 class="form-signin-heading text-muted">Dankook Univ Meeting</h1>
        <input type="text" class="form-control" name="email" placeholder="Email address" required="" autofocus="">
        <input type="text" class="form-control" name="password" placeholder="Password" required="">
        <button class="btn btn-lg btn-primary btn-block" onclick="signIn();">
            Sign In
        </button>

        <button class="btn btn-lg btn-primary btn-block" onclick ="signUp();">
            Sign Up
        </button>
    </form>
</div>
</body>
</html>

<script>
    function signIn(){
        $.ajax({
            url : "/user/loginCheck",
            dataType : "json",
            async : false,
            type : "post",
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