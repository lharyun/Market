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
<title>싸다구 장터 : 내 정보 수정</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/resources/images/header_pooter/pepoel.png">
	
<link href="/resources/css/header_footer.css" rel="stylesheet">
</head>
<style>

/* manager스타일 */
.tab-content {
	border: 1px solid #f47d39;
	border-radius: 3px;
	min-height: 500px;
	padding: 20px;
}

.Cheader {
	text-align: center;
	margin-bottom: 20px;
}

#searchInput {
	display: inline-block;
}

.Cbody>div>.row {
	padding: 10px;
	border-top: 1px solid #f57e76;
}

.Cbody>div {
	min-height: 450px;
}

.Cbody>div>.row>div {
	text-align: center;
}

.Cheader>.row {
	padding: 5px;
}
/* manager끝 */
header {
	position: sticky;
	top: 0;
	display: block;
	background-color: white;
	z-index: 1;
}


/* ===contetnt 영역==== */
.mypageContainer {
	width: 1250px;
	height: 850px;
}
/* 프로필 */
.profileBox {
	width: 25%;
	height: 450px;
	float: left;
	text-align: center;
}

.profile_border {
	width: 180px;
	height: 180px;
	border-radius: 50%;
	overflow: hidden;
	display: inline-block;
	margin-top: 40px;
}
/* 프로필 사진 */
#profile_image {
	width: 100%;
	height: 100%;
}
/* 닉네임 */
.profileNickname {
	text-align: center;
	margin-top: 10px;
}
/* 내 정보(등록 상품, 거래후기) */
.profileInfo {
	width: 60%;
	margin-top: 15px;
	display: inline-block;
}

.productInfo {
	width: 38%;
	text-align: left;
	float: left;
}

.productCount {
	width: 55%;
	text-align: right;
	float: right;
}

.profileInfo2 {
	width: 60%;
	display: inline-block;
}

.productInfo2 {
	width: 38%;
	text-align: left;
	float: left;
}

.productCount2 {
	width: 55%;
	text-align: right;
	float: right;
}
/* 수정 버튼 */
.modifyBox {
	width: 70%;
	height: 70px;
	display: inline-block;
	margin-top: 15px;
}
/* 카테고리 */
.categoryBox {
	float: left;
	margin-top: 20px;
}

.categoryBox a {
	text-decoration: none;
	color: black;
	font-size: large;
	margin-left: 5px;
}

.categoryBox a:hover {
	text-decoration: underline;
}
/* 컨텐츠 영역 */
.content {
	width: 75%;
	height: 90%;
	float: right;
	margin-top: 10px;
}
/* 전체 글 개수 */
.totalCount {
	margin: 5px;
}
/* 카테고리 나타내는 글 */
.categoryText {
	margin-top: 10px;
}
/* 카테고리 해당 물품 */
.mypost {
	width: 100%;
	height: 90%;
}
/* 물품 나타내는 박스 */
.postpriceBox {
	width: 22%;
	height: 31%;
	margin: 10px;
	float: left;
	margin-top: 40px;
}

.postpriceBox :hover {
	cursor: pointer;
}

#postimage {
	width: 100%;
	height: 100%;
}

.posttitle {
	text-align: left;
}
/* 물품 박스 줄1 */
.mypost1st {
	width: 100%;
	float: left;
}
/* 물품 박스 줄2 */
.mypost2nd {
	width: 100%;
	float: left;
}
/* 물품 박스 푸터 */
.mypostfooter {
	width: 100%;
	float: left;
	margin-top: 50px;
}
/* 물품 박스 페이징 처리할 곳 */
.mypostpaging {
	text-align: center;
}

/* 반응형 웹페이지 800px 이하일때 반응 */
@media ( max-width : 992px) {
	.mypageContainer {
		width: 100%;
		height: 850px;
	}
	/* 프로필 */
	.profileBox {
		width: 100%;
		height: 450px;
		float: left;
		text-align: center;
	}
	.profile_border {
		width: 180px;
		height: 180px;
		border-radius: 50%;
		overflow: hidden;
		display: inline-block;
		margin-top: 40px;
	}
	/* 프로필 사진 */
	#profile_image {
		width: 100%;
		height: 100%;
	}
	/* 닉네임 */
	.profileNickname {
		text-align: center;
		margin-top: 10px;
	}
	/* 내 정보(등록 상품, 거래후기) */
	.profileInfo {
		width: 60%;
		margin-top: 15px;
		display: inline-block;
	}
	.productInfo {
		width: 38%;
		text-align: left;
		float: left;
	}
	.productCount {
		width: 55%;
		text-align: right;
		float: right;
	}
	.profileInfo2 {
		width: 60%;
		display: inline-block;
	}
	.productInfo2 {
		width: 38%;
		text-align: left;
		float: left;
	}
	.productCount2 {
		width: 55%;
		text-align: right;
		float: right;
	}
	/* 수정 버튼 */
	.modifyBox {
		width: 70%;
		height: 70px;
		display: inline-block;
		margin-top: 15px;
	}
	/* 카테고리 */
	.categoryBox {
		float: left;
		margin-top: 10px;
	}
	.categoryBox a {
		text-decoration: none;
		color: black;
		font-size: large;
		margin-left: 5px;
	}
	.categoryBox a:hover {
		text-decoration: underline;
	}
	/* 컨텐츠 영역 */
	.content {
		width: 100%;
		height: 75%;
		float: right;
		margin-top: 10px;
	}
	/* 전체 글 개수 */
	.totalCount {
		margin: 5px;
	}
	/* 카테고리 나타내는 글 */
	.categoryText {
		margin-top: 10px;
	}
	/* 카테고리 해당 물품 */
	.mypost {
		width: 100%;
		height: 80%;
	}
	/* 물품 나타내는 박스 */
	.postpriceBox {
		width: 45%;
		height: 31%;
		margin: 10px;
		float: left;
		margin-top: 40px;
	}
	.postpriceBox :hover {
		cursor: pointer;
	}
	#postimage {
		width: 100%;
		height: 100%;
	}
	.posttitle {
		text-align: left;
	}
	/* 물품 박스 줄1 */
	.mypost1st {
		width: 100%;
		float: left;
	}
	/* 물품 박스 줄2 */
	.mypost2nd {
		width: 100%;
		float: left;
	}
	/* 물품 박스 푸터 */
	.mypostfooter {
		width: 100%;
		float: left;
		margin-top: 50px;
	}
	/* 물품 박스 페이징 처리할 곳 */
	.mypostpaging {
		text-align: center;
	}
}


