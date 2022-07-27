<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>싸다구 장터 : 카카오 회원가입</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/header_pooter/pepoel.png">
     <!-- css -->
    <link href="/resources/css/header_footer.css" rel="stylesheet" type="text/css">
     <!-- 다음 우편찾기 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
</head>
	<style>
	    /* 회원가입 */
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
	    .idBox2{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	    }
	    /* #user_pw{
	        border: 0;
	        display: none;
	    }
	    .pwBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	        display: none;
	    }
	    #user_pwCheck{
	        border: 0;
	        display: none;
	    }
	    .pwBox2{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	        display: none;
	    } */
	    #user_nickname{
	        border: 0;
	    }
	    .nicknameBox2{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	    }
	    #user_name{
	        border: 0;
	    }
	    .nameBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	    }
	    #user_k{
	        border: 0;
	        display: none;
	    }
	    .kBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	        display: none;
	    }
	    #user_pw{
	        border: 0;
	        display: none;
	    }
	    .pwBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	        display: none;
	    }
	    #user_birth{
	        border: 0;
	    }
	    .birthBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	    }
	    .birthBox2{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
	    }
	    #user_phone{
	        border: 0;
	    }
	    .phoneBox{
	        border: 0;
	        border-bottom: 1px solid lightgray;
	        margin-top: 10px;
	        width: 100%;
	        float: left;
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
	    .modal-content{
	    	width: 500px;
	    	height: 250px;
	    }
	    .modal-body{
	        width: 100%;
	        height: 100%;
	        text-align: center;
	    }
	    #backBtn{
	    	width: 123.33px;
	    	height: 38px;
	    }
	</style>
