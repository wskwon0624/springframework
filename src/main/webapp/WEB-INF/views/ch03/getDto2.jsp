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
			<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<div class="flex-grow-1">
				<div class="d-flex row m-2 ">
					<div class="col-md-4">
						<%@ include file="/WEB-INF/views/common/menu.jsp" %>
					</div>
					<div class="col-md-8 ">
						<div class="card">
							<div class="card-header">Request Param Data2</div>
							<div class="card-body">
								<p>param1: ${ch03Dto.param1}</p>
								<p>param2: ${ch03Dto.param2}</p>
								<p>param3: ${ch03Dto.param3}</p>
								<p>param4: ${ch03Dto.param4}</p>
								<p>param5: ${ch03Dto.param5}</p>									  
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>