<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<div class="contentwrap">
    <article class="container">
        <div class="page-header">
            <h1>회원가입 <small>일반회원가입</small></h1>
        </div>
        <form class="form-horizontal" method="POST" action="/user/signUpSuccess">
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label">이메일</label>
                <div class="col-sm-3">
                    <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="이메일">
                    <p class="help-block">학교 이메일을 작성해주세요 <br>단국대학교 학생인증에 사용됩니다 </p>
                </div>

                <div class="col-sm-2">
                    <a class="btn btn-default" href="#" role="button">인증번호 전송</a>
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword" class="col-sm-2 control-label" name="inputPassword">비밀번호</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호">

                </div>

                <div class="col-sm-3">
                    <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
                </div>
            </div>

            <div class="form-group">
                <label for="inputPasswordCheck" class="col-sm-2 control-label" name="inputPasswordCheck">비밀번호 확인</label>
                <div class="col-sm-3">
                    <input type="password" class="form-control" id="inputPasswordCheck" placeholder="비밀번호 확인">
                </div>

                <div class="col-sm-3">
                    <p class="help-block"> - </p>
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
                        <option value="law">법과대학</option>
                        <option value="liberal ">문과대학</option>
                        <option value="social">사회과학대학</option>
                        <option value="architecture">건축대학</option>
                        <option value="engineering">공과대학</option>
                        <option value="education">사범대학</option>
                        <option value="art">예술디자인대학</option>
                        <option value="music">음악대학</option>
                        <option value="international">국제대학</option>
                        <option value="refinement">교양교육대학</option>
                    </select>
                </div>

                <div class="col-sm-3">

                    <select class="form-control" id = "inputMajor" name="inputMajor">
                        <option value="liberal ">법학과</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputNumber" name="inputNumber" placeholder="- 없이 적어주세요">
                </div>
                <div class="col-sm-2">
                    <a class="btn btn-default" href="#" role="button">인증번호 전송</a>
                </div>
            </div>
            <div class="form-group">
                <label for="inputNumberCheck" class="col-sm-2 control-label">인증번호 확인</label>
                <div class="col-sm-3">
                    <input type="text" class="form-control" id="inputNumberCheck" placeholder="인증번호">
                    <p class="help-block">전송된 인증번호를 입력해주세요.</p>
                </div>
            </div>
            <div class="form-group">
                <label for="inputAgree" class="col-sm-2 control-label">약관 동의</label>
                <div class="col-sm-6 checkbox">
                    <label>
                        <input id="inputAgree" type="checkbox"> <a href="/agreement"> 이용약관</a>에 동의합니다.
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label"></label>
                <div class="col-sm-6">
                    <button type="submit" class="btn btn-primary">회원가입</button>
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

    function setMajorSelectBox(){

        var collegeValue = $("#inputCollege option:selected").text();
        var majorSelectBox = $("#inputMajor");


        if(collegeValue =="문과대학"){
            $("#inputMajor").html("<option value='a'>국어국문학과</option> " +
                "<option value='a'>사학과</option> " +
                "<option value='a'>철학과</option>" +
                "<option value='a'>영어인문학과</option>" +
                "<option value='a'>중어중문학과</option>" +
                "<option value='a'>일어일문학과</option>" +
                "<option value='a'>영어영문학과</option>");

        }

        if(collegeValue =="법과대학"){
            $("#inputMajor").html("<option value='a'>법학과</option>");
        }

        if(collegeValue =="사회과학대학"){

            $("#inputMajor").html("<option value='a'>정치외교학과</option> " +
                "<option value='a'>행정학과</option> " +
                "<option value='a'>도시계획-부동산학부</option>" +
                "<option value='a'>커뮤니케이션학부</option>" +
                "<option value='a'>응용통계학과</option>" +
                "<option value='a'>상담학과</option>" );
        }

        if(collegeValue =="상경대학"){

            $("#inputMajor").html("<option value='a'>경제학과</option> " +
                "<option value='a'>무역학과</option> " +
                "<option value='a'>경영학부</option>");

        }

        if(collegeValue =="건축대학"){

            $("#inputMajor").html("<option value='a'>건축학과</option> " +
                "<option value='a'>건축공학과</option> ");
        }

        if(collegeValue =="공과대학"){

            $("#inputMajor").html("<option value='a'>전자전기공학부</option> " +
                "<option value='a'>고분자공학과</option> " +
                "<option value='a'>파이버시스템공학과</option>" +
                "<option value='a'>소프트웨어학과</option>" +
                "<option value='a'>응용컴퓨터공학과</option>" +
                "<option value='a'>토목한광경학과</option>" +
                "<option value='a'>기계공학과</option>"+
                "<option value='a'>화학공학과</option>");
        }

        if(collegeValue =="사범대학"){

            $("#inputMajor").html("<option value='a'>한문교육과</option> " +
                "<option value='a'>특수교육과</option> " +
                "<option value='a'>수학교육과</option>" +
                "<option value='a'>과학교육과</option>" +
                "<option value='a'>체육교육과</option>" +
                "<option value='a'>교직교육과</option>");
        }

        if(collegeValue =="예술디자인대학"){

            $("#inputMajor").html("<option value='a'>도예과</option> " +
                "<option value='a'>커뮤니케이션디자인과</option> " +
                "<option value='a'>공연영화학부</option>" +
                "<option value='a'>패션산업디자인과</option>" +
                "<option value='a'>무용과</option>");
        }

        if(collegeValue =="음악대학"){

            $("#inputMajor").html("<option value='a'>기악과</option> " +
                "<option value='a'>성악과</option> " +
                "<option value='a'>작곡과</option>" +
                "<option value='a'>국악과</option>");
        }

        if(collegeValue =="국제대학"){

            $("#inputMajor").html("<option value='a'>국제경영학과</option> " +
                "<option value='a'>모바일시스템공학과</option> " +
                "<option value='a'>국제자유전공학부</option>");
        }

        if(collegeValue =="교양교육대학"){
            $("#inputMajor").html("<option value='a'>교양학부</option> ");
        }
    }

</script>