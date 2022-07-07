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
        #id{
            border: 0;
        }
        .idBox{
            border: 0;
            border-bottom: 1px solid lightgray;
        }
        #pw{
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
    </style>
</head>
<body>
	<div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>ID/PW 로그인</h3>
			</div>
		</div>
		<form id="loginForm">
			<div class="idBox">
				<input type="text" class="form-control" id="id" name="id" value="" placeholder="이메일 입력">
			</div>
			<div class="pwBox">
				<input type="password" class="form-control" id="pw" name="pw" value="" placeholder="비밀번호 입력">
			</div>
			<div class="findBox">
                <div class="findPwBox">
                    <a href="findPw.jsp">비밀번호 찾기</a>
                </div>
                <div class="findAndBox">
                    <h6><strong>&nbsp;| &nbsp;</strong></h6>
                </div>
                <div class="findIdBox">
                    <a href="findId.jsp">아이디 찾기</a>
                </div>
			</div>
			<div class="buttonBox">
				<button type="button" id="loginBtn" class="btn btn-primary">로그인</button><br>
				<button type="button" id="kakaoBtn" class="btn btn-warning">카카오톡으로 시작하기</button>
			</div>
            <div class="signBox">
                <div class="signTextBox">
                    <h5>처음이신가요?</h5>
                </div>
                <div class="signABox">
                    <a href="signup.jsp">&nbsp;회원가입</a>
                </div>
            </div>
		</form>
	</div>
</body>
</html>