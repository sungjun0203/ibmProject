<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<TITLE>회원가입</TITLE>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css"
   rel="stylesheet">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">



<style>
/* CSS used here will be applied after bootstrap.css */
.navbar {
   background: #FFFFFF;
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

.footer_text {
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
      <h1>
         회원가입 <small>일반회원가입</small>
      </h1>
   </div>
   <form class="form-horizontal" method="POST" id="signUpSubmit"
      name="signUpSubmit" action="/user/signUpSuccess"
      enctype="multipart/form-data">

      <div class="form-group">
         <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
         <div class="col-sm-3">
            <input type="email" class="form-control" id="inputEmail"
               name="inputEmail" placeholder="이메일">
            <p class="help-block">
               이메일을 작성해주세요 <br> Ex)abcd@naver.com
            </p>
         </div>
         <div class="col-sm-3">
            <a class="btn btn-default" onclick="emailSend();" role="button">인증번호
               전송</a>
         </div>
      </div>

      <div class="form-group">
         <label for="inputAuthNumber" class="col-sm-2 control-label">인증번호
            확인</label>
         <div class="col-sm-3">
            <input type="text" class="form-control" id="inputAuthNumber"
               name="inputAuthNumber" placeholder="인증번호">
         </div>

         <div class="col-sm-2">
            <a class="btn btn-default" onclick="emailAuth();" role="button">인증번호
               확인</a>
         </div>
      </div>

      <div class="form-group">
         <label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
         <div class="col-sm-3">
            <input type="password" class="form-control" id="inputPassword"
               name="inputPassword" placeholder="비밀번호"
               onkeyup="passwordSameCheckFunction(); passwordCheckFunction(this.value)">

         </div>

         <div class="col-sm-3">
            <p class="help-block" id="passwordHelp" name="passwordHelp">숫자,
               특수문자 포함 8자 이상</p>
         </div>
      </div>

      <div class="form-group">
         <label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호
            확인</label>
         <div class="col-sm-3">
            <input type="password" class="form-control" id="inputPasswordCheck"
               name="inputPasswordCheck" placeholder="비밀번호 확인"
               onkeyup="passwordSameCheckFunction()">
         </div>

         <div class="col-sm-3">
            <p class="help-block" id="passwordCheckHelp"
               name="passwordCheckHelp">-</p>
         </div>
      </div>

      <div class="form-group">
         <label for="inputName" class="col-sm-2 control-label">이름</label>
         <div class="col-sm-3">
            <input type="text" class="form-control" id="inputName"
               name="inputName" placeholder="이름">
         </div>
      </div>

      <div class="form-group">
         <label class="col-sm-2 control-label">성별</label>
         <div class="col-sm-5">
            <input type="radio" name="gender" value="male" checked> 남자 <input
               type="radio" name="gender" value="female"> 여자

         </div>
      </div>


      <div class="form-group">
         <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
         <div class="col-sm-3">
            <input type="text" class="form-control" id="inputNumber"
               name="inputNumber" placeholder="- 없이 적어주세요">
         </div>
      </div>

      <!-- 이용약관 버튼 -->
      <div class="form-group">
      <label for="inputNumber" class="col-sm-2 control-label">이용약관</label>
         <button type="button" class="panel panel-danger" data-toggle="modal" data-target="#myModal">이용약관</button>
         <!--  이용약관 팝업 -->
         
         <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
            aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true"></span><span class="sr-only">Close</span>
                     </button>
                     <h4 class="modal-title" id="myModalLabel">이용약관</h4>
                  </div>
                  <div class="modal-body">개인정보가 유출되어도 3조는 법적인 책임이 없음을 알려드립니다.
                  </div>
                  <!-- 이용약관 동의 체크박스 -->
                  <div class="form-group">
                     <label for="inputAgree" class="col-sm-2 control-label">약관
                        동의</label>
                     <div class="col-sm-6 checkbox">
                        <label> <input id="inputAgree" name="inputAgree" type="checkbox" onchange="accessTermsFunction()">  이용약관</a>에 동의합니다.
                        </label>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-default"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </div>

      </div>
      <div class="form-group">
         <label for="inputName" class="col-sm-2 control-label"></label>
         <div class="col-sm-6">
            <button type="button" id=signUpSubmitBtn name=signUpSubmitBtn
               onclick="signUpSubmitFunction()" class="btn btn-primary" disabled>회원가입</button>
            <button type="button" class="btn btn-danger"
               onclick="returnIndex();">돌아가기</button>
         </div>
      </div>
   </form>
   </article>
</div>
<jsp:include page="../headerAndFooter/footer.jsp"></jsp:include>


<script type="text/javascript">

    var randomValue;
    var emailAuthNumber;

    var emailSendCheck = false;
    var emailAuthCheck = false;
    var passwordCheck = false;
    var passwordSameCheck = false;

    function signUpSubmitFunction(){
        if($("#file")=="" || emailAuthCheck==false||passwordCheck==false||passwordSameCheck==false||
            $("#inputName")==""||$("#inputNumber")==""){
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
        var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);

        var passwordCheckCount = 0;

        if (pw.length < 8 || pw.length > 20) {
            $("#passwordHelp").text("8자리 ~ 20자리 이내로 입력해주세요.");
            $("#passwordHelp").css("color","#ff000a");
            passwordCheckCount++;
        }

        if (pw.search(/\s/) != -1) {
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
        
        var emailCheck = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        
        if(emailCheck.test(email)!=true){
           alert("이메일 형식이 아닙니다");
        }
        else{
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

    function returnIndex(){
        location.href="/";
    }
   
</script>