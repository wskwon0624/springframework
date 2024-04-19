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
				console.log("handleBtn1 run");
				location.href = "getMethod?chNum=ch02&bkind=honkong&bno=200"
			};
			
			const handleBtn2 = () =>{
				 console.log("handleBtn2 run");
			 	$.ajax({
					url:"getMethodAjax",
					method:"get",
					/* data:"bkind=notice&bno=300", */
					data:{bkind:"notice", bno:300},
					success:function(data){
						 console.log(data);
						$("#ajaxResponseInclude").html(data);
					}
				}); 
			 	 
			 	/* $.get("getMethodAjax", {bkind:"notice", bno:300},data => {
			 		$("#ajaxResponseInclude").html(data);
			 	}); */
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
							<div class="card-header">GET method</div>
							<div class="card-body">
								<form class="m-2" method="get" action="getMethod">
								   <input type="hidden" name="chNum" value="ch02">
								   <div class="form-group">
								       <label for="bkind">bkind</label>
								       <input type="text" class="form-control" id="bkind" name="bkind" value="free">
								   </div>
								   
								   <div class="form-group">
								       <label for="bno">bno</label>
								       <input type="text" class="form-control" id="bno" name="bno" value="1">
								   </div>
								   <%-- 양식의 데이터를 서버로 보내겠다 --%>
								  	<input type="image" src="${pageContext.request.contextPath}/resources/image/button.jpg" style ="display: block;" 
								   	width="100" class="my-3"/>
								  	<input type="submit" value="GET method" class="btn btn-info btn-sm" style ="display: block;"/>
								   <%-- form태그 안에 있을때만 제출 능력을 가진다 --%>
								   	<button type="submit" class="btn btn-primary btn-sm" style ="display: block;">Get method</button>
								</form>
								
								<hr/>
								
								<button type="button" onclick="handleBtn1()" class="btn btn-success btn-sm">By javaScript</button>
								<button type="button" onclick="handleBtn2()" class="btn btn-success btn-sm">By Ajax</button>
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