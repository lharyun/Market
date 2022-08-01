<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 비밀번호 변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        /* 회원탈퇴창 */
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
        #user_pw{
            border: 0;
        }
        .pwBox{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            width: 100%;
	        float: left;
        }
	    #user_pwCheck{
	        border: 0;
	    }
        .pwBox2{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
            width: 100%;
	        float: left;
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
            width: 130px;
            height: 50px;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>비밀번호 변경</h3>
			</div>
		</div>
		<form id="deleteForm">
            <div class="pwBox">
            	<label>&nbsp;새 비밀번호</label><br>
				<input type="password" class="form-control" id="user_pw" name="user_pw" value="">
			</div>
            <div class="pwBoxtext">
            	<span id="inputResult2"></span>
            </div>
            <div class="pwBox2">
            	<label>&nbsp;새 비밀번호 확인</label><br>
				<input type="password" class="form-control" id="user_pwCheck" value="">
			</div>
            <div class="pwBox2text">
            	<span id="inputResult3"></span>
            </div>
			<div class="buttonBox">
                <div class="buttonBox1">
                    <button type="button" id="changepwBtn" class="btn btn-primary">비밀번호 변경</button>
                </div>
                <div class="buttonBox2">
                    <button type="button" id="cancelBtn" class="btn btn-warning">취소</button>
                </div>
			</div>
			<input type="text" class="" value="${loginSession.user_id}" id="user_id">
		</form>
	</div>
	<script>
	 	// user_pw
		$("#user_pw").on("keyup", function(e) {
			let regexPw = /^[a-zA-Z0-9~!@#$%^&*]{6,12}$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){
				if(!regexPw.test($("#user_pw").val())) {
					$("#inputResult2").html("&nbsp;&nbsp;비밀번호는 6~12자 이내로 입력해주세요<br>&nbsp;&nbsp;(영어 대소문자, 숫자, 특수문자 포함 가능)").css({color:'#f44336', 'float':'left'})
					$("#user_pw").focus();
					return;
				}else{
					$("#inputResult2").html("&nbsp;&nbsp;사용 가능한 비밀번호입니다").css({color:'#04AA6D', 'float':'left'})
				}
			}
		})
		
		// user_pwCheck
		$("#user_pwCheck").on("keyup", function(e) {
			let regexPw = /^[a-zA-Z0-9~!@#$%^&*]{6,12}$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){
				if($("#user_pw").val() !== $("#user_pwCheck").val()) {
					$("#inputResult3").html("&nbsp;&nbsp;비밀번호가 일치하지 않습니다").css({color:'#f44336', 'float':'left'})
					$("#user_pwCheck").focus();
					return;
				}else{
					$("#inputResult3").html("&nbsp;&nbsp;비밀번호가 일치합니다&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;").css({color:'#04AA6D', 'float':'left'})
				}
			}
		})
	
		document.getElementById("changepwBtn").onclick = function(){
	 		
			if ($("#user_pw").val() === "") {
				$('#user_pw').focus();
				alert("비밀번호를 입력해주세요");
				return false;
			} else if ($("#user_pwCheck").val() === "") {
				$('#user_pwCheck').focus();
				alert("비밀번호를 확인을 입력해주세요");
				return false;
			}
			
			if(confirm("정말 변경하시겠습니까?") == true) { // 변경 확인
				$.ajax({
					url : "/mypage/changepw"
					, type : "post"
					, data : {user_id : $("#user_id").val(), user_pw : $("#user_pw").val()}
					, success: function(data){
						console.log(data);
						if(data == "changeSuccess"){
							alert("비밀번호 변경이 완료되었습니다.")
							window.opener.location.reload();
							window.close();
						}else {
							alert("입력값이 잘못되었습니다.");
							window.close();
						}
					}, error : function(e){
						console.log(e);
					}	
				})	
			} else { // 변경 취소
				alert("비밀번호 변경이 취소되었습니다.")
				window.close();
				return;
			}
		
		}
		

		document.getElementById("cancelBtn").onclick = function(){ // 취소 버튼
			window.close();
		}

	</script>
</body>
</html>