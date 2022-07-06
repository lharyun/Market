<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style>
</style>
</head>
<body>
	<div class="container2">
		<div class="row justify-content-center">
			<div class="col-8">
				<form action="/client/write" id="writeForm" method="post">
					<div class="row">
						<div class="col">
							<h2>게시글 작성</h2>
							<hr />
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<input type="text" class="form-control" id="title"
								name="client_title" placeholder="제목을 입력해 주세요." />
						</div>
						<div class="col-2">
							<select class="form-select" id="select" name="client_category" aria-label="Default select example">
								<option value="" selected>선택하세요</option>
								<option value="buySell">구매/판매</option>
								<option value="account">계정/인증</option>
								<option value="items">거래 품목</option>
								<option value="manner">거래매너</option>
								<option value="sanction">이용제제</option>
								<option value="addition">기타</option>
							</select>
						</div>
						<div class="col-2">
							<button type="button" id="submitBtn" class="btn btn-primary">
								작성</button>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col">

							<textarea id="summernote" name="client_content"
								class="summernote"></textarea>

						</div>
					</div>
					<input style="display: none;" type="text" id="user_id"
						name="user_id" value="${loginSession.user_id }"> <input
						style="display: none;" type="text" id="user_category"
						name="user_category" value="${loginSession.user_category }">
				</form>
			</div>
		</div>
	</div>
	<script>
		$(document)
				.ready(
						function() {

							var toolbar = [
									// 글꼴 설정
									[ 'fontname', [ 'fontname' ] ],
									// 글자 크기 설정
									[ 'fontsize', [ 'fontsize' ] ],
									// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'strikethrough', 'clear' ] ],
									// 글자색
									[ 'color', [ 'forecolor', 'color' ] ],
									// 표만들기
									[ 'table', [ 'table' ] ],
									// 글머리 기호, 번호매기기, 문단정렬
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									// 줄간격
									[ 'height', [ 'height' ] ],
									// 그림첨부, 링크만들기, 동영상첨부
									[ 'insert', [ 'picture', 'link', 'video' ] ],
									// 코드보기, 확대해서보기, 도움말
									[
											'view',
											[ 'codeview', 'fullscreen', 'help' ] ] ];

							var setting = {
								height : 300,
							
								minHeight : null,
								maxHeight : null,
								focus : true,
								lang : 'ko-KR',
								toolbar : toolbar,
								callbacks : { //여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files, editor,
											welEditable) {
										for (var i = files.length - 1; i >= 0; i--) {
											uploadSummernoteImageFile(files[i],
													this);
										}
									}
								}
							};

							$('#summernote').summernote(setting);
						});

		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					console.log(data);
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}

		$("#submitBtn").on("click", function() {
			if($("#title").val()==""){
				alert("제목을 입력해 주세요");
				$("#title").focus();
				return;		
			}else if($("#select").val()==""){
				alert("항목을 선택해 주세요");
				$("#select").focus();
				return;		
			}else if($("#summernote").val()==""){
				alert("내용을 입력해 주세요");
				$('#summernote').summernote({
				     focus: true
				});
				return;
			}
			console.log("form.submit");
			$("#writeForm").submit();
				console.log($("#writeForm").submit);
				
			
			
			
		})
	</script>
</body>
</html>