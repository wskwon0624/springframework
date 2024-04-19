<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
		
	</head>
	<body>
		<div class="d-flex flex-column vh-100 ">
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<div class="flex-grow-1">
				<div class="d-flex row m-2 ">
					<div class="col-md-4">
						<%@ include file="/WEB-INF/views/common/menu.jsp" %>
					</div>
					<div class="col-md-8 ">
						<div class="card">
							<div class="card-header">회원가입</div>
							<div class="card-body">
								<form class="m-2" method="post" action="signup">
									<div class="form-group">
										<label for="mid">아이디</label>
										<input type="text" class="form-control" id="mid" name="mid" value="${ch04SignupForm.mid}">
									    <div class="text-danger" style="font-size:0.7rem;"><form:errors path="ch04SignupForm.mid"/></div>
									</div>
												   
									<div class="form-group">
										<label for="mpassword">비밀번호</label>
										<input type="password" class="form-control" id="mpassword" name="mpassword" value="${ch04SignupForm.mpassword}">
										<div class="text-danger" style="font-size:0.7rem;"> <form:errors path="ch04SignupForm.mpassword"/></div>
									</div>
									
									<div class="form-group">
										<label for="mname">이름</label>
										<input type="text" class="form-control" id="mname" name="mname" value="${ch04SignupForm.mname}">
									    <div class="text-danger" style="font-size:0.7rem;"><form:errors path="ch04SignupForm.mname"/></div>
									</div>
									
									<div class="form-group">
										<label for="memail">이메일</label>
										<input type="text" class="form-control" id="memail" name="memail" value="${ch04SignupForm.memail}">
									    <div class="text-danger" style="font-size:0.7rem;"><form:errors path="ch04SignupForm.memail"/></div>
									</div>
												   
									<div class="form-group">
										<label for="mphonenumber">전화번호</label>
										<input type="text" class="form-control" id="mphonenumber" name="mphonenumber" value="${ch04SignupForm.mphonenumber}">
										<div class="text-danger" style="font-size:0.7rem;"> <form:errors path="ch04SignupForm.mphonenumber"/></div>
									</div>			   
									
									<%-- 양식의 데이터를 서버로 보내겠다 --%>
									<button type="submit"  class="btn btn-outline-success my-3">회원가입</button>
								</form>
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</body>
</html>