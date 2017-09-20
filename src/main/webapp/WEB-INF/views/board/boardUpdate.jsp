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

<form id="boardUpdate" name="boardUpdate" method="POST" action="/board/boardUpdateSubmit" enctype="multipart/form-data">
<input type="hidden" id="imgSrc" name="imgSrc">
    <div class="container">
        <div>
            <div class="well">
                게시글 수정
            </div>
        </div>

        <div class="form-group has-error">
            <label class="control-label" for="boardTitle">제목</label>
            <input type="text" class="form-control" id="boardTitle" name="boardTitle" value="${boardInformation.BOARD_TITLE}">
        </div>
        
        
        <p class="text-primary">수정 전 업로드 된 파일 : ${boardInformation.BOARD_FILE_ORIG}</p>
        <div class="form-group has-warning">
        	
            <label class="control-label" for="boardTitle">변경 사진(jpg, png, gif) 첨부</label> 
            <input type="file" class="form-control" id="file" name="file" placeholder="사진" onchange="imageCheck()">
        </div>

        <textarea style="width: 100%" rows="25" name="boardContent" id="boardContent" cols="200" >${boardInformation.BOARD_CONTENT}</textarea>

        <div style="text-align: right; margin-top: 5px; margin-bottom: 5px">
            <button type="button" class="btn btn-warning btn-sm" onclick="boardBack();">Back</button>
            <button type="button" class="btn btn-success btn-sm" onclick="boardUpdateSubmit();">Success</button>
        </div>
    </div>
    
    <div class="modal-footer">
        <center>
            <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® IBM 3조</p>
        </center>
    </div>
    
<input type="hidden" id="imgChangeCheck" name="imgChangeCheck">
<input type="hidden" id="boardNumber" name="boardNumber">
<input type="hidden" id="boardNumber" name="boardWriterName">

</form>
</body>
</html>

<script type="text/javascript">

	function boardBack(){
		history.back(); 
	}

	function boardUpdateSubmit(){
		$('#boardNumber').val(${boardInformation.BOARD_NUMBER});
		$("#boardUpdate").submit();
	}
	function imageCheck() {
		
		$("#imgChangeCheck").val("change");
		
		var fileSrc = $("#file").val();
		var fileName = fileSrc.slice(fileSrc.lastIndexOf("\\") + 1).toLowerCase();
		
		$("#imgSrc").val(fileName);
		alert($("#imgSrc").val());
		var ext = fileSrc.slice(fileSrc.lastIndexOf(".") + 1).toLowerCase();
		if (!(ext == "gif" || ext == "jpg" || ext == "png")) {
			alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
			$("#file").val("");
		}
	}
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>