<body>
<form id="signupForm">
    <div class="container">
		<div class="row m-3"> 
			<div class="titleBox">
				<h3>카카오 회원가입</h3>
			</div>
		</div>
            <div class="idBox">
                <div class="idBox2">
                    <input type="text" class="form-control" id="user_id" name="user_id" value="${user_id}" readonly>
                </div>
                <div class="idBox2text">
                	<span id="inputResult"></span>
                </div>
            </div>
            
            <div class="nicknameBox">
                <div class="nicknameBox2">
                    <input type="text" class="form-control" id="user_nickname" name="user_nickname" value="${user_nickname}" readonly>
                </div>
                <div class="nicknameBox2text">
                	<span id="inputResult4"></span>
                </div>
            </div>
            
            <div class="kBox">
                <div class="kBox2">
                    <input type="text" class="form-control" id="user_k" name="user_k" value="${user_k}">
                </div>
            </div>
            
            <div class="pwBox">
                <div class="pwBox2">
                    <input type="password" class="form-control" id="user_pw" name="user_pw" value="kakaoPw">
                </div>
            </div>
            
            <div class="nameBox">
				<input type="text" class="form-control" id="user_name" name="user_name" value="" placeholder="이름">
				<div class="nameBoxtext">
					<span id="inputResult5"></span>
				</div>
			</div>
			
            <div class="birthBox">
				<input type="text" class="form-control" id="user_birth" name="user_birth" value="" placeholder="생년월일">
				<div class="birthBoxtext">
					<span id="inputResult6"></span>
				</div>
			</div>
			
			<div class="phoneBox">
				<input type="text" class="form-control" id="user_phone" name="user_phone" value="" placeholder="휴대폰번호">
				<div class="phoneBoxtext">
					<span id="inputResult7"></span>
				</div>
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
                    <button type="button" class="btn btn-secondary" id="backBtn">뒤로가기</button>
                </div>
            </div>
		</div>
	</form>
	<script>
		// 뒤로 가기 버튼
		document.getElementById("backBtn").onclick = function(){
			location.href = "/member/toLogin";
		}
	
		// user_id
		$("#user_id").on("keyup", function(e) {
			let regexId = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|net|co\.kr|or\.kr)$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){
				if(!regexId.test($("#user_id").val())) {
					$("#inputResult").html("&nbsp;&nbsp;이메일 형식으로 입력해주세요").css({color:'#f44336', 'float':'left'})
					$("#user_id").focus();
					return;
				}else{
		   				
					$.ajax({
						url : "/member/checkLogin"
						,type : "get"
						,data : {user_id : $("#user_id").val()}
						, success: function(data){
							if(data == "available"){
								$("#inputResult").html("&nbsp;&nbsp;사용 가능한 아이디입니다").css({color:'#04AA6D', 'float':'left'})
							}else if(data == "unavailable"){
								$("#inputResult").html("&nbsp;&nbsp;중복된 아이디입니다").css({color:'#f44336', 'float':'left'})
							}
						}, error : function(e){
							console.log(e);
						}
					})
				}
			}
		})
		
		// user_nickname
		$("#user_nickname").on("keyup", function(e) {
			let regexNickname = /^[a-zA-Z0-9ㄱ-힣]{4,8}$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){ 
				if(!regexNickname.test($("#user_nickname").val())) {
					$("#inputResult4").html("&nbsp;&nbsp;특수문자 제외 4~8자내로 입력해주세요(공백제외)").css({color:'#f44336', 'float':'left'})
					$("#user_nickname").focus();
					return;
				}else{
		   				
					$.ajax({
						url : "/member/checkNickname"
						,type : "get"
						,data : {user_nickname : $("#user_nickname").val()}
						, success: function(data){
							if(data == "available"){
								$("#inputResult4").html("&nbsp;&nbsp;사용 가능한 닉네임입니다").css({color:'#04AA6D', 'float':'left'})
							}else if(data == "unavailable"){
								$("#inputResult4").html("&nbsp;&nbsp;중복된 닉네임입니다").css({color:'#f44336', 'float':'left'})
							}
						}, error : function(e){
							console.log(e);
						}
					})
				}
			}
		})
		
		// user_name
		$("#user_name").on("keyup", function(e) {
			let regexName = /^[ㄱ-힣]{2,4}$/;
			// 8 : Backspace / 13 : Enter
			console.log($("#user_name").val());
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){ 
				if(!regexName.test($("#user_name").val())) {
					$("#inputResult5").html("&nbsp;&nbsp;한글로 2~4자내로 입력해주세요").css({color:'#f44336', 'float':'left'})
					$("#user_name").focus();
					return;
				}else{
					$("#inputResult5").html("&nbsp;&nbsp;한글로 2~4자내로 입력해주세요").css({color:'#04AA6D', 'float':'left'})
				}
			}
		})
		
		// user_birth
		$("#user_birth").on("keyup", function(e) {
			let regexBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key)
			console.log($("#user_birth").val());
			if(e.key !== 'Backspace' && e.key !== 'Enter'){
				if(!regexBirth.test($("#user_birth").val())) {
					$("#inputResult6").html("&nbsp;&nbsp;예)1999년 1월 1일 -> 19990101로 입력해주세요").css({color:'#f44336', 'float':'left'})
					$("#user_birth").focus();
					return;
				}else{
					$("#inputResult6").html("&nbsp;&nbsp;예)1999년 1월 1일 -> 19990101로 입력해주세요").css({color:'#04AA6D', 'float':'left'})
				}
			}
		})
		
		// user_phone
		$("#user_phone").on("keyup", function(e) {
			let regexPhone = /^[0-9]{11}$/;
			// 8 : Backspace / 13 : Enter
			console.log(e.key);
			if(e.key !== 'Backspace' && e.key !== 'Enter'){
				if(!regexPhone.test($("#user_phone").val())) {
					$("#inputResult7").html("&nbsp;&nbsp;예)010-1234-5678 -> 01012345678로 입력해주세요").css({color:'#f44336', 'float':'left'})
					$("#user_phone").focus();
					return;
				}else{
		   				
					$.ajax({
						url : "/member/checkPhone"
						,type : "get"
						,data : {user_phone : $("#user_phone").val()}
						, success: function(data){
							if(data == "available"){
								$("#inputResult7").html("&nbsp;&nbsp;예)010-1234-5678 -> 01012345678로 입력해주세요").css({color:'#04AA6D', 'float':'left'})
							}else if(data == "unavailable"){
								$("#inputResult7").html("&nbsp;&nbsp;중복된 휴대폰번호입니다").css({color:'#f44336', 'float':'left'})
							}
						}, error : function(e){
							console.log(e);
						}
					})
				}
			}
		})
		
		// 다음 우편번호 api
		$("#btnPostCode").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
					var roadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 참고 항목 변수
	
					if (data.bname !== ''
							&& /[동|로|가]$/g
									.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다
					if (data.buildingName !== ''
							&& data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName
								: data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' ('
								+ extraRoadAddr + ')';
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					$("#postcode").val(data.zonecode);
					$("#roadAddr").val(roadAddr);
	
					// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					if (roadAddr !== '') {
						$("#extraAddr").val(
								extraRoadAddr);
					} else {
						$("#extraAddr").val("");
					}
				}
			}).open();
		})
		
		// 회원가입 버튼 클릭시
		document.getElementById("signupBtn").onclick = function(){ // 회원가입 제출 유효성 검사
		    let regexId = /^[a-zA-Z][\w]+@[a-zA-Z]+\.(com|net|co\.kr|or\.kr)$/;
		    let regexPw = /^[a-zA-Z0-9~!@#$%^&*]{6,12}$/;
		    let regexNickname = /^[a-zA-Z0-9ㄱ-힣]{4,8}$/;
			let regexName = /^[ㄱ-힣]{2,4}$/;
			let regexBirth = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
			let regexPhone = /^[0-9]{11}$/;
	
			let user_id = $("#user_id").val();
			let user_pw = $("#user_pw").val();
			let user_nickname = $("#user_nickname").val();
			let user_name = $("#user_name").val();
			let user_birth = $("#user_birth").val();
			let user_phone = $("#user_phone").val();
			let postcode = $("#postcode").val();
			let roadAddr = $("#roadAddr").val();
			
			if ($("#user_id").val() === "") {
				$('#user_id').focus();
				return false;
			} else if ($("#user_pw").val() === "") {
				$('#user_pw').focus();
				return false;
			} else if ($("#user_nickname").val() === "") {
				$('#user_nickname').focus();
				return false;
			}else if ($("#user_name").val() === "") {
				$('#user_name').focus();
				return false;
			}  else if (!regexBirth.test($("#user_birth").val())) {
				$('#user_birth').focus();
				return false;
			} else if (!regexPhone.test($("#user_phone").val())) {
				$('#user_phone').focus();
				return false;
			} else if ($("#postcode").val() === "" || $("#roadAddr").val() === "") {
				$('#postcode').focus();
				return false;
			}

			$.ajax({
				url : "/member/kakaosignUp"
				,type : "post"
				,data : {user_id : $("#user_id").val(), user_k : $("#user_k").val(), user_pw : "kakaoPw",
					 user_nickname : $("#user_nickname").val(), user_name : $("#user_name").val(), user_birth : $("#user_birth").val(),
					 user_phone : $("#user_phone").val(), postcode : $("#postcode").val(), roadAddr : $("#roadAddr").val(),
					 detailAddr : $("#detailAddr").val(), extraAddr : $("#extraAddr").val()}
				, success: function(data){
					console.log(data);
					alert("회원 가입이 완료되었습니다.");
					window.close();
				}, error : function(e){
					alert("입력값을 제대로 입력해주세요.")
					console.log(e);
				}
			})
			
		}

	</script>
</body>
</html>