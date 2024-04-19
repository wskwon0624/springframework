<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script>
	$(function(){
	/* 	$("#btn-ajax").click(() => {
			console.log("btn-ajax");
		}); 
		
		$("#btn-ajax").on("click",() => {
			console.log("btn-ajax2")
		});
		
		document.querySelector("#btn-ajax").addEventListener("click",()=>{
			console.log("btn-ajax3")
		}); */
		
		$("#btn-ajax").click(() => {
			let formData = new FormData();
		    formData.append("title", $("#title").val());
		    formData.append("desc", $("#desc").val());
		    formData.append("attach", $("#attach")[0].files[0]);
			
 	        $.ajax({
				url:"fileUploadAjax",
				method:"post",
				data:formData,
				cache:false,
				processData:false,
				contentType:false,
				success:function(data){
					if(data.result == "success"){
						const myModal = new bootstrap.Modal('#myModal')
						myModal.show()
					}
				}
			}) 
		}); 
	});
</script>

</head>
<body>
	<div class="d-flex flex-column vh-100 ">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<div class="flex-grow-1">
			<div class="d-flex row m-2 ">
				<div class="col-md-4">
					<%@ include file="/WEB-INF/views/common/menu.jsp"%>
				</div>

				<div class="col-md-8 ">
					<div class="card">
						<div class="card-header">파일 업로드 폼</div>
						<div class="card-body">
							<form method="post" enctype="multipart/form-data"
								action="fileUpload">
								<div class="form-group">
									<label for="title">파일 이름</label> <input type="text"
										class="form-control" id="title" name="title" placeholder="제목">
								</div>
								<div class="form-group mt-3">
									<label for="desc">파일 설명</label> <input type="text"
										class="form-control" id="desc" name="desc" placeholder="설명">
								</div>
								<div class="form-group mt-3">
									<label for="attach">첨부 파일</label> <input type="file" multiple
										class="form-control-file" id="attach" name="attach">
								</div>

								<!-- 방법1 -->
								<button class="btn btn-outline-success btn-sm mt-3">Form
									파일 업로드</button>
								<!-- 방법2 -->
								<button id="btn-ajax" type="button"
									class="btn btn-outline-success btn-sm mt-3">Ajax 파일
									업로드</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<div class="modal" id="myModal">
	<div class="modal-dialog modal-dialog-centered modal-sm">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">Modal Heading</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
			파일 업로드 성공
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-outline-success btn-sm" data-bs-dismiss="modal">Close</button>
			</div>

		</div>
	</div>
</div>
</html>