</style>

<body>
	<!-- Header -->
	<header>

		<div class="container-fluid p-0" id="Non-reaction">
			<nav>
				<div class="row align-items-center heder_top">
					<div class="col ps-4 a_reaction">
						<ul class="nav">
							<li class="nav-item bookmark"><a class="nav-link" href="#">
									<img
									src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTE2LjUtMTYuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0U5QjQ1NyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNOCAwbDIuNSA0LjkzNCA1LjUuNzktNCAzLjg0OC45IDUuNDI4TDggMTIuNDM0IDMuMSAxNSA0IDkuNTcyIDAgNS43MjRsNS41LS43OXoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
									alt="즐겨찾기이미지"> 즐겨찾기
							</a></li>
						</ul>
					</div>
					<div class="col d-flex justify-content-end">
						<ul class="nav">
							<!-- 로그인 안했을경우-->
							<c:if test="${empty loginSession}">
								<li class="nav-item"><a class="nav-link"
									href="/member/toLogin">로그인/회원가입</a></li>
							</c:if>

							<!-- 로그인했을경우-->
							<c:if test="${not empty loginSession}">
								<li class="nav-item"><a class="nav-link"
									href="/member/toLogout">로그아웃</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="/mypage/toMyStore"
									data-bs-toggle="dropdown" aria-expanded="false">내 상점</a>
									<ul class="dropdown-menu">
										<li><a class="dropdown-item" href="/mypage/toMyStore">내
												상품</a></li>
										<li><a class="dropdown-item" href="/mypage/toBasket">찜한
												상품</a></li>
										<li><a class="dropdown-item"
											href="/mypage/toMypageModify">계정 설정</a></li>
									</ul></li>
							</c:if>

							<li class="nav-item"><a class="nav-link"
								href="/mypage/toMyStore">내 상점</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- 검색창 및 로고쪽 -->

			<div class="row align-items-center m-0 heder_middleBox">
				<!-- 비반응 -->
				<div>
					<div class="row p-0 heder_middle" id="Non_reaction">
						<div class="col-3 pe-0">
							<a href="/post/toPost" class="mb-2 mb-lg-0"> <img
								src="/resources/images/header_pooter/로고.png" height="40px"
								alt="로고이미지">
							</a>
						</div>
						<div class="col position-relative p-0">

							<form id="SearchForm" action="/post/toSearch" method="post">
								<a href="#" class="nav-link p-0 d-inline" id="searchIcon"><img
									src="/resources/images/header_pooter/searchIcon.png"
									class="searchIcon" height="22px"></a> <input type="text"
									class="searchInput ps-2" id="titleSearch" name="post_title"
									placeholder="물품, 동네이름을 입력해보세요.">
							</form>

						</div>
						<div class="col d-flex justify-content-end ps-0">
							<ul class="nav menu_right">
								<li class="nav-item"><a class="nav-link"
									href="/post/toPostWrite"> <img
										src="/resources/images/header_pooter/cash.png" height="20px">
										판매하기
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/mypage/toMyStore"> <img
										src="/resources/images/header_pooter/my.png" height="20px">
										내상점
								</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/chatting/toChatting"> <img
										src="/resources/images/header_pooter/talk2.png" height="24px">
										싸다톡
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 네비바 및 select 쪽 -->
				<!-- 비반응 -->
				<div class="row align-items-center heder_bottom" id="Non_reaction">
					<div class="col p-0 dropdown">
						<a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown"
							aria-expanded="false"> <img
							src="/resources/images/header_pooter/navibar.png" height="35px">
							싸다구 카테고리 >
						</a>
						<div class="dropdown-menu mt-4 py-4" id="checkBox">
							<div class="container " id="">
								<div class="row category_line">
									<div class="col">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=남성의류"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/boy.png" height="26px"
													width="26px"> 남성의류
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=여성의류"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/girl.png"
													height="26px" width="26px"> 여성의류
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=신발,가방"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/Shoes.png"
													height="26px" width="26px"> 신발,가방
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=뷰티"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/beauty.png"
													height="26px" width="26px"> 뷰티
											</a></li>
										</ul>
									</div>

									<div class="col">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=컴퓨터,주변기기"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/computer.png"
													height="26px" width="26px"> 컴퓨터, 주변기기
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=카메라"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/camera.png"
													height="26px" width="26px"> 카메라
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=디지털,가전"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/machine.png"
													height="26px" width="26px"> 디지털,가전
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=음향기기"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/headset.png"
													height="26px" width="26px"> 음향기기
											</a></li>
										</ul>
									</div>

									<div class="col">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=생활용품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/toiletries.png"
													height="26px" width="26px"> 생활용품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=예술/희귀/수집품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/museum.png"
													height="26px" width="26px"> 예술/희귀/수집품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=식품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/food.png"
													height="26px" width="26px"> 식품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=가구/인테리어"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/furniture.png"
													height="26px" width="26px"> 가구/인테리어
											</a></li>
										</ul>
									</div>

									<div class="col">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=스포츠,레저"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/sport.png"
													height="26px" width="26px"> 스포츠,레저
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=게임"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/game.png"
													height="26px" width="26px"> 게임
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=도서"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/book.png"
													height="26px" width="26px"> 도서
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=여행,숙박"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/travel.png"
													height="26px" width="26px"> 여행,숙박
											</a></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>

					<div
						class="row col-6 align-items-center justify-content-end AddrBox">
						<!-- 지역구 -->
						<div class="col-5 p-0 ">
							<!--  동 같은경우 disabled 줘서 구 선택하면 그거에 맞게 뜨게-->
							<select class="form-select district" id="district"
								aria-label="Default select example" name="roadAddr">
								<option selected>지역을 선택하세요</option>
								<option value="강남구">강남구</option>
								<option value="강동구">강동구</option>
								<option value="강서구">강서구</option>
								<option value="강북구">강북구</option>
								<option value="관악구">관악구</option>
								<option value="광진구">광진구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="노원구">노원구</option>
								<option value="동대문구">동대문구</option>
								<option value="동작구">동작구</option>
								<option value="마포구">마포구</option>
								<option value="서대문구">서대문구</option>
								<option value="송파구">송파구</option>
								<option value="영등포구">영등포구</option>
								<option value="용산구">용산구</option>
								<option value="은평구">은평구</option>
								<option value="종로구">종로구</option>
							</select>
						</div>


						<!-- 동 -->
						<div class="col-5 p-1" id="dong">

							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr" disabled=>
								<option selected>동네를 선택하세요</option>
								<option value="1">One</option>
							</select>

						</div>
						<!-- 강남 -->
						<div class="col-5 p-1 d-none b_dong" id="gangnam">

							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="신사">신사동</option>
								<option value="논현">논현동</option>
								<option value="압구정">압구정동</option>
								<option value="청담">청담동</option>
								<option value="삼성">삼성동</option>
								<option value="대치">대치동</option>
								<option value="역삼">역삼동</option>
								<option value="도곡">도곡동</option>
								<option value="개포">개포동</option>
								<option value="세곡">세곡동</option>
								<option value="일원">일원동</option>
								<option value="수서">수서동</option>
							</select>

						</div>
						<!-- 강동 -->
						<div class="col-5 p-1 d-none b_dong" id="gangdong">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="강일">강일동</option>
								<option value="상일">상일동</option>
								<option value="명일">명일동</option>
								<option value="고덕">고덕동</option>
								<option value="암사">암사동</option>
								<option value="천호">천호동</option>
								<option value="성내">성내동</option>
								<option value="길">길동</option>
								<option value="둔촌">둔촌동</option>
							</select>
						</div>
						<!-- 강서 -->
						<div class="col-5 p-1 d-none b_dong" id="gangseo">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="염창">염창동</option>
								<option value="등촌">등촌동</option>
								<option value="화곡">화곡동</option>
								<option value="우장산">우장산동</option>
								<option value="가양">가양동</option>
								<option value="발산">발산동</option>
								<option value="공항">공항동</option>
								<option value="방화">방화동</option>
							</select>
						</div>
						<!-- 강북 -->
						<div class="col-5 p-1 d-none b_dong" id="gangbuk">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="삼양">삼양동</option>
								<option value="미아">미아동</option>
								<option value="송중">송중동</option>
								<option value="송천">송천동</option>
								<option value="삼각산">삼각산동</option>
								<option value="번">번동</option>
								<option value="수유">수유동</option>
								<option value="우이">우이동</option>
								<option value="인수">인수동</option>
							</select>
						</div>
						<!-- 관악 -->
						<div class="col-5 p-1 d-none b_dong" id="Gwanak">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="보라매">보라매동</option>
								<option value="은천">은천동</option>
								<option value="성현">성현동</option>
								<option value="중앙">중앙동</option>
								<option value="청림">청림동</option>
								<option value="낙성대">낙성대동</option>
								<option value="신림">신림동</option>
								<option value="신사">신사동</option>
								<option value="조원">조원동</option>
							</select>
						</div>
						<!-- 광진 -->
						<div class="col-5 p-1 d-none b_dong" id="Gwangjin">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="중곡">중곡동</option>
								<option value="능">능동</option>
								<option value="구의">구의동</option>
								<option value="광장">광장동</option>
								<option value="자양">자양동</option>
								<option value="화양">화양동</option>
								<option value="군자">군자동</option>
							</select>
						</div>
						<!-- 구로 -->
						<div class="col-5 p-1 d-none b_dong" id="Guro">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="신도림">신도림동</option>
								<option value="구로">구로동</option>
								<option value="고척">고척동</option>
								<option value="개봉">개봉동</option>
								<option value="오류">오류동</option>
								<option value="가리봉">가리봉동</option>
								<option value="수궁">수궁동</option>
							</select>
						</div>
						<!-- 금천 -->
						<div class="col-5 p-1 d-none b_dong" id="Geumcheon">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="가산">가산동</option>
								<option value="독산">독산동</option>
								<option value="시흥">시흥동</option>
							</select>
						</div>
						<!-- 노원 -->
						<div class="col-5 p-1 d-none b_dong" id="Nowon">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="월계">월계동</option>
								<option value="공릉">공릉동</option>
								<option value="하계">하계동</option>
								<option value="중계">중계동</option>
								<option value="상계">상계동</option>
							</select>
						</div>
						<!-- 동작 -->
						<div class="col-5 p-1 d-none b_dong" id="Dongjak">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="노량진">노량진동</option>
								<option value="상도">상도동</option>
								<option value="흑석">흑석동</option>
								<option value="사당">사당동</option>
								<option value="대방">대방동</option>
								<option value="신대방">신대방동</option>
							</select>
						</div>
						<!-- 마포 -->
						<div class="col-5 p-1 d-none b_dong" id="Mapo">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="공덕">공덕동</option>
								<option value="아현">아현동</option>
								<option value="용강">용강동</option>
								<option value="대흥">대흥동</option>
								<option value="신수">신수동</option>
								<option value="서강">서강동</option>
								<option value="서교">서교동</option>
								<option value="합정">합정동</option>
								<option value="망원">망원동</option>
								<option value="성산">성산동</option>
								<option value="상암">상암동</option>
							</select>
						</div>
						<!-- 서대문 -->
						<div class="col-5 p-1 d-none b_dong" id="Seodaemun">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="충현">충현동</option>
								<option value="천연">천연동</option>
								<option value="신촌">신촌동</option>
								<option value="연희">연희동</option>
								<option value="남가좌">남가좌동</option>
								<option value="홍제">홍제동</option>
								<option value="북가좌">북가좌동</option>
							</select>
						</div>
						<!-- 송파 -->
						<div class="col-5 p-1 d-none b_dong" id="Songpa">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="거여">거여동</option>
								<option value="마천">마천동</option>
								<option value="오금">오금동</option>
								<option value="송파">송파동</option>
								<option value="잠실">잠실동</option>
								<option value="석촌">석촌동</option>
								<option value="방이">방이동</option>
							</select>
						</div>
						<!-- 영등포 -->
						<div class="col-5 p-1 d-none b_dong" id="Yeongdeungpo">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="영등포">영등포동</option>
								<option value="여의">여의동</option>
								<option value="당산">당산동</option>
								<option value="도림">도림동</option>
								<option value="문래">문래동</option>
								<option value="양평">양평동</option>
								<option value="신길">신길동</option>
								<option value="대림">대림동</option>
							</select>
						</div>
						<!-- 용산 -->
						<div class="col-5 p-1 d-none b_dong" id="Yongsan">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="용산">용산동</option>
								<option value="효창">효창동</option>
								<option value="용문">용문동</option>
								<option value="이촌">이촌동</option>
								<option value="이태원">이태원동</option>
								<option value="한남">한남동</option>
								<option value="보광">보광동</option>
								<option value="서빙고">서빙고동</option>
							</select>
						</div>
						<!-- 은평 -->
						<div class="col-5 p-1 d-none b_dong" id="Eunpyeong">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="녹번">녹번동</option>
								<option value="불광">불광동</option>
								<option value="갈현">갈현동</option>
								<option value="구산">구산동</option>
								<option value="대조">대조동</option>
								<option value="응앙">응앙동</option>
								<option value="역촌">역촌동</option>
								<option value="수색">수색동</option>
							</select>
						</div>
						<!-- 종로 -->
						<div class="col-5 p-1 d-none b_dong" id="Jongno">
							<select class="form-select a_dong"
								aria-label="Default select example" name="extraAddr">
								<option selected>동네를 선택하세요</option>
								<option value="사직">사직동</option>
								<option value="부암">부암동</option>
								<option value="평창">평창동</option>
								<option value="교남">교남동</option>
								<option value="가회">가회동</option>
								<option value="이화">이화동</option>
								<option value="혜화">혜화동</option>
								<option value="창신">창신동</option>
							</select>
						</div>

						<!-- 값 보내줄 input -->
						<form id="districeForm" class="d-none" action="/toDistrict"
							method="post">
							<input type="text" id="roadAddrInput" name="roadAddr"> <input
								type="text" id="extraAddrInput" name="extraAddr">
						</form>

					</div>
				</div>

				<!-- 반응 -->
				<div class="row align-items-center heder_bottom" id="reaction">
					<div class="col p-0 dropdown">
						<a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown"
							aria-expanded="false"> <img
							src="/resources/images/header_pooter/navibar.png" height="35px"><img
							class="a_reaction" src="/resources/images/header_pooter/로고.png"
							height="40px" alt="로고이미지">
						</a>
						<div class="dropdown-menu mt-4 py-4" id="checkBox">
							<div class="container" id="">

								<div class="row category_line">

									<div class="col">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2 font_a"><a
												href="/post/toPostWrite" class="nav-link p-0"> <img
													src="/resources/images/header_pooter/cash.png"
													height="20px"> 판매하기
											</a></li>
											<li class="nav-item mb-2 font_a"><a
												href="/mypage/toMyStore" class="nav-link p-0"> <img
													src="/resources/images/header_pooter/talk2.png"
													height="24px"> 싸다톡
											</a></li>

											<li class="nav-item mb-2"><a href="#"
												class="nav-link p-0"> <!-- 빈값 -->
											</a></li>


											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=남성의류"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/boy.png" height="26px"
													width="26px"> 남성의류
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=여성의류"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/girl.png"
													height="26px" width="26px"> 여성의류
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=신발,가방"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/Shoes.png"
													height="26px" width="26px"> 신발,가방
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=뷰티"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/beauty.png"
													height="26px" width="26px"> 뷰티
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=컴퓨터,주변기기"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/computer.png"
													height="26px" width="26px"> 컴퓨터, 주변기기
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=카메라"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/camera.png"
													height="26px" width="26px"> 카메라
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=디지털,가전"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/machine.png"
													height="26px" width="26px"> 디지털,가전
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=음향기기"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/headset.png"
													height="26px" width="26px"> 음향기기
											</a></li>
										</ul>
									</div>

									<div class="col ps-3">
										<ul class="nav flex-column pt-2 ps-3">
											<li class="nav-item mb-2 font_a"><a
												href="/mypage/toMyStore" class="nav-link p-0"> <img
													src="/resources/images/header_pooter/my.png" height="20px">
													내상점
											</a></li>
											<li class="nav-item mb-2"><a href="#"
												class="nav-link p-0"> <!-- 빈값 -->
											</a></li>
											<li class="nav-item mb-2"><a href="#"
												class="nav-link p-0"> <!-- 빈값 -->
											</a></li>

											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=생활용품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/toiletries.png"
													height="26px" width="26px"> 생활용품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=예술/희귀/수집품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/museum.png"
													height="26px" width="26px"> 예술/희귀/수집품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=식품"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/food.png"
													height="26px" width="26px"> 식품
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=가구/인테리어"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/furniture.png"
													height="26px" width="26px"> 가구/인테리어
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=스포츠,레저"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/sport.png"
													height="26px" width="26px"> 스포츠,레저
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=게임"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/game.png"
													height="26px" width="26px"> 게임
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=도서"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/book.png"
													height="26px" width="26px"> 도서
											</a></li>
											<li class="nav-item mb-2"><a
												href="/post/select?curPage=1$category=여행,숙박"
												class="nav-link p-0"> <img
													src="/resources/images/header_pooter/travel.png"
													height="26px" width="26px"> 여행,숙박
											</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-5 position-relative p-0" id="searchBox">
						<form id="SearchForm2" action="/post/toSearch" method="post">
							<a href="#" class="nav-link p-0 d-inline" id="searchIcon2"><img
								src="/resources/images/header_pooter/searchIcon.png"
								class="searchIcon" height="22px"></a> <input type="text"
								class="searchInput ps-2" id="titleSearch2" name="post_title"
								placeholder="물품, 동네이름을 입력해보세요.">
						</form>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Contents -->
	<div class="container middle" >
		<div class="mypageContainer">
			<div class="profileBox">
				<div class="profile_border">
					<img src="/resources/images/mypage/default_profileimage.jpg"
						id="profile_image">
				</div>
				<div class="profileNickname">
					<strong>닉네임 값</strong>
				</div>
				<div class="profileInfo">
					<div class="productInfo">
						<span><strong>상품</strong></span>
					</div>
					<div class="productCount">
						<span><strong>0</strong></span>
					</div>
				</div>
				<div class="profileInfo2">
					<div class="productInfo2">
						<span><strong>거래후기</strong></span>
					</div>
					<div class="productCount2">
						<span><strong>☆☆☆☆☆&nbsp;0</strong></span>
					</div>
				</div>
				<div class="modifyBox">
					<button type="button" class="btn btn-warning" id="modifyBtn">내
						정보 수정하기</button>
				</div>
			</div>

			<div class="content">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-Member-tab"
							data-bs-toggle="tab" data-bs-target="#nav-Member" type="button"
							role="tab" aria-controls="nav-Member" aria-selected="true">Member</button>
						<button class="nav-link" id="nav-BlackList-tab"
							data-bs-toggle="tab" data-bs-target="#nav-BlackList"
							type="button" role="tab" aria-controls="nav-BlackList"
							aria-selected="false">BlackList</button>
						<button class="nav-link" id="nav-Report-tab" data-bs-toggle="tab"
							data-bs-target="#nav-Report" type="button" role="tab"
							aria-controls="nav-Report" aria-selected="false">Report</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-Member"
						role="tabpanel" aria-labelledby="nav-Member-tab">
						<!-- 1Page -->
						<div class="Cheader">
							<div class="row">
								<div class="col-7 text-start"></div>
								<div class="col-3">
									<input type="text" class="form-control" placeholder="id찾기"
										id="mSearchInput">
								</div>
								<div class="col-2">
									<button type="button" id="mSearchBtn" class="btn btn-info">찾기</button>
								</div>
							</div>
							<div class="row">
								<div class="col-1">
									<input type="checkbox" id="memberAll">선택
								</div>
								<div class="col-2">아이디</div>
								<div class="col-2">카테고리</div>
								<div class="col-2">닉네임</div>
								<div class="col-2">이름</div>
								<div class="col-2">핸드폰번호</div>
								<div class="col-1">블랙</div>

							</div>

						</div>
						<div class="Cbody">
							<!-- 멤버 -->
							<div id="memberList">
								<c:forEach items="${list }" var="dto">
									<div class="row">
										<div class="col-1">
											<input class="check" type="checkbox" onclick="setBox(this)"
												value="${dto.user_id }" />
										</div>
										<div class="col-2">${dto.user_id }</div>
										<div class="col-2">${dto.user_category }</div>
										<div class="col-2">${dto.user_nickname }</div>
										<div class="col-2">${dto.user_name }</div>
										<div class="col-2">${dto.user_phone }</div>
										<div class="col-1">${dto.blackList_check }</div>


									</div>
								</c:forEach>
							</div>
						</div>

						<div class="cfooter">
							<div class="row">
								<div class="col">
								<div id="pagination">
									<nav class="pagination justify-content-center">
										<ul class="pagination">
											<c:if test="${naviMap.needPrev eq true }">
												<li class="page-item"><a class="page-link"
													href="/member/toManager?curPage=${naviMap.startNavi-1}">Previous</a></li>
											</c:if>
											<c:forEach var="pageNum" begin="${naviMap.startNavi }"
												end="${naviMap.endNavi }" step="1">
												<li class="page-item"><button
														class="page-link memberPage " value="${ pageNum}">${ pageNum}</button></li>
											</c:forEach>
											<c:if test="${naviMap.needNext eq true }">
												<li class="page-item"><a class="page-link"
													href="/member/toManager?curPage=${naviMap.endNavi+1}">Next</a></li>
											</c:if>
										</ul>
									</nav>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col text-end">

									<button class="btn btn-danger" id="deleteBtn">삭제</button>
									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#exampleModal"
										data-bs-whatever="@mdo">블랙리스트</button>
								</div>
							</div>
						</div>





					</div>
					<div class="tab-pane fade" id="nav-BlackList" role="tabpanel"
						aria-labelledby="nav-BlackList-tab">
						<div class="Cheader">
							<div class="row">
								<div class="col-auto text-end">
									<input type="text" class="form-control" placeholder="id찾기"
										id="bSearchInput">
								</div>
								<div class="col-auto text-end">
									<button type="button" id="bSearchBtn" class="btn btn-info">찾기</button>
								</div>
							</div>
							<div class="row">
								<div class="col-1">
									<input type="checkbox" id="blackAll">선택
								</div>
								<div class="col-2">날짜</div>
								<div class="col-5">사유</div>
								<div class="col-2">아이디</div>
								<div class="col-2">카테고리</div>

							</div>
						</div>

						<div class="Cbody">
							<!-- 블랙리스트 -->
							<div id="blackList">
								<c:forEach items="${blackList }" var="dto">
									<div class="row">
										<div class="col-1">
											<input type="checkbox" class="bCheck" value="${dto.user_id }"
												onclick="setBox(this)">
										</div>
										<div class="col-2">${dto.blackList_date }</div>
										<div class="col-5">${dto.blackList_content }</div>
										<div class="col-2">${dto.user_id }</div>
										<div class="col-2">${dto.user_category }</div>
									</div>

								</c:forEach>
							</div>
						</div>
						<div class="cfooter">
							<div class="row">
								<div class="col">
									<div id="bPagination">
										<nav class="pagination justify-content-center">
											<ul class="pagination">
												<c:if test="${blackNaviMap.needPrev eq true }">
													<li class="page-item"><a class="page-link"
														href="/member/toManager?curPage=${blackNaviMap.startNavi-1}">Previous</a></li>
												</c:if>
												<c:forEach var="pageNum" begin="${naviMap.startNavi }"
													end="${blackNaviMap.endNavi }" step="1">
													<li class="page-item"><button
															class="page-link blackPage" value="${ pageNum}">${ pageNum}</button></li>
												</c:forEach>
												<c:if test="${blackNaviMap.needNext eq true }">
													<li class="page-item"><a class="page-link"
														href="/member/toManager?curPage=${blackNaviMap.endNavi+1}">Next</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col text-end">
									<button class="btn btn-danger" id="unBlackBtn">블랙리스트
										해제</button>
								</div>
							</div>
						</div>

					</div>

					<!-- 2Page -->
					<div class="tab-pane fade" id="nav-Report" role="tabpanel"
						aria-labelledby="nav-Report-tab">
						<div class="Cheader">
							<div class="row">
								<div class="col-auto text-end">
									<input type="text" class="form-control" placeholder="id찾기"
										id="rSearchInput">
								</div>
								<div class="col-auto text-end">
									<button type="button" id="rSearchBtn" class="btn btn-info">찾기</button>
								</div>
							</div>
							<div class="row">
								<div class="col-1">
									<input type="checkbox" id="reportAll">선택
								</div>
								<div class="col-5">신고내역</div>
								<div class="col-2">신고 받은 아이디</div>
								<div class="col-2">신고한 아이디</div>

								<div class="col-2">카테고리</div>

							</div>
						</div>

						<div class="Cbody">
							<div id="reportList">
								<c:forEach items="${reportList }" var="dto">
									<!-- 신고 -->
									<div class="row">
										<div class="col-1">
											<input type="checkbox" class="rCheck"
												value="${dto.report_seq }" onclick="setBox(this)">
										</div>
										<div class="col-5">${dto.report_content }</div>
										<div class="col-2">${dto.reported_id }</div>
										<div class="col-2">${dto.user_id }</div>
										<div class="col-2">${dto.user_category }</div>

									</div>
								</c:forEach>
							</div>
						</div>
						<div class="cfooter">
							<div class="row">
								<div class="col">
									<div id="rPagination">
										<nav class="pagination justify-content-center">
											<ul class="pagination">
												<c:if test="${reportNaviMap.needPrev eq true }">
													<li class="page-item"><a class="page-link"
														href="/member/toManager?curPage=${reportNaviMap.startNavi-1}">Previous</a></li>
												</c:if>
												<c:forEach var="pageNum" begin="${naviMap.startNavi }"
													end="${reportNaviMap.endNavi }" step="1">
													<li class="page-item"><button
															class="page-link reportPage" value="${ pageNum}">${ pageNum}</button></li>
												</c:forEach>
												<c:if test="${reportNaviMap.needNext eq true }">
													<li class="page-item"><a class="page-link"
														href="/member/toManager?curPage=${reportNaviMap.endNavi+1}">Next</a></li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col text-end">
									<button class="btn btn-danger" id="reportBtn">신고내역 삭제</button>
								</div>
							</div>
						</div>

					</div>
					<!-- 3Page -->
				</div>
			</div>

			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">New message</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">Reason:</label>
									<textarea class="form-control" id="blackList_content"
										placeholder="이유를 적어주세요!"></textarea>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">Close</button>
							<button type="button" id="sendBtn" class="btn btn-primary">Send
								message</button>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>


	<!-- footer -->
	<div class="logo2">
		<a class="nav-link" href="/client/toClient_post?curPage=1"> <img
			src="/resources/images/header_pooter/고객게시판.png">
		</a>
	</div>
	<footer class="py-4 text-light">
		<div class="container" id="footerBox">
			<div class="row pooterLine pb-3">
				<div class="col">
					<ul class="nav flex-column">
						<li class="nav-item mb-2 a_reaction"><a href="/post/toPost?curPage=1"
							class="nav-link p-0"> <img
								src="/resources/images/header_pooter/로고white.png" height="46px"
								alt="로고">
						</a></li>

					</ul>
				</div>
				<div class="col">
					<ul class="nav flex-column pt-3">
						<li class="nav-item mb-2"><a href="/footer/toTrust"
							class="nav-link p-0">믿을수 있는 중고거래</a></li>
						<li class="nav-item mb-2"><a href="/client/toClient_post?curPage=1"
							class="nav-link p-0">자주 묻는 질문</a></li>
					</ul>
				</div>
				<div class="col">
					<ul class="nav flex-column pt-3">
						<li class="nav-item mb-2"><a href="/footer/toCheapPay"
							class="nav-link p-0">싸다구페이</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0">동네가게</a></li>
					</ul>
				</div>
				<div class="col">
					<ul class="nav flex-column pt-3">
						<li class="nav-item mb-2"><a href="/footer/toTeam"
							class="nav-link p-0">회사소개</a></li>
						<li class="nav-item mb-2"><a href="#" class="nav-link p-0">채용</a></li>
					</ul>
				</div>
				<div class="col">
					<ul class="nav flex-column pt-3">
						<li class="nav-item mb-2"><a href="/footer/toTerms"
							class="nav-link p-0">이용약관</a></li>
						<li class="nav-item mb-2"><a href="/footer/toPrivacy"
							class="nav-link p-0">개인정보처리방침</a></li>
						<li class="nav-item mb-2"><a href="/footer/toLocation"
							class="nav-link p-0">위치기반서비스 이용약관</a></li>
						<li class="nav-item mb-2"><a href="/footer/toPlanned"
							class="nav-link p-0">이용자보호 비전과 계획</a></li>
					</ul>
				</div>
			</div>

			<div class="row pooterText">
				<div class="mt-4">
					고객문의 <a href="#" class="nav-link p-0 d-inline">cheap@cheap.com
					</a> 제휴문의 <a href="#" class="nav-link p-0 d-inline">cheap@cheap.com
					</a>
				</div>
				<div class="">
					광고 <a href="#" class="nav-link p-0 d-inline">prr@cheap.com</a> PR문의<a
						href="#" class="nav-link p-0 d-inline">cheap@cheap.com</a> IR문의 <a
						href="#" class="nav-link p-0 d-inline">cheap@cheap.com</a>
				</div>
				<div class="mt-3">서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F
					(당산서비스) 사업자 등록번호 : 123-45-00000 직업정보제공사업 신고번호 : J1234567891234</div>
				<div class="my-3">
					<a href="https://www.facebook.com/" class="nav-link p-0 d-inline"
						target="_blank"><img class="me-2"
						src="/resources/images/header_pooter/facebook.png" width="23px"></a>
					<a href="https://www.instagram.com/" class="nav-link p-0 d-inline"
						target="_blank"><img class="me-2"
						src="/resources/images/header_pooter/instar.png" width="23px"></a>
					<a href="https://www.youtube.com/" class="nav-link p-0 d-inline"
						target="_blank"> <img class="me-3"
						src="/resources/images/header_pooter/tube.png" width="23px"></a>
					<a
						href="https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD"
						class="nav-link p-0 d-inline" target="_blank"><img
						src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-global-2f53678b428ec623cefd07a90dd7777f3e55fc0433918f645d7d75ace6ff1fc3.png"
						width="24px"> 한국</a>

				</div>
				<div class="">©cheap Market Inc.</div>

			</div>
		</div>
	</footer>


	<script>
    /* 신고 회원 찾기 */
      $("#rSearchBtn").on("click",function(){
    	let user_id=$("#rSearchInput").val();
    	if(user_id == ""){
    		location.reload();
    	}
    	$.ajax({
    		url:"/report/rSearch",
    		type:"get",
    		data:{'user_id':user_id},
    		success:function(data){
    			console.log(data);
    			$("#reportList").empty();
    			$("#rPagination").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#reportList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"rCheck",
						onclick:"setBox(this)",
						value:dto.report_seq
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-5").append(dto.report_content);
					let col3=$("<div>").addClass("col-2").append(dto.reported_id);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_id);
					let col5= $("<div>").addClass("col-2").append(dto.user_category);
					
					
					
					row.append(col1, col2,col3,col4,col5);
					row.appendTo("#reportList");
				}
				
			}
				
    			
    		},
    		error:function(e){
    			console.log(e);
    		}
    	})
    })
    
    /* 블랙 회원 찾기 */
    $("#bSearchBtn").on("click",function(){
    	let user_id=$("#bSearchInput").val();
    	if(user_id == ""){
    		location.reload();
    	}
    	$.ajax({
    		url:"/blackList/bSearch",
    		type:"get",
    		data:{'user_id':user_id},
    		success:function(data){
    			console.log(data);
    			$("#blackList").empty();
    			$("#bPagination").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#blackList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"bCheck",
						onclick:"setBox(this)",
						value:dto.user_id
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-2").append(dto.blackList_date);
					let col3=$("<div>").addClass("col-5").append(dto.blackList_content);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_id);
					let col5= $("<div>").addClass("col-2").append(dto.user_category);
					
					
					
					row.append(col1, col2,col3,col4,col5);
					row.appendTo("#blackList");
				}
				
			}
				
    			
    		},
    		error:function(e){
    			console.log(e);
    		}
    	})
    })

    /* 멤버 회원 찾기 */
    $("#mSearchBtn").on("click",function(){
    	let user_id=$("#mSearchInput").val();
    	if(user_id == ""){
    		location.reload();
    	}
    	$.ajax({
    		url:"/member/mSearch",
    		type:"get",
    		data:{'user_id':user_id},
    		success:function(data){
    			console.log(data);
    			$("#memberList").empty();
    			$("#pagination").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#memberList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"check",
						onclick:"setBox(this)",
						value:dto.user_id
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-2").append(dto.user_id);
					let col3=$("<div>").addClass("col-2").append(dto.user_category);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_nickname);
					let col5= $("<div>").addClass("col-2").append(dto.user_name);
					let col6=$("<div>").addClass("col-2").append(dto.user_phone);
					let col7=$("<div>").addClass("col-1").append(dto.blackList_check);
					
					
					row.append(col1, col2,col3,col4,col5,col6,col7);
					row.appendTo("#memberList");
				}
				
			}
				
    			
    		},
    		error:function(e){
    			console.log(e);
    		}
    	})
    })

    /* 멤버 Pagination */
	$(".memberPage").on("click", function(e) {
		let curPage=$(e.target).val();
		$.ajax({
			url:"/member/toMemberPage?curPage="+curPage,
			type:"get",
			
			success:function(data){
				$("#memberList").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#memberList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"check",
						onclick:"setBox(this)",
						value:dto.user_id
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-2").append(dto.user_id);
					let col3=$("<div>").addClass("col-2").append(dto.user_category);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_nickname);
					let col5= $("<div>").addClass("col-2").append(dto.user_name);
					let col6=$("<div>").addClass("col-2").append(dto.user_phone);
					let col7=$("<div>").addClass("col-1").append(dto.blackList_check);
					
					
					row.append(col1, col2,col3,col4,col5,col6,col7);
					row.appendTo("#memberList");
				}
				
			}
					
			},error:function(e){
				console.log(e);
			}
		});

	})
	/* 블랙 Pagination */
	$(".blackPage").on("click", function(e) {
		let curPage=$(e.target).val();
		$.ajax({
			url:"/member/toBlackPage?curPage="+curPage,
			type:"get",
			
			success:function(data){
				$("#blackList").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#blackList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"bCheck",
						onclick:"setBox(this)",
						value:dto.user_id
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-2").append(dto.blackList_date);
					let col3=$("<div>").addClass("col-5").append(dto.blackList_content);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_id);
					let col5= $("<div>").addClass("col-2").append(dto.user_category);
					
					
					
					row.append(col1, col2,col3,col4,col5);
					row.appendTo("#blackList");
				}
				
			}
					
			},error:function(e){
				console.log(e);
			}
		});
	})
