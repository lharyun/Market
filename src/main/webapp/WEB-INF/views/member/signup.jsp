<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 회원가입 */
        /* *{
            border: 1px solid black;
        } */
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
        .idBox2{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            width: 74%;
            float: left;
        }
        #pw{
            border: 0;
        }
        .pwBox{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
        }
        #pw_check{
            border: 0;
        }
        .pwBox2{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
        }
        #nickname{
            border: 0;
        }
        .nicknameBox2{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            width: 74%;
            float: left;
        }
        #name{
            border: 0;
        }
        .nameBox{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
        }
        #phone{
            border: 0;
        }
        .phoneBox{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
        }
        #postcode{
         border: 0;
         width: 98%;
        }
        #roadAddr{
         border: 0;   
        }
        #detailAddr{
         border: 0;
         width: 98%;
        }
        #extraAddr{
         border: 0;
        }
        .row .col{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            padding: 0; 
        }
        #noBox{
            border: 0;
            width: 95%;
        }
        #checkId{
            margin-top: 7px;
            float: right;
        }
        #checkNickname{
            margin-top: 7px;
            float: right;
        }
        #kakaoSignup{
            width: 130px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>회원가입</h3>
			</div>
		</div>
		<form id="fingIdForm">
            <div class="idBox">
                <div class="idBox2">
                    <input type="text" class="form-control" id="id" name="id" value="" placeholder="아이디">
                </div>
                <button type="button" class="btn btn-primary w-40" id="checkId">아이디 확인</button>
                <div class="idBox2text">
                    <label>&nbsp;&nbsp;이메일 형식으로 입력해주세요.</label>
                </div>
            </div>
            <div class="pwBox">
				<input type="password" class="form-control" id="pw" name="pw" value="" placeholder="비밀번호">
			</div>
            <div class="pwBoxtext">
                <label>&nbsp;&nbsp;비밀번호는 6~12자 이내로 입력해주세요.</label>
                <label>&nbsp;&nbsp;(영어 대소문자, 숫자, 특수문자 포함)</label>
            </div>
            <div class="pwBox2">
				<input type="password" class="form-control" id="pw_check" value="" placeholder="비밀번호 확인">
			</div>
            <div class="pwBox2text">
                <label>&nbsp;&nbsp;위와 동일한 비밀번호를 입력해주세요.</label>
            </div>
            <div class="nicknameBox">
                <div class="nicknameBox2">
                    <input type="text" class="form-control" id="nickname" name="nickname" value="" placeholder="닉네임">
                </div>
                <button type="button" class="btn btn-primary w-40" id="checkNickname">닉네임 확인</button>
                <div class="nicknameBox2text">
                    <label>&nbsp;&nbsp;사이트에서 사용할 닉네임을 입력해주세요.</label>
                </div>
            </div>
            <div class="nameBox">
				<input type="text" class="form-control" id="name" name="name" value="" placeholder="이름">
			</div>
            <div class="pwBox2">
				<input type="text" class="form-control" id="pw_check" value="" placeholder="생년월일">
			</div>
            <div class="pwBox2text">
                <label>&nbsp;&nbsp;예)1999년 1월 1일 -> 19990101</label>
            </div>
			<div class="phoneBox">
				<input type="text" class="form-control" id="phone" name="phone" value="" placeholder="휴대폰번호">
			</div>
            <div class="row p-2">
                <div class="col">
                    <input type="text" class="form-control" id="postcode" name="postcode" placeholder="우편번호">
                </div>
                <div class="col" id="noBox">
                    <button type="button" class="btn btn-primary w-100" id="btnPostCode">우편번호 찾기</button>
                </div>
            </div>
            <div class="row p-2">
                <div class="col">
                    <input type="text" class="form-control" id="roadAddr" name="roadAddr" placeholder="도로명주소">
                </div>
            </div>
            <div class="row p-2">
                <div class="col mb-2">
                    <input type="text" class="form-control" id="detailAddr" name="detailAddr" placeholder="상세주소">
                </div>
                <div class="col mb-2">
                    <input type="text" class="form-control" id="extraAddr" name="extraAddr" placeholder="읍/면/동">
                </div>
            </div>
            <div class="row p-3 justify-content-center">
                <div class="col-4 d-flex justify-content-center">
                    <button type="button" class="btn btn-warning w-100" id="signupBtn">회원가입</button>
                </div>
            </div>
            <div class="text-center">
                <span>또는</span>
            </div>
            <div class="row p-3 justify-content-center">
                <div class="col-12 d-flex justify-content-center">
                    <img id="kakaoSignup" src="/resources/images/member/kakao login.png" onclick="">
                </div>
            </div>
		</form>
	</div>
</body>
</html>