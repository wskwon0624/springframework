<%-- 페이지 지시자느 항상 상단에 위치해야함 --%>
<%-- 페이지 지시자는 was(여기서는 톰캣)이 페이지를 어떻게 해석해야 하는지 방법을 기술  jsp 파일은 자바로만 쓰여지기 때문에 language는 생략가능 type charset과  pageEnoding이 같으면 생략가능--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<%-- 인클루드 지시자는 소스만 복사해서  붙여넣기--%>
		    <%@ include file="/WEB-INF/views/common/header.jsp" %>
			<div class="flex-grow-1">
				<div class="d-flex row m-2 ">
					<div class="col-md-4">
						<%-- <%@ include file="/WEB-INF/views/common/menu.jsp" %> --%>
						<%-- 외부에서 실행하고 결과만 삽입 --%>
						<jsp:include page="/WEB-INF/views/common/menu.jsp"></jsp:include>
					</div>
					<div class="col-md-8 ">
						<div class="card">
							<div class="card-header">홈</div>
							<div class="card-body">
								집
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>