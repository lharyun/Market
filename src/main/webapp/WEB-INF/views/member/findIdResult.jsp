<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 아이디 찾기 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        /* 아이디 찾기 결과창 */
        .container{
            width: 450px;
            height: 600px;
            padding: 0;
        }
        .resultBox{
            width: 100%;
            height: 150px;
            border: 1px solid black;
            text-align: center;
            margin-top: 80px;
            margin-bottom: 40px;
        }
        .resultBox .result{
            text-align: center;
            margin-top: 10px;
        }
        #no_profile{
            width: 50px;
            height: 50px;
            text-align: center;
        }
        #ok_profile{
            width: 100px;
            height: 50px;
            text-align: center;
        }
        .resultBox2{
            margin-top: 30px;
        }
        .buttonBox{
            width: 100%;
            height: 100px;
        }
        .buttonBox1{
            width: 49%;
            float: left;
        }
        .buttonBox1 .btn{
            float: right;
        }
        .buttonBox2{
            width: 49%;
            float: right;
        }
        .buttonBox2 .btn{
            float: left;
        }
        .buttonBox .btn{
            width: 100px;
            height: 40px;
            margin-top: 30px;
        }
        .buttonBox3{
            width: 100%;
            height: 100px;
        }
        .buttonBox3 .btn{
            width: 100px;
            height: 40px;
            margin-top: 30px;
        }
        .buttonBox4{
            width: 100%;
            text-align: center;
        }
        .buttonBox4 .btn{
            width: 50%;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${rs eq true}">
            <div class="content">
                <div class="row m-3">
                    <div class="resultBox">
                        <div class="resultBox2">
                            <img src="/resources/images/member/ok_profile.png" id="ok_profile">
                            <p class="result"><strong>회원님의 아이디는 ${user_id} 입니다.</strong></p>
                        </div>
                    </div>
                </div>
                <div class="buttonBox3">
                    <div class="buttonBox4">
                        <button type="button" id="loginBtn" class="btn btn-warning">로그인</button>
                    </div>
                </div>
            </div>
        </c:if>
        <script>
			// 로그인 버튼
			document.getElementById("loginBtn").onclick = function(){
				location.href = "/member/toLogin";
			}
		</script>
        <c:if test="${rs eq false}">
            <div class="content">
                <div class="row m-3">
                    <div class="resultBox">
                        <div class="resultBox2">
                            <img src="/resources/images/member/no_profile.png" id="no_profile">
                            <p class="result"><strong>등록된 회원정보가 없습니다.</strong></p>
                        </div>
                    </div>
                </div>
                <div class="buttonBox">
                    <div class="buttonBox1">
                        <button type="button" id="refindBtn" class="btn btn-primary">다시찾기</button>
                    </div>
                    <div class="buttonBox2">
                        <button type="button" id="signupBtn" class="btn btn-warning">회원가입</button>
                    </div>
                </div>
            </div>
        </c:if>
	</div>
	<script>
	
	// 다시 찾기 버튼
	document.getElementById("refindBtn").onclick = function(){
		location.href = "/member/tofindId";
	}
	
	// 회원가입 버튼
	document.getElementById("signupBtn").onclick = function(){
		location.href = "/member/tosignUp2";
	}
	
	
	</script>
</body>
</html>