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
			const handleBtn = () => {
				let mid = $("#mid").val();
				let mpassword = $("#mpassword").val();
				
				console.log(mid, mpassword);
				$.ajax({
					url:"postMethodAjax",
					method:"post",
					data:{mid, mpassword},
					success:function (data){
							if(data.result==="success"){
								$("#ajaxResponseInclude").html("로그인 성공");
							}else{
								if(data.reason === "wrongMid"){
									$("#ajaxResponseInclude").html("아이디 틀림");
								}else{
									$("#ajaxResponseInclude").html("비번 틀림");
								}		
							}
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
							<div class="card-header">Post method</div>
							<div class="card-body">
								<form class="m-2" method="post" action="postMethod">
								   <input type="hidden" name="chNum" value="ch02">
								  
								   <div class="form-group">
								       <label for="mid">ID</label>
								       <input type="text" class="form-control" id="mid" name="mid" value="spring">
								   </div>
								   
								   <div class="form-group">
								       <label for="mpassword">PASSWORD</label>
								       <input type="password" class="form-control" id="mpassword" name="mpassword" value="12345">
								   </div>
								   <%-- 양식의 데이터를 서버로 보내겠다 --%>
								  	<input type="image" src="${pageContext.request.contextPath}/resources/image/button.jpg" style ="display: block;" 
								   	width="100" class="my-3"/>
								</form>
								
								<hr/>
								
								<button type="button" onclick="handleBtn()" class="btn btn-danger btn-sm">By Ajax</button>
								<div id="ajaxResponseInclude" class="mt-2">
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>