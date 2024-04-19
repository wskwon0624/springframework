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
		
		<script>
			const handleBtn1 = () =>{
				$.ajax({
					url:"objectreturnjson1",
					method:"get",
					success:function(data){
						console.log(data);
					}
				});
			};
			const handleBtn2 = () =>{
				$.ajax({
					url:"objectreturnjson2",
					method:"get",
					success:function(data){
						console.log(data);
					}
				});
			};
		</script>
		
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
							<div class="card-header">Object Return</div>
							<div class="card-body">
								<button onclick="handleBtn1()" class="btn btn-outline-primary btn-sm">get file information by JSON1</button>
								<button onclick="handleBtn2()" class="btn btn-outline-danger btn-sm">get file information by JSON2</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>