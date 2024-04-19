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
		const requestAjax = () => {
			
			let param1 = $("#param1").val();
			let param2 = $("#param2").val();
			let param3 = $("#param3").val();
			let param4 = $("input[name=param4]:checked").val();
			let param5 = $("#param5").val();
			
			let params = {param1, param2, param3, param4, param5};
			
			$.ajax({
				url:"getAjaxParams",
				method:"post",
				data: params,
				success: function(data){
					console.log(data);
				},
			})
			
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
							<div class="card-header">ajax</div>
							<div class="card-body">
								<a href="javascript:requestAjax()"class="btn btn-outline-warning btn-sm">a Ajax</a>
								<button type="button" onclick="javascript:requestAjax()" class="btn btn-outline-danger btn-sm">button Ajax</button>
								
								<hr/>
								
								<form>
								   <div class="input-group">
								      <span class="input-group-text">param1</span>
								      <input id="param1" type="text" name="param1" class="form-control" value="문자열">
								   </div>
								   <div class="input-group">
								      <span class="input-group-text">param2</span>
								      <input id="param2" type="text" name="param2" class="form-control" value="5" >
								   </div>
								   <div class="input-group">
								      <span class="input-group-text">param3</span>
								      <input id="param3" type="text" name="param3" class="form-control" value="3.14">
								   </div>
								   <div class="input-group">
								      <span class="input-group-text">param4</span>
								      <div class="form-control d-flex">
								         <div>
								           <input type="radio" name="param4" checked value="true">
								           <label>true</label>
								         </div>
								         <div class="ms-3">
								           <input type="radio" name="param4" value="false">
								           <label>false</label>
								         </div>
								      </div>
								   </div>
								   <div class="input-group">
								      <div class="input-group-prepend"><span class="input-group-text">param5</span></div>
								      <input id="param5" type="date" name="param5" class="form-control" value="2024-04-15">
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