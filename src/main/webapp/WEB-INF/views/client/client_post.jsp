<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>고객게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
.container {
	border: 2px solid #f47d39;
	border-radius: 15px;
	width: 1200px;
	height: 1800px;
	text-align: center;
	margin: auto;
	margin-top: 150px;
}

.board {
	padding: 30px;
	margin: auto;
	text-align: center;
	margin: auto;
}
</style>
</head>
<body>
	<div class="container">
	<button type="button" id="managerBtn">Manager</button>
	<script>
	$("#managerBtn").on("click",function(){
		location.href="/client/toManager"
	})
	</script>
		<div class="board">
			<div id="bHeader">
				<div class="row">
					<div class="col-10 text-start">
						<p class="fs-2 fw-bold fst-italic ">자주묻는 QnA</p>
					</div>
					<div class="col-2">
						<!-- 만약 관리자 계정이면 버튼 활성화 -->
						<button type="button" class="btn btn-secondary" id="writeBtn">
							글쓰기</button>
					</div>
					<hr style="border: 2px solid #f47d39" />

					<!-- 태그박스 -->
					<ul class="nav nav-tabs" id="myTab" role="tablist">
						<li class="nav-item" role="presentation">
							<button class="nav-link active" id="nav-home-tab" value="all"
								data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
								role="tab" aria-controls="home" aria-selected="true">전체</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-buySell-tab"
								data-bs-toggle="tab" data-bs-target="#nav-buySell" type="button"
								role="tab" value="buy" aria-controls="buySell"
								aria-selected="false">구매/판매</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-account-tab"
								data-bs-toggle="tab" data-bs-target="#nav-account" type="button"
								role="tab" value="account" aria-controls="account"
								aria-selected="false">계정/인증</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-items-tab" data-bs-toggle="tab"
								data-bs-target="#nav-items" type="button" role="tab"
								value="items" aria-controls="items" aria-selected="false">거래품목</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-manner-tab" data-bs-toggle="tab"
								data-bs-target="#nav-manner" type="button" role="tab"
								value="manner" aria-controls="manner" aria-selected="false">거래매너</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-sanction-tab"
								data-bs-toggle="tab" data-bs-target="#nav-sanction"
								type="button" role="tab" value="sanction"
								aria-controls="sanction" aria-selected="false">이용제재</button>
						</li>
						<li class="nav-item" role="presentation">
							<button class="nav-link" id="nav-addition-tab"
								data-bs-toggle="tab" data-bs-target="#nav-addition"
								type="button" role="tab" value="addition"
								aria-controls="addition" aria-selected="false">기타</button>
						</li>
					</ul>

				</div>
			</div>
			<div id="bBody">
				<div class="row ">
					<div class="tab-content" id="myTabContent">
						<div class="tab-pane fade show active" id="nav-home"
							role="tabpanel" aria-labelledby="home">

							<!-- content -->
							<c:if test="${list.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${list.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${list}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->
						</div>
						<div class="tab-pane fade" id="nav-buySell" role="tabpanel"
							aria-labelledby="buy">
							<!-- content -->
							<c:if test="${buySell.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${buySell.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${buySell}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->

						</div>
						<div class="tab-pane fade" id="nav-account" role="tabpanel"
							aria-labelledby="account">
							<!-- content -->
							<c:if test="${account.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${account.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${account}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->

						</div>
						<div class="tab-pane fade" id="nav-items" role="tabpanel"
							aria-labelledby="list">
							<!-- content -->
							<c:if test="${items.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${items.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${items}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->
						</div>
						<div class="tab-pane fade" id="nav-manner" role="tabpanel"
							aria-labelledby="manner">
							<!-- content -->
							<c:if test="${manner.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${manner.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${manner}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->
						</div>
						<div class="tab-pane fade" id="nav-sanction" role="tabpanel"
							aria-labelledby="sanction">
							<!-- content -->
							<c:if test="${sanction.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${sanction.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${sanction}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->

						</div>
						<div class="tab-pane fade" id="nav-addition" role="tabpanel"
							aria-labelledby="addition">
							<!-- content -->
							<c:if test="${addition.size() == 0}">
								<tr>
									<td colspan="5">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${addition.size() > 0}">
								<div class="accordion" id="accordionExample">
									<c:forEach items="${addition}" var="dto" varStatus="status">


										<div class="accordion-item">
											<h2 class="accordion-header" id="heading${status.count}">
												<button class="accordion-button collapsed" type="button"
													data-bs-toggle="collapse"
													data-bs-target="#collapse${status.count}"
													aria-expanded="true"
													aria-controls="collapse${status.count}">
													${dto.client_title }</button>
											</h2>
											<div id="collapse${status.count}"
												class="accordion-collapse collapse collapsed"
												aria-labelledby="headingOne"
												data-bs-parent="#accordionExample">
												<div class="accordion-body">${dto.client_content }</div>
											</div>
										</div>


									</c:forEach>
								</div>
							</c:if>

							<!-- end Content -->
							
						</div>

					</div>

					<!-- 태그박스 끝 -->







				</div>
			</div>
		</div>
	</div>

	<script>
		$("#nav-buySell-tab").on("click", function(e) {
			console.log($(e.target).val());

		})
		$("#writeBtn").on("click", function() {
			location.href = "/client/toWrite";
		})
	</script>
</body>

</html>

