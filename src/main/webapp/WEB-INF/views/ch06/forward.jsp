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
							<div class="card-header">request 범위 데이터 사용</div>
							<div class="card-body">
								<p>회원 아이디: ${member1.mid}</p>
								<p>회원 이름: ${member1.mname}</p>
								<p>회원 이메일: ${member1.memail}</p>
								<hr/>
								<p>회원 아이디: ${member2.mid}</p>
								<p>회원 이름: ${member2.mname}</p>
								<p>회원 이메일: ${member2.memail}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>