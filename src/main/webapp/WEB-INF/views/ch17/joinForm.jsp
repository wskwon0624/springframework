<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="${pageContext.request.contextPath}resources/bootstrap-5.3.3-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}resources/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}resources/jquery/jquery-3.7.1.min.js"></script>
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
						<div class="card-header">회원가입</div>
						<div class="card-body">

							<form method="post" action="join">
								<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>

								<div class="form-group mb-2">
									<label for="mid">Member ID</label> <input type="text"
										class="form-control" id="mid" name="mid">
								</div>

								<div class="form-group mb-2">
									<label for="mname">Member Name</label> <input type="text"
										class="form-control" id="mname" name="mname">
								</div>

								<div class="form-group mb-2">
									<label for="mpassword">Member Password</label> <input
										type="password" class="form-control" id="mpassword"
										name="mpassword">
								</div>

								<div class="form-group mb-2">
									<label for="memail">Member email</label> <input type="text"
										class="form-control" id="memail" name="memail">
								</div>

								<div class="form-group mb-2">
									<label for="mrole">Member Role</label> <select
										class="form-control" id="mrole" name="mrole">
										<option value="ROLE_ADMIN">Admin</option>
										<option value="ROLE_MANAGER">Manager</option>
										<option value="ROLE_USER" selected>User</option>
									</select>
								</div>


								<button type="submit" class="btn btn-info btn-sm mt-2">로그인</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>