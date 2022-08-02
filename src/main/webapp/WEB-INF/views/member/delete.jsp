<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 회원탈퇴</title>
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
        #user_pw2{
        	display: none;
        }
        .pwBox{
            border: 0;
            border-bottom: 1px solid lightgray;
            margin-top: 10px;
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
            height: 50px;
            margin-top: 30px;
        }
        .sorrybox{
        	width: 400px;
        	height:400px;
        	text-align: center;
        	margin-left: 25px;
        }
        #sorry_img{
        	width: 200px;
        	height: 200px;
        }
        #sorrytext{
        	margin-top: 10px;
        }
        .sorrytextbox{
        	margin-top: 15px;
        }
        .sorrybuttonbox{
        	margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>회원 탈퇴</h3>
			</div>
		</div>
		<form id="deleteForm">
             <c:choose>
				<c:when test="${not empty loginSession.user_k}">
				<div class="sorrybox">
					<div class="sorryimgbox">
						<img src="/resources/images/mypage/fail.png" id="sorry_img">
					</div>
					<span style="font-size: 1.5em; color: red;" id="sorrytitle"><strong>카카오톡 회원탈퇴 서비스 불가 안내</strong></span>
					<div class="sorrytextbox">
						<span id="sorrytext">카카오톡 회원은 현재 회원탈퇴가 불가능합니다.<br>불편을 드려 죄송합니다.<br>빠른 시일내 해당 서비스를 제공하겠습니다.</span>
					</div>
					<div class="sorrybuttonbox">
						<button type="button" id="cancelBtn" class="btn btn-warning">팝업창 닫기</button>
					</div>
				</div>
				<script>
					document.getElementById("cancelBtn").onclick = function(){ // 뒤로가기 버튼
						window.close();
					}
				</script>
					</c:when>
						<c:otherwise>	
					<div class="idBox">
						<input type="text" class="form-control" id="user_id" name="user_id" value="" placeholder="등록된 아이디 입력">
					</div>
					<div class="pwBox">
						<input type="password" class="form-control" id="user_pw" name="user_pw" value="" placeholder="등록된 비밀번호 입력">
					</div>
					<div class="buttonBox">
			               <div class="buttonBox1">
			                   <button type="button" id="deleteBtn" class="btn btn-primary">회원탈퇴</button>
			               </div>
			               <div class="buttonBox2">
			                   <button type="button" id="cancelBtn" class="btn btn-warning">취소</button>
			               </div>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<script>
		document.getElementById("deleteBtn").onclick = function(){
			
			if($("#user_pw").val()==""){
				alert("비밀번호를 입력해주세요");
				$("#user_pw").focus();
				return false
			}
			
			if (confirm("정말 탈퇴하시겠습니까?") == true) { // 탈퇴 확인
				$.ajax({
					url : "/member/checkPw"
					, type : "post"
					, data : {user_id : $("#user_id").val(), user_pw : $("#user_pw").val()}
					, success: function(data){
						console.log(data);
						if(data == "success"){
							alert("회원 탈퇴가 완료되었습니다.")
							window.opener.location.reload();
							window.close();
						}else if(data == "fail"){
							alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
							window.close();
						}
					}, error : function(e){
						console.log(e);
					}	
				})	
			} else { // 탈퇴 취소
				return false;
				alert("회원 탈퇴가 취소되었습니다.")
				window.close();
			}
		
		}
		

		document.getElementById("cancelBtn").onclick = function(){ // 취소 버튼
			window.close();
		}

	</script>
</body>
</html>