/* 리포트 Pagination */
	$(".reportPage").on("click", function(e) {
		let curPage=$(e.target).val();

		$.ajax({
			url:"/member/toReportPage?curPage="+curPage,
			type:"get",
			
			success:function(data){
				$("#reportList").empty();
				if(data.length ==0){ //검색 결과 없음
					let row=$("<div>").addClass("row");
					let col= $("<div>").addClass("col").append("검색 결과가 없습니다.");
					row.append(col);
					row.appendTo("#reportList");
			}else{
				
				for(let dto of data){
					let row=$("<div>").addClass("row");
					let deleteCheckbox =$("<input>").attr({
						type:"checkbox",
						class:"rCheck",
						onclick:"setBox(this)",
						value:dto.report_seq
						
					});
					let col1=$("<div>").addClass("col-1").append(deleteCheckbox);
					let col2=$("<div>").addClass("col-5").append(dto.report_content);
					let col3=$("<div>").addClass("col-2").append(dto.reported_id);
					
					let col4= $("<div>").addClass("col-2").append(dto.user_id);
					let col5= $("<div>").addClass("col-2").append(dto.user_category);
					
					
					
					row.append(col1, col2,col3,col4,col5);
					row.appendTo("#reportList");
				}
				
			}
					
			},error:function(e){
				console.log(e);
			}
		});
	})

	/* 멤버 전체 선택 */
	$("#memberAll").on(
			"click",
			function(e) {
				if ($("#memberAll").is(":checked")) {
					$(".check").prop("checked", true);
					$(".check").parent().css("backgroundColor", "#ffafa1");
					$(".check").parent().parent().css("backgroundColor",
							"#f4ffe8");
				} else {
					$(".check").prop("checked", false);
					$(".check").parent().css("backgroundColor", "white");
					$(".check").parent().parent().css("backgroundColor",
							"#fff");
				}
			})

	/* 블랙 전체 선택 */
	$("#blackAll")
			.on(
					"click",
					function(e) {
						if ($("#blackAll").is(":checked")) {
							$(".bCheck").prop("checked", true);
							$(".bCheck").parent().css("backgroundColor",
									"#ffafa1");
							$(".bCheck").parent().parent().css(
									"backgroundColor", "#f4ffe8");
						} else {
							$(".bCheck").prop("checked", false);
							$(".bCheck").parent().css("backgroundColor",
									"white");
							$(".bCheck").parent().parent().css(
									"backgroundColor", "#fff");
						}
					})

	/* 신고 전체 선택 */
	$("#reportAll")
			.on(
					"click",
					function(e) {
						if ($("#reportAll").is(":checked")) {
							$(".rCheck").prop("checked", true);
							$(".rCheck").parent().css("backgroundColor",
									"#ffafa1");
							$(".rCheck").parent().parent().css(
									"backgroundColor", "#f4ffe8");
						} else {
							$(".rCheck").prop("checked", false);
							$(".rCheck").parent().css("backgroundColor",
									"white");
							$(".rCheck").parent().parent().css(
									"backgroundColor", "#fff");
						}
					})

	/* 체크박스 클릭시 이벤트 */
	function setBox(e) {
		td = e.parentNode;
		td.style.backgroundColor = (e.checked) ? "#ffafa1" : "white";
		tr = e.parentNode.parentNode;
		tr.style.backgroundColor = (e.checked) ? "#f4ffe8" : "#fff";
	}

	/* 블랙리스트 모달 */
	var exampleModal = document.getElementById('exampleModal')
	exampleModal.addEventListener('show.bs.modal', function(event) {//블랙리스트 버튼을 클릭했을때

		var button = event.relatedTarget
		var recipient = button.getAttribute('data-bs-whatever')
		var modalTitle = exampleModal.querySelector('.modal-title')
		var modalBodyInput = exampleModal
				.querySelector('.modal-body input')

		modalTitle.textContent = "블랙리스트"

	})
	/* 회원 블랙 전송버튼 */
	$("#sendBtn").on("click", function() {
		let checkArr = $(".check:checked");
		if (checkArr.length == 0) {
			alert("체크박스를 선택해주세요")
			return;
		}
		let arr = Array();
		for (let i = 0; i < checkArr.length; i++) {
			arr.push(checkArr[i].value);
		}
		let blackList_content = $("#blackList_content").val();
		console.log(blackList_content);
		if (confirm("해당 회원을 블랙리스트 시키겠습니까?")) {
			$.ajax({
				url : "/blackList/black",
				type : 'post',
				data : {
					"arr[]" : arr,
					"blackList_content" : blackList_content
				},
				success : function(data) {
					console.log(data);
					alert("해당 데이터가 블랙되었습니다.")
					location.reload();
				},
				error : function(e) {
					console.log(e);
				}
			});
		}

	})

	/* 회원 삭제 */
	$("#deleteBtn").on("click", function() {
		let checkArr = $(".check:checked");

		let arr = Array();

		for (let i = 0; i < checkArr.length; i++) {
			arr.push(checkArr[i].value);
		}

		if (checkArr.length == 0) {
			alert("체크박스를 선택해주세요")
			return;
		} else {
			if (confirm("해당 회원을 삭제하시겠습니까?")) {
				$.ajax({
					url : "/member/mn_delete",
					type : 'post',
					data : {
						"arr[]" : arr
					},
					success : function(data) {
						console.log(data);
						alert("해당 회원이 삭제되었습니다.")
						location.reload();
					},
					error : function(e) {
						console.log(e);
					}
				});
			}

		}

	})
	/* 블랙리스트해제 */
	$("#unBlackBtn").on("click", function() {
		let checkArr = $(".bCheck:checked");

		let arr = Array();

		for (let i = 0; i < checkArr.length; i++) {
			arr.push(checkArr[i].value);
		}

		if (checkArr.length == 0) {
			alert("체크박스를 선택해주세요")
			return;
		} else {
			if (confirm("해당 회원을 정말 삭제하시겠습니까?")) {
				$.ajax({
					url : "/blackList/unBlack",
					type : 'post',
					data : {
						"arr[]" : arr
					},
					success : function(data) {
						console.log(data);
						alert("해당 데이터가 삭제되었습니다.")
						location.reload();
					},
					error : function(e) {
						console.log(e);
					}
				});
			}

		}

	})
	/* 신고 내역 삭제 */
	$("#reportBtn").on("click", function() {
		let checkArr = $(".rCheck:checked");

		let arr = Array();

		for (let i = 0; i < checkArr.length; i++) {
			arr.push(checkArr[i].value);
		}

		if (checkArr.length == 0) {
			alert("체크박스를 선택해주세요")
			return;
		} else {
			if (confirm("해당 회원을 정말 삭제하시겠습니까?")) {
				$.ajax({
					url : "/report/delete",
					type : 'post',
					data : {
						"arr[]" : arr
					},
					success : function(data) {
						console.log(data);
						alert("해당 신고가 삭제되었습니다.")
						location.reload();
					},
					error : function(e) {
						console.log(e);
					}
				});
			}

		}

	})

    
    </script>

</body>
<script src="/resources/js/header_footer.js"></script>
</html>
