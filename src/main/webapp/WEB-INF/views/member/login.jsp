<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<style>
    /* 로그인창 */
    .container{
        width: 450px;
        height: 600px;
        padding: 0;
    }
    .titleBox{
        text-align: center;
        margin-top: 80px;
        margin-bottom: 40px;
    }
    #user_id{
        border: 0;
    }
    .idBox{
        border: 0;
        border-bottom: 1px solid lightgray;
    }
    #user_pw{
        border: 0;
    }
    .pwBox{
        border: 0;
        border-bottom: 1px solid lightgray;
        margin-top: 10px;
    }
    .findBox{
        width: 100%;
        height: 50px;
        margin-top: 10px;
        float: left;
    }
    .findBox a{
        text-decoration: none;
        color: black;
    }
    .findBox a:hover{
        text-decoration: underline;
    }
    .findBox .findIdBox{
        width: 86px;
        float: right;
    }
    .findBox .findAndBox{
        float: right;
    }
    .findBox .findPwBox{
        width: 105px;
        float: right;
    }
    .buttonBox .btn{
        width: 100%;
        height: 55px;
        margin-top: 10px;
    }
    .signBox{
        margin-top: 30px;
        height: 50px;
        text-align: center;
    }
    .signBox .signTextBox{
        float: left;
        margin-left: 115px;
    }
    .signBox .signABox{
        float: left;
    }
    .signBox a{
        text-decoration: none;
        color: #0484f6;
        font-size: large;
    }
    #kakaoLogin{
    width: 450px;
    height: 55px;
    margin-top: 10px;
    cursor: pointer;
	}
</style>
<body>
	<div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>ID/PW 로그인</h3>
			</div>
		</div>
		<form id="loginForm">
			<div class="idBox">
				<input type="text" class="form-control" id="user_id" name="user_id" value="" placeholder="이메일 입력">
			</div>
			<div class="pwBox">
				<input type="password" class="form-control" id="user_pw" name="user_pw" value="" placeholder="비밀번호 입력">
			</div>
			<div class="findBox">
                <div class="findPwBox">
                    <a href="tofindPw">비밀번호 찾기</a>
                </div>
                <div class="findAndBox">
                    <h6><strong>&nbsp;| &nbsp;</strong></h6>
                </div>
                <div class="findIdBox">
                    <a href="tofindId">아이디 찾기</a>
                </div>
			</div>
			<div class="buttonBox">
				<button type="button" id="loginBtn" class="btn btn-primary">로그인</button><br>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=78df7cab2093de0eb394ceeec542eb6e&redirect_uri=http://localhost:8099/member/kakaoLogin&response_type=code">
				<img id="kakaoLogin" src="/resources/images/member/kakao start.png" onclick="">
				</a>
			</div>
            <div class="signBox">
                <div class="signTextBox">
                    <h5>처음이신가요?</h5>
                </div>
                <div class="signABox">
                    <a href="tosignUp2">&nbsp;회원가입</a>
                </div>
            </div>
		</form>
	</div>
	<script>
	
    // 일반 로그인
    // 로그인 요청
	document.getElementById("loginBtn").onclick = function(){
    	
	    // ID & PW 정규식
	    let regexId = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|net|co\.kr|or\.kr)$/;
	    let regexPw = /[a-zA-Z0-9~!@#$%^&*]{6,12}/;
	    
		let user_id = $("#user_id").val();
		let user_pw = $("#user_pw").val();
		
		if ($("#user_id").val() === "") {
			$('#user_id').focus();
			alert("아이디를 입력해주세요");
			return false;
		} else if ($("#user_pw").val() === "") {
			$('#user_pw').focus();
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		$.ajax({
			url : "/member/login"
			,type : "post"
			,data : {user_id : $("#user_id").val(), user_pw : $("#user_pw").val()}
			, success: function(data){
				console.log(data);
				if(data == "success"){
					opener.parent.location.reload();
					window.close();
				}else if(data == "fail"){
					alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
				}
			}, error : function(e){
				console.log(e);
			}
		})
	}
	
    // 카카오 로그인
	</script>            

	</script>
</body>
</html>