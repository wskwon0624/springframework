<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
						<div class="card-header">로그인</div>
						<div class="card-body">
							<ul>
								<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li><a
									href="${pageContext.request.contextPath}/ch17/admin/page">Admin
										page</a></li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_MANAGER')">
								<li><a
									href="${pageContext.request.contextPath}/ch17/manager/page">Manager
										page</a></li>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_USER')">
								<li><a
									href="${pageContext.request.contextPath}/ch17/manager/page">User
										page</a></li>
								</sec:authorize>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>