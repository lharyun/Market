<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <!-- 제이쿼리 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <title>메인페이지</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/header_pooter/pepoel.png">
    <!-- css -->
    <link href="/resources/css/header_footer.css" rel="stylesheet">
    
</head>
<style>
   body{
    background-color: rgb(237, 238, 239);
    }

    .font_gray{
    color: gray;
    font-size: small;
   }
   .font_gray_b{
    color: gray;
    font-size: small;
    vertical-align: bottom;
   }

  .modal-content {
        height: 250px;
        border-radius: 12px;
        padding: 20px;
    }
    
    
    /* 채팅쪽 */
   .chattingBox{
   margin: 0 auto;
   background-color: white;
   width: 992px;
   height: 800px;
   border: 1px solid rgb(222, 224, 225);
   border-radius: 6px;
   }
   
   .chatting_memberBox{
    float: left;
    width: 30%;
    height: 100%;
    
   }
   .chatting_member{
    height:calc(100% - 80px);
    overflow-y: scroll;
    overflow-x : hidden;
    
   }
  
   .member_textBox{
    width: 200px;
    overflow : hidden;
    white-space : nowrap;
    text-overflow:ellipsis;
   }
   .chatting_content{
    float: left;
    width: 70%;
    height: 100%;
    border-left: 1px solid rgb(222, 224, 225);
   }
    /* 윗라인  */
   .myProfile , .yourPost{
    display: flex;
    align-items:center;
    border-bottom: 1px solid rgb(222, 224, 225);
    height: 80px;
    padding: 10px;
    
   }
   #yourPost{
    cursor: pointer;
   }
   
   .myProfile img, #yourPost img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 1px solid rgb(222, 224, 225);
    cursor: pointer;
   }

   /* 왼쪽 채팅 멤버 */
   .yourProfile{
    display: flex;
    align-items:center;
    height: 80px;
    padding: 10px;
    cursor: pointer;
   }
   .yourProfile img{
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: 1px solid rgb(222, 224, 225);
   }
   .yourProfile:hover{
    background-color: #ffad0a2d;
   }
      
   /* 오른쪽 채팅 컨텐츠 */
   .messageBox{
    height:calc(100% - 80px);
    padding: 10px;
   }
   .contentDiv{
    height:calc(100% - 150px);
    overflow-y: auto;
    }
   .textDiv{
    border-radius: 10px;
    border: 2px solid rgb(192, 194, 196);
   }
   .textDiv textarea{
    padding: 10px;
    height: 100px;
    resize: none;
   }
   .textDiv>.row img{
    cursor: pointer;
   }
   
    textarea:focus {
    outline: none;
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
        
        .middle_bottomLine {
	        padding-top: 50px;
	        border-bottom: 1px solid rgba(128, 128, 128, 0.233);
    	}

        /* 이모티콘 */
        .imoticonBox{
            background-color: white;
            width: 500px;
            height: 500px;
            border: 2px solid rgb(192, 194, 196);
            overflow: hidden;
            z-index: 0;
        }
        .no_index{
            z-index: 0;
        }
        .emoticon_gabal{
        float: left;
        width: 33.33%;
        height: 33.33%;
        cursor: pointer;
        }

        .dynamicChat_l{
            text-align: left;
            margin: 10px;
        }
        .dynamicChat_r{
            text-align: right;
            margin: 10px;
        }

        .dynamicChat_l > .chat_text{
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            background-color: rgb(223, 223, 224);
            
        }
        .dynamicChat_r > .chat_text{
            display: inline-block;
            padding: 10px;
            border-radius: 4px;
            background-color: orange;
            color: rgb(245, 248, 249)
        }

        
        /* 스크롤 */
        .contentDiv::-webkit-scrollbar {
        width: 6px;
        }
        .contentDiv::-webkit-scrollbar-track {
        background-color: transparent;
        }
        .contentDiv::-webkit-scrollbar-thumb {
        border-radius: 3px;
        background-color: rgb(193, 193, 193);
        }
        .contentDiv::-webkit-scrollbar-button {
        width: 0;
        height: 0;
        }
        .chatting_member::-webkit-scrollbar {
        width: 6px;
        }
        .chatting_member::-webkit-scrollbar-track {
        background-color: transparent;
        }
        .chatting_member::-webkit-scrollbar-thumb {
        border-radius: 3px;
        background-color: rgb(193, 193, 193);
        }
        .chatting_member::-webkit-scrollbar-button {
        width: 0;
        height: 0;
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
                            <li class="nav-item bookmark">
                                <a class="nav-link" href="#">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxNiIgaGVpZ2h0PSIxNSIgdmlld0JveD0iMCAwIDE2IDE1Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggc3Ryb2tlPSIjQ0NDIiBkPSJNLTE2LjUtMTYuNWg0OXY0OWgtNDl6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0U5QjQ1NyIgZmlsbC1ydWxlPSJub256ZXJvIiBkPSJNOCAwbDIuNSA0LjkzNCA1LjUuNzktNCAzLjg0OC45IDUuNDI4TDggMTIuNDM0IDMuMSAxNSA0IDkuNTcyIDAgNS43MjRsNS41LS43OXoiLz4KICAgIDwvZz4KPC9zdmc+Cg=="
                                        alt="즐겨찾기이미지"> 즐겨찾기
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <ul class="nav">
                        	<c:choose>
								<c:when test="${empty loginSession}">
									<li class="nav-item">
                                		<a class="nav-link" id="linkLogin" href='javascript:void(0)' onclick='preventClick(event)'>로그인/회원가입</a>
                            		</li>
                            		<li class="nav-item">
		                                <a class="nav-link" href="/mypage/toMyStore">내 상점</a>
		                            </li>
								</c:when>
								<c:otherwise>
									<!-- 로그인했을경우 띄우기 -->
		                            <li class="nav-item">
		                                <a class="nav-link" href="/member/toLogout">로그아웃</a>
		                             </li>
		                            <li class="nav-item dropdown">
		                                
		                                <a class="nav-link dropdown-toggle" href="/mypage/toMyStore" data-bs-toggle="dropdown" aria-expanded="false">${loginSession.user_nickname} 상점</a>
		                                <ul class="dropdown-menu">
		                                    <li><a class="dropdown-item" href="/mypage/toMyStore">내 상품</a></li>
		                                    <li><a class="dropdown-item" href="/mypage/toBasket">찜한 상품</a></li>
		                                    <li><a class="dropdown-item" href="/mypage/toMypageModify">계정 설정</a></li>
		                                </ul>
		                            </li>
								</c:otherwise>
							</c:choose>
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
                        <a href="/post/toPost?curPage=1" class="mb-2 mb-lg-0">
                            <img src="/resources/images/header_pooter/로고.png" height="40px" alt="로고이미지">
                        </a>
                    </div>
                    <div class="col position-relative p-0">

                        <form id="SearchForm" action="/post/toSearch?curPage=1" method="post">
                            <a href="#" class="nav-link p-0 d-inline" id="searchIcon"><img src="/resources/images/header_pooter/searchIcon.png"
                                    class="searchIcon" height="22px"></a>

                            <input type="text" class="searchInput ps-2" id="titleSearch" name="search"
                                placeholder="물품, 동네이름을 입력해보세요.">
                        </form>

                    </div>
                    <div class="col d-flex justify-content-end ps-0">
                        <ul class="nav menu_right">
                            <li class="nav-item">
                                <a class="nav-link" href="/post/toPostWrite">
                                    <img src="/resources/images/header_pooter/cash.png" height="20px">
                                    판매하기</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/mypage/toMyStore">
                                    <img src="/resources/images/header_pooter/my.png" height="20px">
                                    내상점</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/chatting/toChatting">
                                    <img src="/resources/images/header_pooter/talk2.png" height="24px">
                                    싸다톡</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
                <!-- 네비바 및 select 쪽 -->
                <!-- 비반응 -->
                <div class="row align-items-center heder_bottom" id="Non_reaction">
                    <div class="col p-0 dropdown">
                        <a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/resources/images/header_pooter/navibar.png" height="35px"> 싸다구 카테고리 >
                        </a>
                        <div class="dropdown-menu mt-4 py-4" id="checkBox">
                            <div class="container " id="">
                                <div class="row category_line">
                                    <div class="col">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=남성의류" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/boy.png" height="26px" width="26px"> 남성의류
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=여성의류" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/girl.png" height="26px" width="26px"> 여성의류
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=신발,가방" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/Shoes.png" height="26px" width="26px"> 신발,가방
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=뷰티" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/beauty.png" height="26px" width="26px"> 뷰티
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=컴퓨터,주변기기" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/computer.png" height="26px" width="26px"> 컴퓨터, 주변기기
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=카메라" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/camera.png" height="26px" width="26px"> 카메라
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=디지털,가전" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/machine.png" height="26px" width="26px"> 디지털,가전
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=음향기기" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/headset.png" height="26px" width="26px"> 음향기기
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=생활용품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/toiletries.png" height="26px" width="26px"> 생활용품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=예술/희귀/수집품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/museum.png" height="26px" width="26px"> 예술/희귀/수집품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=식품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/food.png" height="26px" width="26px"> 식품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=가구/인테리어" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/furniture.png" height="26px" width="26px"> 가구/인테리어
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="col">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=스포츠,레저" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/sport.png" height="26px" width="26px"> 스포츠,레저
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=게임" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/game.png" height="26px" width="26px"> 게임
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=도서" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/book.png" height="26px" width="26px"> 도서
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=여행,숙박" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/travel.png" height="26px" width="26px"> 여행,숙박
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row col-6 align-items-center justify-content-end AddrBox">
                        <!-- 지역구 -->
                        <div class="col-5 p-0 ">
                            <!--  동 같은경우 disabled 줘서 구 선택하면 그거에 맞게 뜨게-->
                            <select class="form-select district" id="district" aria-label="Default select example"
                                name="roadAddr">
                                <c:if test="${not empty naviMap.post_addr and naviMap.post_addr ne '지역을 선택하세요'}">
                                	<option value="지역을 선택하세요">지역을 선택하세요</option>
                                	<option selected>${naviMap.post_addr}</option>
                                </c:if>
                                <c:if test="${empty naviMap.post_addr or naviMap.post_addr eq '지역을 선택하세요'}">
                                	<option selected>지역을 선택하세요</option>
                                </c:if>
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

                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr"
                                disabled=>
                                <option selected>동네를 선택하세요</option>
                                <option value="1">One</option>
                            </select>

                        </div>
                        <!-- 강남 -->
                        <div class="col-5 p-1 d-none b_dong" id="gangnam">

                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
                                <option selected>동네를 선택하세요</option>
                                <option value="가산">가산동</option>
                                <option value="독산">독산동</option>
                                <option value="시흥">시흥동</option>
                            </select>
                        </div>
                        <!-- 노원 -->
                        <div class="col-5 p-1 d-none b_dong" id="Nowon">
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
                                <option selected>동네를 선택하세요</option>
                                <option value="월계">월계동</option>
                                <option value="공릉">공릉동</option>
                                <option value="하계">하계동</option>
                                <option value="중계">중계동</option>
                                <option value="상계">상계동</option>
                            </select>
                        </div>
                          <!-- 동대문구 -->
                        <div class="col-5 p-1 d-none b_dong" id="Dongdaemun">
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
                                <option selected>동네를 선택하세요</option>
                                <option value="용신">용신동</option>
                                <option value="제기">제기동</option>
                                <option value="전농">전농동</option>
                                <option value="장안">장안동</option>
                                <option value="회기">회기동</option>
                            </select>
                        </div>
                        <!-- 동작 -->
                        <div class="col-5 p-1 d-none b_dong" id="Dongjak">
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                            <select class="form-select a_dong" aria-label="Default select example" name="extraAddr">
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
                        <form id="districeForm" class="d-none" action="/post/toSearch?curPage=1" method="post">
                            <input type="text" id="roadAddrInput" name="post_addr" >
                            <input type="text" id="extraAddrInput" name="search">
                            <input type="text" id="testSearch" value="${naviMap.post_addr}">
                        </form>

                    </div>
                </div>

                <!-- 반응 -->
                <div class="row align-items-center heder_bottom" id="reaction">
                    <div class="col p-0 dropdown">
                        <a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/resources/images/header_pooter/navibar.png" height="35px">
                        </a>
                        <a href="/post/toPost?curPage=1">
                            <img class="a_reaction" src="/resources/images/header_pooter/로고.png" height="40px" alt="로고이미지">
                        </a>
                        <div class="dropdown-menu mt-4 py-4" id="checkBox">
                            <div class="container" id="">
                                
                                <div class="row category_line">
                                    
                                    <div class="col">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2 font_a">
                                                <a href="/post/toPostWrite" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/cash.png" height="20px"> 판매하기
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2 font_a">
                                                <a href="/mypage/toMyStore" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/talk2.png" height="24px"> 싸다톡
                                                </a>
                                            </li>

                                            <li class="nav-item mb-2">
                                                <a href="#" class="nav-link p-0">
                                                 <!-- 빈값 -->
                                                </a>
                                            </li>
                                            

                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=남성의류" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/boy.png" height="26px" width="26px"> 남성의류
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=여성의류" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/girl.png" height="26px" width="26px"> 여성의류
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=신발,가방" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/Shoes.png" height="26px" width="26px"> 신발,가방
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=뷰티" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/beauty.png" height="26px" width="26px"> 뷰티
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=컴퓨터,주변기기" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/computer.png" height="26px" width="26px"> 컴퓨터, 주변기기
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=카메라" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/camera.png" height="26px" width="26px"> 카메라
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=디지털,가전" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/machine.png" height="26px" width="26px"> 디지털,가전
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=음향기기" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/headset.png" height="26px" width="26px"> 음향기기
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                
                                    <div class="col ps-3">
                                        <ul class="nav flex-column pt-2 ps-3">
                                            <li class="nav-item mb-2 font_a">
                                                <a href="/mypage/toMyStore" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/my.png" height="20px"> 내상점
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="#" class="nav-link p-0">
                                                 <!-- 빈값 -->
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="#" class="nav-link p-0">
                                                 <!-- 빈값 -->
                                                </a>
                                            </li>

                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=생활용품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/toiletries.png" height="26px" width="26px"> 생활용품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=예술/희귀/수집품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/museum.png" height="26px" width="26px"> 예술/희귀/수집품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=식품" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/food.png" height="26px" width="26px"> 식품
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=가구/인테리어" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/furniture.png" height="26px" width="26px"> 가구/인테리어
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=스포츠,레저" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/sport.png" height="26px" width="26px"> 스포츠,레저
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=게임" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/game.png" height="26px" width="26px"> 게임
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=도서" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/book.png" height="26px" width="26px"> 도서
                                                </a>
                                            </li>
                                            <li class="nav-item mb-2">
                                                <a href="/post/toSearch?curPage=1&search=여행,숙박" class="nav-link p-0">
                                                    <img src="/resources/images/header_pooter/travel.png" height="26px" width="26px"> 여행,숙박
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                    <div class="col-5 position-relative p-0" id="searchBox">
                        <form id="SearchForm2" class="m-0" action="/post/toSearch?curPage=1" method="post">
                            <a href="#" class="nav-link p-0 d-inline" id="searchIcon2"><img src="/resources/images/header_pooter/searchIcon.png" class="searchIcon"
                                    height="22px"></a>
                
                            <input type="text" class="searchInput ps-2" id="titleSearch2" name="search" placeholder="물품, 동네이름을 입력해보세요.">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Contents -->
    <!-- 시작하기전 밑에 middle 스타일 제거해주세용 -->
    <div class="container middle" >
        <div class="chattingBox">

            <div class="chatting_memberBox">
                <div class="myProfile">
                    <div class="d-flex align-items-center">
                    	<c:if test="${empty memdto.user_profile}">
                        	<img src="/resources/images/chatting/NoImg.webp">
                        </c:if>
                        <c:if test="${not empty memdto.user_profile}">
							<%-- 프로필 완성후 경로값 설정 --%>
                        	<img src="/user_profile/${memdto.user_profile}">
                        </c:if>
                        <span class="ms-2 fw-bolder">
                            ${memdto.user_nickname}
                        </span>
                    </div>
                </div>
                <!-- 채팅목록 -->
                <div class="chatting_member">
                <c:if test="${list.size() == 0}">
                	<div class="yourProfile">
                        <div class="d-flex align-items-center">
                			<b>채팅 상대가 없습니다.</b>
                		</div>
                	</div>
                </c:if>
                <c:if test="${list.size() > 0}">
                	<c:forEach items="${list}" var="list">
	                	<div class="yourProfile">
	                        <div class="d-flex align-items-center">
	                        <%-- 로그인정보값과 비교해서 다른 프로필 추출 --%>
		                        <c:if test="${loginSession.user_nickname ne list.username}">
		                        	<c:if test="${empty list.user_profile_a}">
                        				<img src="/resources/images/chatting/NoImg.webp">
		                        	</c:if>
		                        	<c:if test="${not empty list.user_profile_a}">
                        				<img src="/user_profile/${list.user_profile_a}">
		                        	</c:if>
		                        </c:if>
		                        <c:if test="${loginSession.user_nickname eq list.username}">
		                        	<c:if test="${empty list.user_profile_b}">
                        				<img src="/resources/images/chatting/NoImg.webp">
		                        	</c:if>
		                        	<c:if test="${not empty list.user_profile_b}">
                        				<img src="/user_profile/${list.user_profile_b}">
		                        	</c:if>
		                        </c:if>
	                            <div class="ms-2 member_textBox">
	                            	<%-- 로그인정보값과 비교해서 다른 닉네임 추출 --%>
		                             <c:if test="${loginSession.user_nickname eq list.username}">
		                             	<span class="fw-bolder" id="report_nickname">${list.mastername}</span> 
		                             </c:if>
		                              <c:if test="${loginSession.user_nickname ne list.username}">
		                             	<span class="fw-bolder" id="report_nickname">${list.username}</span> 
		                             </c:if>   
	                                <span class="font_gray">${list.extraaddr}·${list.last_date}</span>
	                                <div >
	                                    ${list.last_chat}
	                                </div>
	                                 <input type="text" class="d-none" id="roomId" name="roomId" value="${list.roomId}">
	                                 <input type="text" class="d-none" id="post_seq" name="post_seq"value="${list.post_seq}">
	                                 <input type="text" class="d-none" id="" name="post_seq"value="${list.post_seq}">
	                                 <input type="text" class="d-none" id="rooId_input" name="roomId">
	                                 <input type="text" class="d-none" id="post_seq_input" name="post_seq">
	                            </div>
	                        </div>
                    	</div>
	                </c:forEach>
                </c:if>
                    <%--<div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/박하사탕.jpeg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">박하사탕</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    박하사탕 좋아하세요?
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/슈퍼파워.jpeg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">슈퍼파워</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    헬스갔다가 구매할게요
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/우주.jpg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">우주를살께</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    네고 조금만 부탁드려요 ㅜㅜ
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/상상력.jpg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">생각대로</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    안살래요
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/NoImg.webp">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">싸게싸게</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    얼마까지 깍아주실수 있으세요?
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/만수르.jpg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">중고만수르</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    그냥 새거살게요
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/간지남.jpg">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">중고간지남</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    쿨거래 ㄱㄱ
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/NoImg.webp">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">중고간지녀</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    다살게요
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/NoImg.webp">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">귀티자르</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    조금 입긴했어요...
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="yourProfile">
                        <div class="d-flex align-items-center">
                            <img src="/resources/images/chatting/NoImg.webp">
                            <div class="ms-2 member_textBox">
                                <span class="fw-bolder">(-*3*)-</span> 
                                <span class="font_gray">망원동·2시간전</span>
                                <div >
                                    뿌우
                                </div>
                            </div>
                        </div>
                    </div> --%>
                </div>
            </div>
            <div class="chatting_content d-flex justify-content-center align-items-center"  id="chatting_before">
            	 <img src="/resources/images/chatting/1.png">
            </div>
            <div class="chatting_content d-none" id="chatting_after">
                <div class="yourPost">
                    <!-- 클릭시게시글로 이동 -->
                    <div class="d-flex align-items-center" id="yourPost">
                        <img src="/resources/images/chatting/타블렛.jpeg">
                        <div class="ms-2">
                            <span class="fw-bolder">우주를살께</span> 
                            <span class="font_gray">한번도안쓴 타블렛팝니다</span>
                            <div class="fw-bolder">
                                <span>5,000원</span>
                            </div>
                            
                        </div>
                    </div>
                     <!-- 모달 -->
                    <div class="col p-0 dropdown text-end">
                        <a href="#" class="naviIcon fw-bolder" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/resources/images/chatting/navibar.png" height="35px">
                        </a>
                        <ul class="dropdown-menu no_index" aria-labelledby="dropdownMenuButton1">
                            <li><a class="dropdown-item" href="#" data-bs-toggle="modal" data-bs-target="#exampleModa3">신고하기</a></li>
                            <li><a class="dropdown-item" id="chatExit" href="#">채팅방 나가기</a></li>
                        </ul>
                        <!-- Modal -->
                <div id="modal_delete">
                    <div class="modal fade" id="exampleModa3" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" style="width: 350px;">
                            <div class="row align-items-center modal-content ">
                                <div class="row align-items-center middle_bottomLine">
                                	<form class="m-0" id="reportForm" action="/report/insert" method="post">
	                                    <div class="col d-flex justify-content-center" id="modalTitle" style="width:auto;">
	                                        <input type="text" class="form-control-plaintext fw-bolder" id="report_content"
	                                            name="report_content" placeholder="내용을 입력하세요">
	                                    </div>
	                                     <div class="d-none">
					                         <input type="text" name="user_id"  value="${loginSession.user_id}"> <%-- 신고보내는 사람 --%>
					                         <input type="text" name="user_category"  value="${loginSession.user_category}"> <%-- 그사람 로그인 카테고리 --%>
					                         <input type="text" name="reported_id"id="reported_id" > <%-- 신고받는 사람 --%>
					                         <input type="text" name="category"  value="채팅"> <%-- 게시글 카테고리 --%>
					                         <input type="text" name="category_seq"id="category_seq"  > <%-- 게시글 번호 --%>
					                     </div>
                                    </form>
                                </div>

                                <div class="col d-flex justify-content-center pt-5" id="modalBtn">
                                    <button type="button" class="middle_Btn" id="post_reportBtn"
                                        data-bs-dismiss="modal">신고하기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
                </div>
                <div class="messageBox">
                	 <!-- 텍스트창 -->
                    <div class="contentDiv">
                    </div>
                    <!-- <div class="imoticonBox"></div> -->
                    <!-- 인풋창 -->
                    <div class="textDiv">
                        <div>
                            <textarea class="form-control-plaintext font_style" id="chatting_content" name="chatting_content"
                                placeholder="메세지를 입력하세요."></textarea>
                        </div>
                        
                        <div class="row p-2 dropup">
                            <!-- 이모티콘 -->
                            <div class="col" id="dropdownMenuButton1" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                                <img src="/resources/images/chatting/이모티콘.png" height="30px">
                            </div>
                            
                            <div class="dropdown-menu ms-2 imoticonBox"  aria-labelledby="dropdownMenuButton1">
                                <img src="/resources/images/chatting/1.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/2.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/3.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/4.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/5.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/6.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/7.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/8.png" class="emoticon_gabal">
                                <img src="/resources/images/chatting/9.png" class="emoticon_gabal">
                            </div>
                            <div class="col text-end me-2">
                                <span class="font_gray">
                                    <span class="length_num">0</span>/100
                                </span>
                                <button type="button" class="middle_Btn ms-2" id="writeBtn" style="width: 50px;">전송</button>
                            </div>
                        </div>
                    </div>
                   
                      
                </div>
            </div>
        </div>

     
    </div>


    <!-- footer --> 
       <!-- Modal -->
       <!-- Modal -->
       <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pt-0" id="notificationModal">
                <div class="modal-header position-sticky">
                    <div class="col-1">
                        <button type="button" id="closeBtn" data-bs-dismiss="modal" aria-label="Close">
                            <img src="/resources/images/post/left.png" height="25px">
                        </button>  
                    </div>
                    <div class="col n_title">
                        알림 창
                    </div>
                    
                </div>
                <div class="modal-body container n_content">
                	<c:if test="${notification.size() == 0}">
                		<div class="row p-1 d-flex justify-content-center fw-bold">
                			새로운 알림이 없습니다.
                		</div>
                	</c:if>
                	
                	<c:if test="${notification.size() > 0}">
                		<c:forEach items="${notification}" var="notifi">
                			<c:if test="${notifi.notification_type eq '채팅'}">
			                    <div class="row p-1 ">
			                        <div class="col-2 text-center n_logo">
			                            <img src="/resources/images/header_pooter/채팅.png" height="40px">
			                        </div>
			                        <div class="col p-0">
			                            <p>${notifi.user_nickname}님께서 "${notifi.post_title}.."글에 채팅메세지를 보내셨습니다.</p>
			                            <p class="n_date">${notifi.notification_time}</p>
			                        </div>
			                        <div class="col-1">
			                            <button type="button" class="btn-close" id="notifi_deleteBtn" value="${notifi.notification_seq}"></button>
			                        </div>
			                    </div>
		                    </c:if>
		                
		                	<c:if test="${notifi.notification_type eq '가격'}">
			                    <div class="row p-1 ">
			                        <div class="col-2 text-center n_logo">
			                            <img src="/resources/images/header_pooter/가격.png" height="40px">
			                        </div>
			                        <div class="col p-0">
			                            <p>${notifi.user_nickname}님께서 "${notifi.post_title}.."글에 ${notifi.price_restriction}원 가격제안했습니다</p>
			                            <p class="n_date">${notifi.notification_time}</p>
			                        </div>
			                        <div class="col-1">
			                            <button type="button" class="btn-close" id="notifi_deleteBtn" value="${notifi.notification_seq}"></button>
			                        </div>
			                    </div>
		                    </c:if>
		                	<c:if test="${notifi.notification_type eq '후기'}">
			                    <div class="row p-1 ">
			                        <div class="col-2 text-center n_logo">
			                            <img src="/resources/images/header_pooter/후기.png" height="40px">
			                        </div>
			                        <div class="col p-0">
			                            <p>${notifi.user_nickname}님께서 "${notifi.post_title}.."글에 후기를 남기셨습니다</p>
			                            <p class="n_date">${notifi.notification_time}</p>
			                        </div>
			                        <div class="col-1">
			                            <button type="button" class="btn-close" id="notifi_deleteBtn" value="${notifi.notification_seq}"></button>
			                        </div>
			                    </div>
		                    </c:if>
	                    </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 로고 클릭하면 모달 -->
    <div class="logo3" data-bs-toggle="modal" data-bs-target="#staticBackdrop" >
        <a class="nav-link" href="#">
            <img src="/resources/images/header_pooter/알림.png" height="56px" width="56px">
         </a>
    </div>
     <!-- 고객게시판 -->
    <div class="logo2">
        <a class="nav-link" href="/client/toClient_post?curPage=1">
            <img src="/resources/images/header_pooter/고객게시판.png" height="56px" width="56px">
         </a>
    </div>
    <%-- 관리자 아이디와 같다면 --%>
	<c:if test="${loginSession.user_id eq 'asd123@naver.com'}">
	    <div class="logo4">
	        <a class="nav-link" href="/member/toManager?curPage=1">
	            <img src="/resources/images/header_pooter/관리자.png" height="56px" width="56px">
	         </a>
	    </div>
    </c:if>
    
    <footer class="py-4 text-light">
        <div class="container" id="footerBox">
            <div class="row pooterLine pb-3">
                <div class="col a_reaction">
                    <ul class="nav flex-column">
                        <li class="nav-item mb-2 "><a href="/post/toPost?curPage=1" class="nav-link p-0">
                                <img src="/resources/images/header_pooter/로고white.png" height="46px" alt="로고">
                            </a></li>

                    </ul>
                </div>
                <div class="col">
                    <ul class="nav flex-column pt-3">
                        <li class="nav-item mb-2"><a href="/footer/toTrust" class="nav-link p-0">믿을수 있는 중고거래</a></li>
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0">자주 묻는 질문</a></li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="nav flex-column pt-3">
                        <li class="nav-item mb-2"><a href="/footer/toCheapPay" class="nav-link p-0">싸다구페이</a></li>
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0">동네가게</a></li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="nav flex-column pt-3">
                        <li class="nav-item mb-2"><a href="/footer/toTeam" class="nav-link p-0">회사소개</a></li>
                        <li class="nav-item mb-2"><a href="#" class="nav-link p-0">채용</a></li>
                    </ul>
                </div>
                <div class="col">
                    <ul class="nav flex-column pt-3">
                        <li class="nav-item mb-2"><a href="/footer/toTerms" class="nav-link p-0">이용약관</a></li>
                        <li class="nav-item mb-2"><a href="/footer/toPrivacy" class="nav-link p-0">개인정보처리방침</a></li>
                        <li class="nav-item mb-2"><a href="/footer/toLocation" class="nav-link p-0">위치기반서비스 이용약관</a></li>
                        <li class="nav-item mb-2"><a href="/footer/toPlanned" class="nav-link p-0">이용자보호 비전과 계획</a></li>
                    </ul>
                </div>
            </div>

            <div class="row pooterText">
                <div class="mt-4">
                    고객문의 <a href="#" class="nav-link p-0 d-inline">cheap@cheap.com </a>
                    제휴문의 <a href="#" class="nav-link p-0 d-inline">cheap@cheap.com </a>
                </div>
                <div class="">
                    광고 <a href="#" class="nav-link p-0 d-inline">prr@cheap.com</a>
                    PR문의<a href="#" class="nav-link p-0 d-inline">cheap@cheap.com</a> 
                    IR문의 <a href="#" class="nav-link p-0 d-inline">cheap@cheap.com</a>
                </div>
                <div class="mt-3">
                    서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 19F, 20F (당산서비스)
                    사업자 등록번호 : 123-45-00000 직업정보제공사업 신고번호 : J1234567891234
                </div>
                <div class="my-3">
                    <a href="https://www.facebook.com/" class="nav-link p-0 d-inline" target="_blank"><img class="me-2"
                            src="/resources/images/header_pooter/facebook.png" width="23px"></a>
                    <a href="https://www.instagram.com/" class="nav-link p-0 d-inline" target="_blank"><img class="me-2"
                            src="/resources/images/header_pooter/instar.png" width="23px"></a>
                    <a href="https://www.youtube.com/" class="nav-link p-0 d-inline" target="_blank"> <img class="me-3"
                            src="/resources/images/header_pooter/tube.png" width="23px"></a>
                    <a href="https://ko.wikipedia.org/wiki/%EB%8C%80%ED%95%9C%EB%AF%BC%EA%B5%AD"
                        class="nav-link p-0 d-inline" target="_blank"><img
                            src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/footer/icon-global-2f53678b428ec623cefd07a90dd7777f3e55fc0433918f645d7d75ace6ff1fc3.png"
                            width="24px"> 한국</a>

                </div>
                <div class="">
                    ©cheap Market Inc.
                </div>

            </div>
        </div>
    </footer>

    
    <script>
    //신고
    $("#post_reportBtn").on("click",function(){
    	 $("#reportForm").submit();
    	
    })
    //게시글 클릭시 디테일페이지 이동
    $("#yourPost").on("click",function(e){
    	let post_seq = $("#post_seq_input").val();
    	console.log(post_seq);
    	location.href = "/post/toPostDetail?post_seq="+post_seq;
    })
    //채팅방 나가기 클릭시
  	$("#chatExit").on("click", function(){
  		let roomId = $("#rooId_input").val();
  		console.log(roomId);
  		let post_seq = $("#post_seq_input").val();
    	console.log(post_seq);
  		location.href = "/chatting/chat_m_exit?roomId="+roomId+"&post_seq="+post_seq;
  	})
    //채팅멤버 클릭 -> 리스트 출력
    $(".yourProfile").on("click", function(e){
        $(".yourProfile").css('background-color','')
        $(this).css('background-color','rgb(237, 238, 239)');
        let roomId = $(this).find("#roomId").val();
        let post_seq = $(this).find("#post_seq").val();
        let loginId= '${loginSession.user_id}';
        $("#rooId_input").val(roomId);
        $("#post_seq_input").val(post_seq);
        console.log(post_seq,roomId);
        $.ajax({
    		url: "/chatting/chat_m_select"
    		, type: "get"
    		, data: {roomId : roomId, 
    				post_seq : post_seq}
    		, success: function(data){
    			console.log(data);
    			$("#chatting_before").remove();
    			$("#chatting_after").removeClass('d-none');
    			$("#yourPost").empty();
    			$("#yourPost").append(
    					"<img src='/user_profile/"+data.postMap.user_profile+"'>"
    					+'<div class="ms-2">'
    					+	'<span class="fw-bolder">'+ data.postMap.post_state +'</span>'
    					+	'<span class="font_gray ms-1">'+ data.postMap.post_title +'</span>'
    					+		'<div class="fw-bolder">'
    					+			'<span>'+data.postMap.price_selling+'원</span>'
    					+		'</div>'
    					+'</div>');
    			$("#reported_id").val(data.postMap.user_id);
    			$("#category_seq").val(data.postMap.post_seq);
    			console.log($("#reported_id").val()+$("#category_seq").val());
    			$(".contentDiv").empty();
    			for(var i=0; i<data.messagelist.length; i++){
    				if(data.messagelist[i].messageId==loginId){
    					var chat = 
    						"<div class='dynamicChat_r'>"
    						+"<span class='me-2 font_gray_b'>"
    	    				+	data.messagelist[i].upload_date
    	    				+"</span>"
    	    				+	data.messagelist[i].message 
    	    				+"</div>";
	    				 $(".contentDiv").append(chat);
    				}else{
    					var chat = "<div class='dynamicChat_l'>" 
    	    				+ data.messagelist[i].message 
    	    				+ "<span class='ms-2 font_gray_b'>"+data.messagelist[i].upload_date+"</span></div>";
    	    				 $(".contentDiv").append(chat);
    				}
    			}
    		}, error: function(e){
    			console.log(e);
    		}
    	})  
    })
	//이모티콘 클릭시
      $(".emoticon_gabal").on("click", function () {
    	  var now = new Date();
          // Date 객체의 getHours(시간) , getMinutes(분) 속성을 저장 합니다.
          var nowHour = now.getHours();
          var nowMt = now.getMinutes();
     		if ( nowHour <= 11  &&  nowHour  >= 0 ) {
     		  var date ='오전' + nowHour + ':' + nowMt;
     		} else if (  nowHour >= 12  &&  nowHour  < 23  ) {
     			if(nowHour<20){
     				var date ='오후0' + (nowHour-12) + ':' + nowMt;
     			}else{
     				var date ='오후' + (nowHour-12) + ':' + nowMt;
     			}
    		    
     		}
     		let message2 = "이모티콘을 보냈어요."
    	  	let loginId= '${loginSession.user_id}';    
          	let roomId = $('#rooId_input').val();
          	let messageId= '${memdto.user_id}';
          	let name =  '${memdto.user_nickname}';
    	  	let message = "<span><img style='width:180px;height:180;' src=" + $(this).prop("src") + ">" + "</span>";
            let newChat = "<div class='dynamicChat_r'><span class='font_gray_b'>" + date + "</span>" 
                + message +"</div>";
            console.log(newChat);
            $(".contentDiv").append($(newChat).hide());
            $(".dynamicChat_r").fadeIn("slow")
                // 스크롤 아래
                let scrollH = $(".contentDiv").prop("scrollHeight");
                $(".contentDiv").scrollTop(scrollH);
                
                
                $.ajax({
            		url: "/chatting/chat_m_insert"
            		, type: "post"
            		, data: {roomId:roomId, messageId : messageId, name:name,
            				message : message, message2:message2}
            		, success: function(data){
            			console.log(data);
            			if(data =="success"){
            			}else{
            				alert("실패!");
            			}
            		}, error: function(e){
            			console.log(e);
            		}
            	})
        })
    
    //전송버튼 클릭시
    $("#writeBtn").on("click", function(){
    	let user_id= '${memdto.user_id}';
    	let loginId= '${loginSession.user_id}';
    	console.log(user_id,loginId);
        if($(".length_num").html()>100){
            alert("글자수 초과로 입력할수 없습니다")
            return;
        }
        makeDynamicEl();
    })
    // 키보드입력시
    $("#chatting_content").on("keyup", function (e) {
        // 엔터 클릭시 
        if (e.keyCode == 13 && ($("#chatting_content").val() !== "")) {
            makeDynamicEl();
        }
        if($(".length_num").html()>100){
            alert("글자수 초과로 입력할수 없습니다")
        }
        let length_cnt = $("#chatting_content").val().length+1;
        let length_num = length_cnt*3;
        $(".length_num").html(length_num);
       
    })
    
      function makeDynamicEl(){
    	
    	let loginId= '${loginSession.user_id}';    
        let roomId = $('#rooId_input').val();
        let messageId= '${memdto.user_id}';
        let name =  '${memdto.user_nickname}';
        let message = '<span class="chat_text">' +$("#chatting_content").val() +'</span>';
       	let message2 = $("#chatting_content").val();
        $.ajax({
    		url: "/chatting/chat_m_insert"
    		, type: "post"
    		, data: {roomId:roomId, messageId : messageId, name:name,
    				message : message, message2:message2}
    		, success: function(data){
    			console.log(data);
    			if(data =="success"){
    			}else{
    				alert("실패!");
    			}
    		}, error: function(e){
    			console.log(e);
    		}
    	})  
    	 var now = new Date();
         // Date 객체의 getHours(시간) , getMinutes(분) 속성을 저장 합니다.
         var nowHour = now.getHours();
         var nowMt = now.getMinutes();
         if ( nowHour <= 11  &&  nowHour  >= 0 ) {
    		  var date ='오전' + nowHour + ':' + nowMt;
    		} else if (  nowHour >= 12  &&  nowHour  < 23  ) {
    			if(nowHour<20){
    				var date ='오후0' + (nowHour-12) + ':' + nowMt;
    			}else{
    				var date ='오후' + (nowHour-12) + ':' + nowMt;
    			}
   		    
    		}
    	if(loginId==messageId){
    		let newChat = "<div class='dynamicChat_r'><span class='me-2 font_gray_b'>" + date + 
            "</span>" + message + "</div>";
        	$(".contentDiv").append($(newChat).hide());
        	$(".dynamicChat_r").fadeIn("slow");
    	}else{
    		let newChat = "<div class='dynamicChat_l'><span class='me-2 font_gray_b'>" + date + 
            "</span>" + message + "</div>";
	        $(".contentDiv").append($(newChat).hide());
	        $(".dynamicChat_l").fadeIn("slow");
    	}
            let scrollH = $(".contentDiv").prop("scrollHeight");
            $(".contentDiv").scrollTop(scrollH);
            $("#chatting_content").focus();
            $("#chatting_content").val("");
        }
    </script>

</body>
<!-- js -->
<script src="/resources/js/header_footer.js"></script>
</html>
