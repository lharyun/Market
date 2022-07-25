<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>싸다구장터 : 아이디 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        /* 아이디 찾기창 */
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
        #user_name{
            border: 0;
        }
        .nameBox{
            border: 0;
            border-bottom: 1px solid lightgray;
        }
        #user_phone{
            border: 0;
        }
        .phoneBox{
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
    </style>
</head>
<body>
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>아이디 찾기</h3>
			</div>
		</div>
		<form id="findIdForm" action="/member/findId" method="post">
			<div class="nameBox">
				<input type="text" class="form-control" id="user_name" name="user_name" value="" placeholder="등록된 이름 입력">
			</div>
			<div class="phoneBox">
				<input type="text" class="form-control" id="user_phone" name="user_phone" value="" placeholder="등록된 전화번호 입력">
			</div>
			<div class="buttonBox">
                <div class="buttonBox1">
                    <button type="button" id="findBtn" class="btn btn-primary">찾기</button>
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
		
		$("#findBtn").on("click", function(){
			
	        if ($("#user_name").val() === "") {
	            alert("이름을 입력해 주세요.");
	            return;
	        } else if ($("#user_phone").val().length != 11) {
	            alert("전화번호를 정확하게 입력해 주세요.");
	            return;
	        }
	       $("#findIdForm").submit();
		})
	</script>
</body>
</html>