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

.review_comment {
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

.middle_Btn {
	background-color: rgb(255, 177, 88);
	border: 2px solid rgb(137, 111, 58);
	border-radius: 6px;
	height: 32px;
	font-size: small;
	box-shadow: 2px 2px 2px rgba(158, 136, 93, 0.712);
}

.middle_Btn:hover {
	color: white;
}

.middle_Btn:active {
	margin-right: -3px;
	/* margin-top: 3px; */
	box-shadow: none;
}

.modal-content {
	height: 250px;
	border-radius: 12px;
	padding: 20px;
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
	<div class="container text-center" id="reviewBox">
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
								<c:if test="${empty dto.review_rating }">
                                            <span class="starC">⭐⭐⭐⭐⭐</span>
									</c:if>
									<c:if test="${dto.review_rating eq '0' }">
                                            <span class="starC">⭐⭐⭐⭐⭐</span>
									</c:if>
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
									<textarea style="resize: none;"
										class="form-control overflow-auto review_comment"
										name="review_comment" placeholder="댓글내용" readonly> ${dto.review_comment}</textarea>
								</div>
								<div class="col-4">
									<c:if test="${loginSession.user_id eq dto.user_id }">

										<!-- 수정,삭제버튼 -->
										<div class="d-none d-inline " id="divWrite">
											<button type=submit
												class="btn btn-primary mt-2 btnSave complete-reply "
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
												<li><button type="button"
														class="dropdown-item modify-post_comment modify-review"
														value="${dto.review_seq}">수정</button></li>
												<li><button type="button"
														class="dropdown-item delete-post_comment delete-review"
														value="${dto.review_seq}">삭제</button></li>
											</ul>
										</div>
									</c:if>

									<div class="d-inline report-box">
										<c:if test="${loginSession.user_id ne dto.user_id }">
											<button type="button" class="btn" value="${dto.review_seq }"
												data-bs-toggle="modal" data-bs-target="#exampleModa3">
												<img src="/resources/images/review/report.png"
													class="reportImg">
											</button>

											<div id="modal_delete">
												<div class="modal fade" id="exampleModa3"
													aria-labelledby="exampleModalLabel" aria-hidden="true">
													<div class="modal-dialog modal-dialog-centered"
														style="width: 350px;">
														<div class="row align-items-center modal-content ">
															<div class="row align-items-center middle_bottomLine">
																<form class="m-0" id="reportForm"
																	action="/report/review_insert" method="post">
																	<div class="col d-flex justify-content-center"
																		id="modalTitle" style="width: auto;">
																		<input type="text"
																			class="form-control-plaintext fw-bolder"
																			id="report_content" name="report_content"
																			placeholder="내용을 입력하세요">
																	</div>
																	<div class="d-none">
																		<input type="text" name="user_id"
																			value="${loginSession.user_id}">
																		<%-- 신고보내는 사람 --%>
																		<input type="text" name="user_category"
																			value="${loginSession.user_category}">
																		<%-- 그사람 로그인 카테고리 --%>
																		<input type="text" name="reported_id" id="reported_id"
																			value="${dto.user_id }">
																		<%-- 신고받는 사람 --%>
																		<input type="text" name="category" value="리뷰">
																		<%-- 게시글 카테고리 --%>
																		<input type="text" name="category_seq" id="review_seq"
																			value="${dto.review_seq }">
																		<%-- 게시글 번호 --%>
																		<input type="text" name="reviewed_id" id="reviewed_id"
																			value="${reviewed_id }">
																	</div>
																</form>
															</div>

															<div class="col d-flex justify-content-center pt-5"
																id="modalBtn">
																<button type="button" class="middle_Btn"
																	id="post_reportBtn">신고하기</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
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
										href="/review/review?reviewed_id=${reviewed_id }&&curPage=${naviMap.startNavi-1}">Previous</a></li>
								</c:if>
								<c:forEach var="pageNum" begin="${naviMap.startNavi }"
									end="${naviMap.endNavi }" step="1">
									<li class="page-item"><a class="page-link"
										href="/review/review?reviewed_id=${reviewed_id }&&curPage=${pageNum}">${ pageNum}</a></li>
								</c:forEach>
								<c:if test="${naviMap.needNext eq true }">
									<li class="page-item"><a class="page-link"
										href="/review/review?reviewed_id=${reviewed_id }&&curPage=${naviMap.endNavi+1}">Next</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container text-center">
		<c:if test="${loginSession.user_id ne reviewed_id}">
			<form action="/review/review_write" class="mb-3" name="myform"
				id="myform" method="post">
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
					<textarea class="form-control d-inline" style="width: 80%"
						name="review_comment" id="review_comment" placeholder="후기를 남겨주세요!"></textarea>
					<button id="submitBtn" type="button"
						class="btn btn-primary align-self-center"
						style="margin-bottom: 50px">등록</button>
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
					<input value="${reviewed_id }" name="reviewed_id" class="d-none">

				</div>

			</form>
		</c:if>
	</div>
	<script>
		$(".review_comment").css("background-color", "white");
		//신고
		$("#post_reportBtn").on("click", function() {
			$("#reportForm").submit();

		})

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
		$("#reviewBox").on(
				"click",
				".btnSave",
				function(e) {
					let review_seq = $(e.target).val();
					console.log("review_seq :", review_seq);
					let review_comment = $(e.target).parent().parent().prev()
							.children("textarea").val();
					console.log("review_comment: ", review_comment);
					let seq_post = "${dto.seq_post}";
					if (review_comment === "") {
						alert("리뷰를 입력해 주세요!");
						return;
					}
					$.ajax({
						url : "/review/review_modify",
						type : "post",
						data : {
							review_seq : review_seq,
							review_comment : review_comment,

						},
						success : function(rs) {
							console.log(rs);
							if (rs === "fail") {
								alert("댓글 수정에 실패했습니다.");

							} else {
								alert("댓글 수정에 성공!");
								location.reload();
							}
						},
						error : function(e) {
							console.log(e);
						}
					})
				});

		//댓글 삭제
		$("#reviewBox").on("click", ".delete-review", function(e) {
			//let movieCd = "${movie.movieCd}";
			//let movieCd = "${review.movieCd}";
			//console.log("movieCd:", movieCd);
			let review_seq = $(e.target).val();
			console.log("review_seq :", review_seq)
			$.ajax({
				url : "/review/review_delete",
				type : "post",
				data : {
					review_seq : review_seq
				},
				success : function(rs) {
					console.log(rs);

					alert("댓글 삭제 성공!");
					location.reload();

				},
				error : function(e) {
					console.log(e);
				}
			})
		});

		$("#submitBtn").on("click", function() {

			let star1 = $("#rate1").val();
			let star2 = $("#rate2").val();
			let star3 = $("#rate3").val();
			let star4 = $("#rate4").val();
			let star5 = $("#rate5").val();
			console.log(star1,star2,star3,star4,star5);
			let review_comment = $("#review_comment").val();
			console.log(review_comment);
			if (review_comment == "") {
				alert("댓글을 입력해 주세요!");
				return;
			} else {
				$("#myform").submit();
				alert("댓글등록 성공!");
			}

		})
	</script>
</body>
</html>