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
.starBox {
	margin-left: 50px;
}

.reportImg {
	width: 25px;
	height: 25px;
}

#review_comment {
	background-color: white;
}

.imgBox>img {
	border-radius: 100%;
}

.imgBox>img {
	width: 50px;
	height: 50px;
}

.textBox {
	
}

.modify_img {
	width: 30px;
	height: 30px;
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

.starC {
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
	padding-right: 0px;
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
	<div class="container text-center id="reviewBox">
		<c:choose>
			<c:when test="${!empty list}">

				<c:forEach items="${list }" var="dto">
					<div class="row">
						<div class="col-2 imgBox">
							<c:choose>
								<c:when test="${empty dto.review_profile}">
									<img src="/resources/images/mypage/default_profileimage.jpg"
										id="profile_image">
								</c:when>
								<c:otherwise>
									<img src="/user_profile/${dto.review_profile}"
										id="profile_image">
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-10">
							<div class="row">
								<div class="col-5 text-start ">
									<strong>${dto.review_nickname }</strong>
								</div>
								<div class="col-7 text-end">

									<c:if test="${dto.review_rating eq '1' }">
                                            ⭐<span class="starC">⭐⭐⭐⭐</span>
									</c:if>
									<c:if test="${dto.review_rating eq '2' }">
										⭐⭐
										<span class="starC">⭐⭐⭐</span>
									</c:if>
									<c:if test="${dto.review_rating eq '3' }">
										⭐⭐⭐
										<span class="starC">⭐⭐</span>
									</c:if>
									<c:if test="${dto.review_rating eq '4' }">
										⭐⭐⭐⭐
										<span class="starC">⭐</span>
									</c:if>
									<c:if test="${dto.review_rating eq '5' }">
                                          ⭐⭐⭐⭐⭐
                                        </c:if>
								</div>
							</div>
							<div class="row">
								<div class="col-8 text-start">
									<textarea style="resize: none;" id="review_comment"
										class="form-control overflow-auto review_comment"
										name="review_comment" placeholder="댓글내용" readonly> ${dto.review_comment}</textarea>
								</div>
								<div class="col-4">
									<!-- 수정,삭제버튼 -->
									<div class="d-none d-inline btn-primary" id="divWrite">
										<button type=submit class="btn mt-2 btnSave complete-reply "
											id="btnSave" value="${dto.review_seq}">등록</button>
									</div>
									<div class="dropdown d-inline" id="modify_box">
										<button type="button" class="btn btnModify" id=""
											data-bs-toggle="dropdown" aria-expanded="true">
											<img src="/resources/images/review/modify.png"
												class="modify_img" width="50%;">
										</button>
										<ul class="dropdown-menu"
											aria-labelledby="dropdownMenuButton1">
											<li><button
													class="dropdown-item modify-post_comment modify-review"
													value="${dto.review_seq}">수정</button></li>
											<li><button
													class="dropdown-item delete-post_comment delete-review"
													value="${dto.review_seq}">삭제</button></li>
										</ul>
									</div>
									<div class="d-inline report-box">
										<button type="button" class="btn" value="${dto.review_seq }">
											<img src="/resources/images/review/report.png"
												class="reportImg">
										</button>
									</div>



								</div>
							</div>




						</div>
					</div>
					<hr>
				</c:forEach>

			</c:when>
			<c:otherwise>
				<div class="row">
					<div class="col">
						<strong>등록된 후기글이 없습니다.</strong>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="cfooter">
			<div class="row">
				<div class="col">
					<div id="pagination">
						<nav class="pagination justify-content-center">
							<ul class="pagination">
								<c:if test="${naviMap.needPrev eq true }">
									<li class="page-item"><a class="page-link"
										href="/review/review?reviewed_id=${dto.reviewed_id }&&curPage=${naviMap.startNavi-1}">Previous</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${naviMap.startNavi }"
									end="${naviMap.endNavi }" step="1">
									<li class="page-item"><button
											class="page-link memberPage " value="${ pageNum}">${ pageNum}</button></li>
								</c:forEach>
								<c:if test="${naviMap.needNext eq true }">
									<li class="page-item"><a class="page-link"
										href="/review/review?reviewed_id=${dto.reviewed_id }&&curPage=${naviMap.endNavi+1}">Next</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<c:if test="${loginSession.user_id ne dto.reviewed_id}">
			<form action="" class="mb-3" name="myform" id="myform" method="post">
				<div class="">
					<fieldset>
						<span class="text-bold ">별점을 선택해주세요</span> <input type="radio"
							name="review_rating" value="5" id="rate1"><label
							for="rate1">⭐</label> <input type="radio" name="review_rating"
							value="4" id="rate2"><label for="rate2">⭐</label> <input
							type="radio" name="review_rating" value="3" id="rate3"><label
							for="rate3">⭐</label> <input type="radio" name="review_rating"
							value="2" id="rate4"><label for="rate4">⭐</label> <input
							type="radio" name="review_rating" value="1" id="rate5"><label
							for="rate5">⭐</label>
					</fieldset>
				</div>
				<div class="">
					<textarea class="form-control d-inline" style="width:80%"
						name="review_comment" id="review_comment" placeholder="후기를 남겨주세요!"></textarea>
					<button id="submitBtn" type="button"
						class="btn btn-primary align-self-center" style="margin-bottom:50px">제출</button>
					<input value="${loginSession.user_id }" name="user_id"
						class="d-none"> <input
						value="${loginSession.user_category }" name="user_category"
						class="d-none"> <input
						value="${loginSession.user_nickname}" name="review_nickname"
						class="d-none">
					<c:choose>
						<c:when test="${empty loginSession.user_profile }">
							<input value="" name="review_profile" class="d-none">
						</c:when>
						<c:otherwise>
							<input value="${loginSession.user_profile }"
								name="review_profile" class="d-none">
						</c:otherwise>
					</c:choose>
					<input value="${dto.reviewed_id }" name="reviewed_id"
						class="d-none">

				</div>

			</form>
		</c:if>
	</div>
	<script>
		$("#reviewBox").on(
				"click",
				".modify-review",
				function(e) {
					console.log(e.target);
					console.log($(e.target).parent().parent().parent())
					$(e.target).parent().parent().parent("#modify_box")
							.addClass('d-none'); // 수정삭제 버튼 감추기
					$(e.target).parent().parent().parent().prev("#divWrite")
							.removeClass('d-none'); // 취소완료 버튼 보이기
					// 댓글 수정가능하게끔 readonly 속성 풀어주기 
					$(e.target).parent().parent().parent().parent().prev()
							.children("textarea").attr("readonly", false);
					// textarea 포커스
					$(e.target).parent().parent().parent().parent().prev()
							.children("textarea").focus();
				});
		// 수정 버튼 눌렀을때 모
		$(".body-review").on(
				"click",
				".btnSave",
				function(e) {
					let seq_review = $(e.target).val();
					console.log("seq_review :", seq_review)
					let comment_content = $(e.target).parent().parent().prev()
							.children("textarea").val();
					console.log("comment_content: ", comment_content);
					let seq_post = "${dto.seq_post}";
					if (comment_content === "") {
						alert("리뷰를 입력해 주세요!");
						return;
					}
					$.ajax({
						url : "/modifyProc.co",
						type : "post",
						data : {
							seq_comment : seq_review,
							comment_content : comment_content,
							seq_post : seq_post
						},
						success : function(rs) {
							console.log(rs);
							if (rs === "fail") {
								alert("댓글 수정에 실패했습니다.");
							} else {
								alert("댓글 수정에 성공!");
								refreshMemList();
							}
						},
						error : function(e) {
							console.log(e);
						}
					})
				});

		//댓글 삭제
		$(".body-review").on("click", ".delete-review", function(e) {
			//let movieCd = "${movie.movieCd}";
			//let movieCd = "${review.movieCd}";
			//console.log("movieCd:", movieCd);
			let seq_review = $(e.target).val();
			console.log("seq_review :", seq_review)
			let seq_post = "${dto.seq_post}";
			$.ajax({
				url : "/deleteProc.co",
				type : "post",
				data : {
					seq_comment : seq_review,
					seq_post : seq_post
				},
				success : function(rs) {
					console.log(rs);

					alert("댓글 삭제 성공!");
					refreshMemList();

				},
				error : function(e) {
					console.log(e);
				}
			})
		});

		$("#submitBtn").on("click", function() {

			let star1 = ("#rate1");
			let star2 = ("#rate2");
			let star3 = ("#rate3");
			let star4 = ("#rate4");
			let star5 = ("#rate5");
			let review_comment = ("#review_comment");

			console.log(star1);

			var data = $("#myform").serialize();
			$.ajax({
				url : "/review/review_write",
				type : "post",
				data : data,
				success : function(data) {
					console.log(data);
					location.reload();
				},
				error : function(e) {
					console.log(e);
				}

			})

			location.reload();
		})
	</script>
</body>
</html>