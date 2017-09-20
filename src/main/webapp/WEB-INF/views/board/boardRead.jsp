<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>

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

<form id="boardRead" name="boardRead" method="POST" action="">
<input type="hidden" id="imgSrc" name="imgSrc">
    <div class="container">
        <table class="table table-striped table-hover" style=border:solid>
		  <thead>
		    <tr>
		      <th>게시글 번호</th>
		      <th>${boardReadInformation.BOARD_NUMBER}</th>
		      <th>좋아요</th>
		      <th><span class="badge">${likeInformation.allLikeCount}</span></th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td>작성자</td>
		      <td>${boardReadInformation.BOARD_WRITER}</td>
		      <td>작성일</td>
		      <td>${boardReadInformation.BOARD_DATE}</td>
		    </tr>
		    
		    <tr>
		    <td>수정자 E-mail</td>
		      <td>${boardReadInformation.BOARD_EDITOR}</td>
		      <td>수정일</td>
		      <td>${boardReadInformation.BOARD_EDIT_DATE}</td>
		      
		    </tr>
		   
		  </tbody>
		</table> 

		
		<div class="panel panel-info">
		  <div class="panel-heading">
		   제목 :  ${fn:replace(boardReadInformation.BOARD_TITLE,cn,br)}
		  </div>
		  <div class="panel-body" style=height:50%>
		  
			<img src= '${pageContext.request.contextPath}/resources/boardImage/${boardReadInformation.BOARD_FILE_NAME}' style="max-width: 200px; height: auto; max-height: 300px;">
		    <p>${fn:replace(boardReadInformation.BOARD_CONTENT,cn,br)}<p>
		    
		  </div>
		</div>
		
		<div class="text-center">
			<c:if test='${likeInformation.myLikeCount==0}'>
				<button type="button" id="unLikeBtn" name="unLikeBtn" onclick="unLikeBtnClick()" style="background-color:white; border:none"><img src= '${pageContext.request.contextPath}/resources/likeButton/unLike.png' style="max-width: 200px; height: auto; max-height: 100px;"></button>
			</c:if>
			
			<c:if test='${likeInformation.myLikeCount>0}'>
				<button type="button" id="LikeBtn" name="LikeBtn" onclick="likeBtnClick()" style="background-color:white; border:none"><img src= '${pageContext.request.contextPath}/resources/likeButton/like.png' style="max-width: 200px; height: auto; max-height: 100px;"></button>
			</c:if>
			<span class="badge">${likeInformation.allLikeCount}</span>
		</div>
		
		<div style="text-align: right; margin-top: 5px; margin-bottom: 5px">
            <button type="button" class="btn btn-warning btn-sm" onclick="boardBack()">돌아가기</button>
            <button type="button" class="btn btn-success btn-sm" onclick="boardUpdate();">수정</button>
            <button type="button" class="btn btn-danger btn-sm" onclick="boardDelete();">삭제</button>
        </div>
        
        <table class="table table-condensed">
			<tr>
				<td>
				<span class="form-inline" >
				댓글작성
						<div class="form-group" style="display:inline-block">
							<button type="button" id="replySubmitBtn" name="replySubmitBtn" class="btn btn-default" onclick=replySubmit(${boardReadInformation.BOARD_NUMBER});>확인</button>
						</div>
						</p> <textarea id="replyContent" name="replyContent" class="form-control col-lg-12" style="width: 100%" rows="4"></textarea>
				</span>
				</td>
			</tr>
		</table>

		<table class="table table-striped table-hover">

				<tbody>
					<c:forEach items="${boardReplyInformation}" var="reply">
						 <div class="media">
                           <p class="pull-right"><small>${reply.REPLY_DATE}</small></p>
                            <a class="media-left" href="#">
                              <img src="https://d30y9cdsu7xlg0.cloudfront.net/png/547014-200.png" width="50px">
                            </a>
                            <div class="media-body">
                                
                              <h4 class="media-heading user_name">${reply.REPLY_WRITER}</h4>
                              ${reply.REPLY_CONTENT}
                              
                            </div>
                          </div>

					</c:forEach>
				</tbody>
			</table>
    </div>
    
    <div class="modal-footer">
        <center>
            <p class="footer_text">이용약관 | 개인정보 취급방침 | Copyright® IBM 3조</p>
        </center>
    </div>

<input type="hidden" id="boardNumber" name="boardNumber">
<input type="hidden" id="likeCheck" name="likeCheck">
</form>

</body>
</html>

<script type="text/javascript">

$('#boardNumber').val(${boardReadInformation.BOARD_NUMBER});
var boardNumber = $('#boardNumber').val();

function unLikeBtnClick(){
	
	$('#likeCheck').val("unlike");
	
	$.ajax({
        url : "/board/boardLike",
        dataType : "text",
        async : false,
        type : "POST",
        data : $('#boardRead').serializeArray(),
        success: function() {
        	alert();
        	window.location.reload();
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"error:"+error);
        }
	});
}

function likeBtnClick(){
	$('#likeCheck').val("like");
	alert($('#likeCheck').val());
	
	$.ajax({
        url : "/board/boardLike",
        dataType : "text",
        async : false,
        type : "POST",
        data : $('#boardRead').serializeArray(),
        success: function() {
        	alert();
        	window.location.reload();
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"error:"+error);
        }
	});
}

function replySubmit(num){
	if($('#replyContent').val()==''){
		alert("내용 입력하세요");
	}
	else{
		
		$.ajax({
	        url : "/board/boardReplySubmit",
	        dataType : "text",
	        async : false,
	        type : "POST",
	        data : $('#boardRead').serializeArray(),
	        success: function() {
	        	window.location.reload();
	        },
	        error:function(request,status,error){
	            alert("code:"+request.status+"\n"+"error:"+error);
	        }
		});
	}
	
}

function boardUpdate(){
	
	$.ajax({
        url : "/board/boardUpdateCheck",
        dataType : "text",
        type : "POST",
        data : {"boardNumber":boardNumber},
        success: function(resultString) {
        	alert();
        	 if(resultString=="admin") {
             	alert("관리자 권한 수정");
             	$("#boardRead").attr("action", "/board/boardUpdate");
             	$("#boardRead").submit();
             }
             else if(resultString=="authority ok"){
             	$("#boardRead").attr("action", "/board/boardUpdate");
             	$("#boardRead").submit();
             	alert("일반사용자 수정");
             }
             else{
                 alert("당신은 작성자가 아닙니다.");
             }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"error:"+error);
        }
	});
}

function boardBack(){
	history.back(); 
}

function boardDelete(){
	
	$.ajax({
        url : "/board/boardDelete",
        dataType : "text",
        type : "POST",
        data : {"boardNumber":boardNumber},
        success: function(resultString) {
        	
            if(resultString=="admin") {
            	alert("관리자 권한 삭제");
            	$("#boardRead").attr("action", "/main/main");
            	$("#boardRead").submit();
            }
            else if(resultString=="authority ok"){
            	$("#boardRead").attr("action", "/main/main");
            	$("#boardRead").submit();
            	alert("일반사용자 삭제");
            }
            else{
                alert("당신은 작성자가 아닙니다.");
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"error:"+error);
        }

    });
}
</script>