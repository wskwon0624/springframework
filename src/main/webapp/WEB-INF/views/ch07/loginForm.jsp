<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
						<div class="card-header">sessionData</div>
						<div class="card-body">
							<c:if test="${login=='success'}">
								<a href="sessionLogout" class="btn btn-outline-success btn-sm">로그아웃</a>
							</c:if>
							
							<c:if test="${login!='success'}">
								<form class="m-2" method="post" action="sessionLogin">
									<div class="form-group">
										<label for="mid">아이디</label> 
										<input type="text" class="form-control" id="mid" name="mid" value="${ch04LoginForm.mid}">
									</div>
	
									<div class="form-group">
										<label for="mpassword">비밀번호</label> 
										<input type="password"class="form-control" id="mpassword" name="mpassword" value="${ch04LoginForm.mpassword}">
									</div>
	
									<%-- 양식의 데이터를 서버로 보내겠다 --%>
									<button type="submit" class="btn btn-outline-success my-3">회원가입</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>