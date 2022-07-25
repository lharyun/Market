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
.container {
	margin-top: 200px;
}

.tab-content {
	border: 1px solid #f47d39;
	border-radius: 3px;
	min-height: 500px;
	padding: 20px;
}

.Cheader {
	text-align: center;
	margin-bottom:20px;
}

#searchInput {
	display: inline-block;
}

.Cbody>.row{

padding:10px;
border-top: 1px solid #f57e76;
}
.Cbody>.row>div{
text-align:center;
}
.Cheader>.row{
	padding:5px;
}
</style>
<body>

	<div class="container">
		<nav>
			<div class="nav nav-tabs" id="nav-tab" role="tablist">
				<button class="nav-link active" id="nav-Member-tab"
					data-bs-toggle="tab" data-bs-target="#nav-Member" type="button"
					role="tab" aria-controls="nav-Member" aria-selected="true">Member</button>
				<button class="nav-link" id="nav-BlackList-tab" data-bs-toggle="tab"
					data-bs-target="#nav-BlackList" type="button" role="tab"
					aria-controls="nav-BlackList" aria-selected="false">BlackList</button>
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
					<div class="col-8"></div>	
					<div class="col-3">
					<input type="text" class="form-control" placeholder="id찾기"
								id="MsearchInput">			
					</div>
					<div class="col-1">
							<button type="button" id="MsearchBtn" class="btn btn-info">찾기</button>
					</div>
					</div>
					<div class="row">
						<div class="col-1">선택</div>
						<div class="col-2">아이디</div>
						<div class="col-2">카테고리</div>
						<div class="col-2">닉네임</div>
						<div class="col-2">이름</div>
						<div class="col-2">핸드폰번호</div>
						<div class="col-1">블랙</div>

					</div>
		
				</div>
				<div class="Cbody"><!-- 멤버 -->
					
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

					
					<div class="cfooter">
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




			</div>
			<div class="tab-pane fade" id="nav-BlackList" role="tabpanel"
				aria-labelledby="nav-BlackList-tab">
				<div class="Cheader">
					<div class="row">
						<div class="col-auto text-end">
							<input type="text" class="form-control" placeholder="id찾기"
								id="BsearchInput">
						</div>
						<div class="col-auto text-end">
							<button type="button" id="BsearchBtn" class="btn btn-info">찾기</button>
						</div>
					</div>
					<div class="row">
						<div class="col-1">번호</div>
						<div class="col-2">날짜</div>
						<div class="col-5">사유</div>
						<div class="col-2">아이디</div>
						<div class="col-2">카테고리</div>

					</div>
				</div>

				<div class="Cbody"><!-- 블랙리스트 -->

					<c:forEach items="${blackList }" var="dto">
						<div class="row">
							<div class="col-1"><input type="checkbox" value="${dto.blackList_seq }"></div>
							<div class="col-2">${dto.blackList_date }</div>
							<div class="col-5">${dto.blackList_content }</div>
							<div class="col-2">${dto.user_id }</div>
							<div class="col-2">${dto.user_category }</div>
						</div>

					</c:forEach>


				</div>
			</div>
			<!-- 2Page -->
			<div class="tab-pane fade" id="nav-Report" role="tabpanel"
				aria-labelledby="nav-Report-tab">
				<div class="Cheader">
					<div class="row">
						<div class="col-auto text-end">
							<input type="text" class="form-control" placeholder="id찾기"
								id="searchInput">
						</div>
						<div class="col-auto text-end">
							<button type="button" class="btn btn-info">찾기</button>
						</div>
					</div>
					<div class="row">
						<div class="col-1">신고번호</div>				
							<div class="col-7">신고내역</div>
							<div class="col-2">아이디</div>
							<div class="col-2">카테고리</div>

					</div>
				</div>

				<div class="Cbody">
					<div class="row">
						<c:forEach items="${reportList }" var="dto"><!-- 신고 -->

							<div class="col-1">${dto.report_seq }</div>				
							<div class="col-7">${dto.report_content }</div>
							<div class="col-2">${dto.user_id }</div>
							<div class="col-2">${dto.user_category }</div>


						</c:forEach>

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
							<label for="message-text" class="col-form-label">Reseon:</label>
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

	<script>
		function setBox(e) {
			td = e.parentNode;
			td.style.backgroundColor = (e.checked) ? "#ffafa1" : "white";
			tr = e.parentNode.parentNode;
			tr.style.backgroundColor=(e.checked)?"#f4ffe8":"#fff";
		}

		var exampleModal = document.getElementById('exampleModal')
		exampleModal.addEventListener('show.bs.modal', function(event) {//블랙리스트 버튼을 클릭했을때

			var button = event.relatedTarget
			var recipient = button.getAttribute('data-bs-whatever')
			var modalTitle = exampleModal.querySelector('.modal-title')
			var modalBodyInput = exampleModal
					.querySelector('.modal-body input')

			modalTitle.textContent = "블랙리스트"

		})

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
						location.href = "/member/toManager";
					},
					error : function(e) {
						console.log(e);
					}
				});
			}

		})
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
				if (confirm("해당 회원을 정말 삭제하시겠습니까?")) {
					$.ajax({
						url : "/member/delete",
						type : 'post',
						data : {
							"arr[]" : arr
						},
						success : function(data) {
							console.log(data);
							alert("해당 데이터가 삭제되었습니다.")
							location.href = "/member/toManager";
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
</html>