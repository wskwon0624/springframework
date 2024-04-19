<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script>
	function updateCartItem(pno){
		console.log("amount"+pno);
		let amount = $("#amount"+pno).val();
		console.log(amount);
		$.ajax({
			url:"updateCartItem",
			method:"POST",
			data: {pno,amount},
			success:function(data){
				console.log(data)
			}
		})
	};
</script>
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
						<div class="card-header">장바구니 </div>
						<div class="card-body">
							<table class="table border">
								<thead class="table-info">
									<tr>
										<th>번호</th>
										<th>상품명</th>
										<th>가격</th>
										<th>수량</th>
										<th>수정 및 삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="cartItem" items="${cartItemList}" >
										<tr>
											<td>${cartItem.product.pno}</td>
											<td>${cartItem.product.pname}</td>
											<td>${cartItem.product.pprice}</td>
											<td><input type="number" id="amount${cartItem.product.pno}" value="${cartItem.amount}"></td>
											<td>
												<button onclick="updateCartItem(${cartItem.product.pno})" class="btn btn-outline-success btn-sm">수정</button>
												<a href="removeCartItem?pno=${cartItem.product.pno}" class="btn btn-outline-warning btn-sm">삭제</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>