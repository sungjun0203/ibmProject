<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<TITLE> 회원가입 </TITLE>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">

<style>
    /* CSS used here will be applied after bootstrap.css */
    .navbar {
        background:#FFFFFF;
    }

    .navbar .navbar-center {
        display: inline-block;
        float: none;
        vertical-align: top;
        text-align: center;
    }

    #page_footer {
        height: 60px;
        background: #f5f5f5;
    }
    .footer_text{
        margin: 20px 0;
        color: #777;
    }
</style>

<script type="text/javascript">
    $(function() {
        $("#file").on('change', function(){
            readURL(this);
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

</script>

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원가입 <small>일반회원가입</small></h1>
        </div>
        <form class="form-horizontal" method="POST" id="signUpSubmit" name ="signUpSubmit" action="/user/signUpSuccess" enctype="multipart/form-data"  >

            <div class="form-group">
                <label for="blah" class="col-sm-2 control-label">사진</label>
                <div class="col-sm-3">
                    <img style="width:120px; height:160px" id="blah" src="#" alt="3:4 비율 Image" />
                </div>

                <div class="col-sm-4">
                    <input type="file" class="form-control" id="file" name="file" placeholder="사진">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
                <div class="col-sm-3">
                    <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일">
                    <p class="help-block">단국대 이메일을 작성해주세요 <br> Ex)32120000@dankook.ac.kr </p>
                </div>
                <div class="col-sm-3">
                    <a class="btn btn-default" onclick="emailSend();" role="button">인증번호 전송</a>
                </div>
            </div>

            <div class="form-group">
                <label for="inputAuthNumber" class="col-sm-2 control-label">인증번호 확인</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputAuthNumber" name="inputAuthNumber" placeholder="인증번호">
                </div>

                <div class="col-sm-2">
                    <a class="btn btn-default" onclick="emailAuth();" role="button">인증번호 확인</a>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" id="inputPassword" name="inputPassword"
                           placeholder="비밀번호" onkeyup="passwordSameCheckFunction(); passwordCheckFunction(this.value)">

                </div>

                <div class="col-sm-3">
                    <p class="help-block" id="passwordHelp" name="passwordHelp">숫자, 특수문자 포함 8자 이상</p>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPasswordCheck" class="col-sm-2 control-label" >비밀번호 확인</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" id="inputPasswordCheck" name="inputPasswordCheck" placeholder="비밀번호 확인" onkeyup="passwordSameCheckFunction()">
                </div>

                <div class="col-sm-3">
                    <p class="help-block" id="passwordCheckHelp" name="passwordCheckHelp"> - </p>
                </div>
            </div>

            <div class="form-group">
                <label for="inputNickName" class="col-sm-2 control-label">닉네임</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputNickName" name="inputNickName" placeholder="닉네임">
                </div>

                <div class="col-sm-2">
                    <a class="btn btn-default" onclick="nickname();" role="button">닉네임 중복확인</a>
                </div>
            </div>

            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">이름</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputName" name="inputName" placeholder="이름">
                </div>
            </div>



            <div class="form-group">
                <label for="inputBirthDay" class="col-sm-2 control-label">생년월일</label>
                <div class="col-sm-3">
                    <input type="date" class="form-control" id="inputBirthDay" name="inputBirthDay" placeholder="생년월일">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">성별</label>
                <div class="col-sm-5">
                    <input type="radio" name="gender" value="male" checked> 남자
                    <input type="radio" name="gender" value="female" > 여자

                </div>
            </div>

            <div class="form-group">
                <label for="inputCollege" class="col-sm-2 control-label">전공</label>
                <div class="col-sm-3">
                    <select class="form-control" id = "inputCollege" name = "inputCollege" onchange="setMajorSelectBox()">
                        <option value="법과대학">법과대학</option>
                        <option value="문과대학 ">문과대학</option>
                        <option value="사회과학대학">사회과학대학</option>
                        <option value="건축대학">건축대학</option>
                        <option value="공과대학">공과대학</option>
                        <option value="사범대학">사범대학</option>
                        <option value="예술디자인대학">예술디자인대학</option>
                        <option value="음악대학">음악대학</option>
                        <option value="국제대학">국제대학</option>
                        <option value="교양교육대학">교양교육대학</option>
                    </select>
                </div>

                <div class="col-sm-3">

                    <select class="form-control" id = "inputMajor" name="inputMajor">
                        <option value="법학과 ">법학과</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputNumber" name="inputNumber" placeholder="- 없이 적어주세요">
                </div>
            </div>

            <div class="form-group">
                <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
                <div class="col-sm-6 checkbox">
                    <label>
                        <input id="inputAgree" name="inputAgree" type="checkbox" onchange="accessTermsFunction()"> <a href="/agreement"> 이용약관</a>에 동의합니다.
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="button" id=signUpSubmitBtn name=signUpSubmitBtn onclick="signUpSubmitFunction()" class="btn btn-primary" disabled>회원가입</button>
                    <button type="button" class="btn btn-danger" onclick="returnIndex();">돌아가기</button>
                </div>
            </div>
        </form>
    </article>
</div>
<footer class="footer" id="page_footer">
    <div class="container">
        <center>
            <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® ParkSungJun</p>
        </center>
    </div>
</footer>


<script type="text/javascript">

    var randomValue;
    var emailAuthNumber;

    var fileCheck = false;
    var emailSendCheck = false;
    var emailAuthCheck = false;
    var nicknameCheck = false;
    var passwordCheck = false;
    var passwordSameCheck = false;

    function signUpSubmitFunction(){
        if($("#file")=="" || emailAuthCheck==false||passwordCheck==false||passwordSameCheck==false||
            inputName==""||inputBirthDay==""||inputNumber==""){
            alert("모든 정보를 입력해주세요");
        }
        else{
            $("#signUpSubmit").submit();
        }
    }

    function accessTermsFunction(){

        if($("#inputAgree").is(":checked")){
            $("#signUpSubmitBtn").attr("disabled",false);
        }
        else{
            $("#signUpSubmitBtn").attr("disabled",true);
        }
    }

    function passwordCheckFunction(password) {

        var pw = password;
        var num = pw.search(/[0-9]/g);
        var eng = pw.search(/[a-z]/ig);
        var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        var passwordCheckCount = 0;

        if (pw.length < 8 || pw.length > 20) {
            $("#passwordHelp").text("8자리 ~ 20자리 이내로 입력해주세요.");
            $("#passwordHelp").css("color","#ff000a");
            passwordCheckCount++;
        }

        if (pw.search(/₩s/) != -1) {
            $("#passwordHelp").text("비밀번호는 공백없이 입력해주세요.");
            $("#passwordHelp").css("color","#ff000a");
            passwordCheckCount++;

        }
        if (num < 0 || eng < 0 || spe < 0) {
            $("#passwordHelp").text("영문,숫자,특수문자를 혼합해주세요.");
            $("#passwordHelp").css("color","#ff000a");
            passwordCheckCount++;
        }

        if(passwordCheckCount==0){
            $("#passwordHelp").text("올바른 비밀번호입니다");
            $("#passwordHelp").css("color","#0e05ff");
            passwordCheck=true;
        }
        else{
            passwordCheck=false;
        }
    }

    function passwordSameCheckFunction(){

        var password = $("#inputPassword").val();
        var passwordCheck = $("#inputPasswordCheck").val();

        if(password == passwordCheck){
            $("#passwordCheckHelp").text("동일한 비밀번호입니다.");
            $("#passwordCheckHelp").css("color","#0e05ff");
            passwordSameCheck=true;
        }
        else{
            $("#passwordCheckHelp").text("비밀번호가 일치하지 않습니다.");
            $("#passwordCheckHelp").css("color","#ff000a");
        }
    }

    function emailSend(){
        var email = $("#inputEmail").val();
        alert("렉이 걸려도 당황하지말고 기다려주세요");
        $.ajax({

            url:"/user/signUpEmailSend",
            dataType: "JSON",
            async:false,
            type:"POST",
            data : {"email":email},
            success : function(data){
                if(data.resultString=="duplicate"){
                    alert("이미 가입된 회원입니다");
                }
                else if(data.resultString=="notDANKOOK"){
                    alert("단국대학교 이메일이 아닙니다");
                }
                else{
                    alert("이메일 전송이 완료됐습니다");
                    emailSendCheck=true;
                    emailAuthNumber = data.randomNum;
                }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"error:"+error);
            }
        });
    }

    function emailAuth(){
        var inputAuthNumber = $("#inputAuthNumber").val();
        if(inputAuthNumber==emailAuthNumber){
            alert("인증이 완료됐습니다.");
            emailAuthCheck=true;
        }
        else{
            alert("정확한 인증번호를 입력해주세요");
        }
    }

    function nickname(){
        var inputNickname = $("#inputNickName").val();
        $.ajax({
            url:"/user/nicknameCheck",
            dataType:"json",
            async:false,
            type:"POST",
            data:{"nickName":inputNickname},
            success: function(data){
                if(data.resultData == "a"){
                    alert("존재하는 닉네임입니다");
                }
                else{
                    alert("가능한 닉네임입니다");
                    nicknameCheck = true;
                }
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"error:"+error);
            }
        })
    }

    function returnIndex(){
        location.href="/";
    }

    function setMajorSelectBox(){

        var collegeValue = $("#inputCollege option:selected").text();
        var majorSelectBox = $("#inputMajor");


        if(collegeValue =="문과대학"){
            $("#inputMajor").html("<option value='a'>국어국문학과</option> " +
                "<option value='사학과'>사학과</option> " +
                "<option value='철학과'>철학과</option>" +
                "<option value='영어인문학과'>영어인문학과</option>" +
                "<option value='중어중문학과'>중어중문학과</option>" +
                "<option value='일어일문학과'>일어일문학과</option>" +
                "<option value='영어영문학과'>영어영문학과</option>");

        }

        if(collegeValue =="법과대학"){
            $("#inputMajor").html("<option value='법학과'>법학과</option>");
        }

        if(collegeValue =="사회과학대학"){

            $("#inputMajor").html("<option value='정치외교학과'>정치외교학과</option> " +
                "<option value='행정학과'>행정학과</option> " +
                "<option value='도시계획-부동산학부'>도시계획-부동산학부</option>" +
                "<option value='커뮤니케이션학부'>커뮤니케이션학부</option>" +
                "<option value='응용통계학과'>응용통계학과</option>" +
                "<option value='상담학과'>상담학과</option>" );
        }

        if(collegeValue =="상경대학"){

            $("#inputMajor").html("<option value='a'>경제학과</option> " +
                "<option value='무역학과'>무역학과</option> " +
                "<option value='경영학부'>경영학부</option>");

        }

        if(collegeValue =="건축대학"){

            $("#inputMajor").html("<option value='a'>건축학과</option> " +
                "<option value='건축공학과'>건축공학과</option> ");
        }

        if(collegeValue =="공과대학"){

            $("#inputMajor").html("<option value='a'>전자전기공학부</option> " +
                "<option value='고분자공학과'>고분자공학과</option> " +
                "<option value='파이버시스템공학과'>파이버시스템공학과</option>" +
                "<option value='소프트웨어학과'>소프트웨어학과</option>" +
                "<option value='응용컴퓨터공학과'>응용컴퓨터공학과</option>" +
                "<option value='토목한광경학과'>토목한광경학과</option>" +
                "<option value='기계공학과'>기계공학과</option>"+
                "<option value='화학공학과'>화학공학과</option>");
        }

        if(collegeValue =="사범대학"){

            $("#inputMajor").html("<option value='a'>한문교육과</option> " +
                "<option value='특수교육과'>특수교육과</option> " +
                "<option value='수학교육과'>수학교육과</option>" +
                "<option value='과학교육과'>과학교육과</option>" +
                "<option value='체육교육과'>체육교육과</option>" +
                "<option value='교직교육과'>교직교육과</option>");
        }

        if(collegeValue =="예술디자인대학"){

            $("#inputMajor").html("<option value='a'>도예과</option> " +
                "<option value='커뮤니케이션디자인과'>커뮤니케이션디자인과</option> " +
                "<option value='공연영화학부'>공연영화학부</option>" +
                "<option value='패션산업디자인과'>패션산업디자인과</option>" +
                "<option value='무용과'>무용과</option>");
        }

        if(collegeValue =="음악대학"){

            $("#inputMajor").html("<option value='a'>기악과</option> " +
                "<option value='성악과'>성악과</option> " +
                "<option value='작곡과'>작곡과</option>" +
                "<option value='국악과'>국악과</option>");
        }

        if(collegeValue =="국제대학"){

            $("#inputMajor").html("<option value='국제경영학과'>국제경영학과</option> " +
                "<option value='모바일시스템공학과'>모바일시스템공학과</option> " +
                "<option value='국제자유전공학부'>국제자유전공학부</option>");
        }

        if(collegeValue =="교양교육대학"){
            $("#inputMajor").html("<option value='교양학부'>교양학부</option> ");
        }
    }

</script>