<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
						<div class="card-header">writeBoardForm</div>
						<div class="card-body">
							<form id="joinForm" method="post" action="#">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">name</span>
										<input type="text"> 
									</div>
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">id</span>
									</div>
										<input type="text"> 
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">password</span>
									</div>
										<input type="text"> 
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">job</span>
									</div>
										<input type="text"> 
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">city</span>
									</div>
										<input type="text"> 
								</div>

								<div class="mt-3">
									<button class="btn btn-info btn-sm mr-2">join</button>
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