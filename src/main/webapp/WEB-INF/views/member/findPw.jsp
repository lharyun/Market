<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        /* 비밀번호 찾기창 */
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
        .emailBox{
            border: 0;
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
    </style>
</head>
<body>
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>비밀번호 찾기</h3>
			</div>
		</div>
		<form id="fingPwForm" action="/member/sendMail" method="post" name="sendMail">
			<div class="idBox">
                <label>&nbsp;&nbsp;아이디</label>
				<input type="text" class="form-control" id="user_id" name="user_id" value="" placeholder="등록된 아이디 입력">
			</div>
			<div class="emailBox">
                <label>&nbsp;&nbsp;가입시 등록한 이메일에 임시 비밀번호가 전송됩니다.</label>
			</div>
			<div class="buttonBox">
                <div class="buttonBox1">
                    <button type="button" id="findPwBtn" class="btn btn-primary">메일 전송</button>
                </div>
                <div class="buttonBox2">
                    <button type="button" id="cancelBtn" class="btn btn-warning">뒤로 가기</button>
                </div>
			</div>
		</form>
	</div>
	<script>
		// 뒤로 가기 버튼
		document.getElementById("cancelBtn").onclick = function(){
			location.href = "/member/toLogin";
		}
		
		document.getElementById("findPwBtn").onclick = function(){
			$.ajax({
				type : "post"
				, url : "/member/noticeMail"
				, data : {user_id : $("#user_id").val()}
				, datatype : "text"
				, success : function(data){
					console.log(data);
					alert("이메일을 전송하였습니다.");
				}, error : function(e){
					console.log(e);
				}
				
			})
		}
	</script>
</body>
</html>