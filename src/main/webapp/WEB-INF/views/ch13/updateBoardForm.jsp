<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
						<div class="card-header">게시물 수정</div>
						<div class="card-body">
							<form id="updateBoardForm" method="post" action="updateBoard"
								enctype="multipart/form-data">
								<div class="input-group mt-2">
									<div class="input-group-prepend">
										<span class="input-group-text">bno</span>
									</div>
									<input id="bno" type="text" name="bno"
										class="form-control" readonly value="${board.bno}">
								</div>
								<div class="input-group mt-2">
									<div class="input-group-prepend">
										<span class="input-group-text">btitle</span>
									</div>
									<input id="btitle" type="text" name="btitle"
										class="form-control" value="${board.btitle}">
								</div>

								<div class="input-group mt-2">
									<div class="input-group-prepend">
										<span class="input-group-text">bcontent</span>
									</div>
									<textarea id="bcontent" name="bcontent" class="form-control">${board.bcontent}</textarea>
								</div>

								<div class="input-group mt-2">
									<div class="input-group-prepend">
										<span class="input-group-text">battach</span>
									</div>
									<input id="battach" type="file" name="battach"
										class="form-control">
								</div>
								
								<c:if test="${board.battachoname != null }">
								<img src="attachDownload?bno=${board.bno}" width="150"/>
								</c:if>
								
								<div class="mt-3">
									<button class="btn btn-outline-primary btn-sm me-2">수정</button>
									<a class="btn btn-outline-primary btn-sm" href="boardList">목록보기</a>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>