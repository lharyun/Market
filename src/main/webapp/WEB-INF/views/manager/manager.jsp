<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</head>
<style>
.container{
	
	margin-top:200px;
}
.tab-content{
border:1px solid #f47d39;
border-radius:3px;
min-height:500px;
padding:10px;
}
.cheader{
text-align:center;
}

</style>
<body>

<div class="container">
	<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-Member-tab" data-bs-toggle="tab" data-bs-target="#nav-Member" type="button" role="tab" aria-controls="nav-Member" aria-selected="true">Member</button>
    <button class="nav-link" id="nav-BlackList-tab" data-bs-toggle="tab" data-bs-target="#nav-BlackList" type="button" role="tab" aria-controls="nav-BlackList" aria-selected="false">BlackList</button>
    <button class="nav-link" id="nav-Report-tab" data-bs-toggle="tab" data-bs-target="#nav-Report" type="button" role="tab" aria-controls="nav-Report" aria-selected="false">Report</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-Member" role="tabpanel" aria-labelledby="nav-Member-tab"><!-- 1Page -->
  <div class="Cheader">
  <div class="row">
  	<div class="col-1">체크박스</div>
  	<div class="col-2">아이디</div>
  	<div class="col-2">카테고리</div>
  	<div class="col-2">닉네임</div>
  	<div class="col-2">이름</div>
  	<div class="col-2">핸드폰번호</div>
  	<div class="col-1">블랙</div>  
  	
  </div>
   <hr style="border:1px solid #f47d39;">
  </div>
  <div class="Cbody">
  <div class="row">
  <c:forEach items="${list }" var="dto">
  	<div class="col-1"><input class="check" type="checkbox" value="${dto.user_id }"/></div>
  	<div class="col-2">${dto.user_id }</div>
  	<div class="col-2">${dto.user_category }</div>
  	<div class="col-2">${dto.user_nickname }</div>
  	<div class="col-2">${dto.user_name }</div>
  	<div class="col-2">${dto.user_phone }</div>
  	<div class="col-1">${dto.blackList_check }</div>
  	
  	
  	</c:forEach>
  	
  </div>
  <div class="cfooter">
  	<div class="row">
  		<div class="col-8">
  		
  		</div>
  		<div class="col-4">
  			<button class="btn btn-danger" id="deleteBtn">삭제</button>
  			<button class="btn btn-warning" id="blackBtn">블랙리스트</button>
  		</div>
  	</div>
  </div>
  </div>
  	

  
  
  </div>
  <div class="tab-pane fade" id="nav-BlackList" role="tabpanel" aria-labelledby="nav-BlackList-tab">
	<div class="Cheader">
  <div class="row">
  	<div class="col-2">번호</div>
  		<div class="col-2">날짜</div>
  	<div class="col-2">아이디</div>
  	<div class="col-2">사유</div>
  	   
  </div>
  </div>

  <div class="Cbody">
  <div class="row">
  <c:forEach items="${list }" var="dto">
  	
  	<div class="col-2">${dto.user_id }</div>
  	<div class="col-2">${dto.user_category }</div>
  	<div class="col-2">${dto.user_nickname }</div>
  	
  
  	</c:forEach>
  	
  </div>
  </div>
</div><!-- 2Page -->
  <div class="tab-pane fade" id="nav-Report" role="tabpanel" aria-labelledby="nav-Report-tab">...</div><!-- 3Page -->
</div>
</div>
<script>


	$("#blackBtn").on("click",function(){
let checkArr=$(".check:checked");
		
		let arr=Array();
		
		 for(let i=0;i<checkArr.length;i++){
			arr.push(checkArr[i].value);			
		} 
		
		if(checkArr.length == 0){
			alert("체크박스를 선택해주세요")
			return;
		}else{
			if(confirm("해당 회원을 블랙리스트 시키겠습니까?")){
				$.ajax({
					url: "/blackList/black",
					type:'post',
					data:{
						"arr[]": arr
					},
					success: function(data){
						console.log(data);
						alert("해당 데이터가 삭제되었습니다.")
						location.href="/member/toManager";
					},
					error:function(e){
						console.log(e);
					}
				});
			}
			
			
			
		}
	})
	$("#deleteBtn").on("click",function(){
		let checkArr=$(".check:checked");
		
		let arr=Array();
		
		 for(let i=0;i<checkArr.length;i++){
			arr.push(checkArr[i].value);			
		} 
		
		if(checkArr.length == 0){
			alert("체크박스를 선택해주세요")
			return;
		}else{
			if(confirm("해당 회원을 정말 삭제하시겠습니까?")){
				$.ajax({
					url: "/member/delete",
					type:'post',
					data:{
						"arr[]": arr
					},
					success: function(data){
						console.log(data);
						alert("해당 데이터가 삭제되었습니다.")
						location.href="/member/toManager";
					},
					error:function(e){
						console.log(e);
					}
				});
			}
		
		}
	
	})

</script>
</body>
</html>