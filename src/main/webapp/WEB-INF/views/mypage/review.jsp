<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<title>싸다구 장터 : 후기페이지</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/header_pooter/pepoel.png">
<!-- css -->
<link href="/resources/css/header_footer.css" rel="stylesheet">
<style>

 .img {
        border-radius: 15px;
      }
  img {
        width: 50px;
        height: 50px;
     }
      
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 1.5em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 500px;
	height: 100px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}
</style>
</head>
<body>
	<div class="container text-center p-5">
		<c:forEach items="${list }" var="dto">
			<div class="row">
				<div class="col-3">
					<div class="img">
						<img src="/img/1.jpg" alt="" />
					</div>
				</div>
				<div class="col-9">
					<div class="row">
						<div class="col-5">닉네임:${dto.review_nickname }</div>
						<div class="col-7">별점
							<c:if test="${dto.review_rating eq '1' }">
                                            ⭐
                                        </c:if>
							<c:if test="${dto.review_rating eq '2' }">
                                            ⭐⭐
                                        </c:if>
							<c:if test="${dto.review_rating eq '3' }">
                                            ⭐⭐⭐
                                        </c:if>
							<c:if test="${dto.review_rating eq '4' }">
                                           ⭐⭐⭐⭐
                                        </c:if>
							<c:if test="${dto.review_rating eq '5' }">
                                            ⭐⭐⭐⭐⭐
                                        </c:if>
						</div>
					</div>
					<div class="row">
						
						<div class="col"><button type="button" class="btn" value="${dto.review_seq }"><img src="/resources/images/review/report.png"></button></div>
					</div>
					<div class="row">
						<div class="col">후기:${dto.review_comment }</div>
					</div>

				</div>
			</div>
			<hr>
		</c:forEach>
		<nav aria-label="Page navigation example ">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#">Previous</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
	</div>
	<div class="container">
		<form action="" class="mb-3" name="myform" id="myform" method="post">
			<fieldset>
				<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
					name="review_rating" value="5" id="rate1"><label for="rate1">⭐</label>
				<input type="radio" name="review_rating" value="4" id="rate2"><label
					for="rate2">⭐</label> <input type="radio" name="review_rating"
					value="3" id="rate3"><label for="rate3">⭐</label> <input
					type="radio" name="review_rating" value="2" id="rate4"><label
					for="rate4">⭐</label> <input type="radio" name="review_rating"
					value="1" id="rate5"><label for="rate5">⭐</label>
			</fieldset>
			<div class="">
				<textarea class="col-auto form-control d-inline" name="review_comment" id="reviewContents"
					placeholder="후기를 남겨주세요!"></textarea>
					<input value="${loginSession.user_id }" name="user_id" class="d-none">
					<input value="${loginSession.user_category }" name="user_category" class="d-none">
					<input value="${loginSession.user_nickname}" name="review_nickname" class="d-none">
					<c:choose>
						<c:when test="${empty loginSession.user_profile }">
						<input value="" name="review_profile" class="d-none">
						</c:when>
						<c:otherwise>
						<input value="${loginSession.user_profile }" name="review_profile" class="d-none">
						</c:otherwise>
					</c:choose>
					<input value="${loginSession.user_id }" name="reviewed_id" class="d-none">
				<button id="submitBtn" type="button" class="btn btn-primary align-self-center">제출</button>
			</div>
			
		</form>
	</div>
	<script>
		$("#submitBtn").on("click",function(){
			$("#myform").submit();
			var data=$("#myform").serialize();
			$.ajax({
				url:"/review/review_write",
				type:"post",
				data:data,
				success:function(data){
					console.log(data);
					location.reload();
				},
				error:function(e){
					console.log(e);
				}
			
			})
			
			location.reload();
		})
	
	</script>
</body>
</html>