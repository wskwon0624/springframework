<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
		<header>
			<nav class="navbar navbar-expand-sm bg-info navbar-info">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="/springframework">
			      <img src="${pageContext.request.contextPath}/resources/image/logo.png" style="width:40px;" class="rounded-pill">
			      	<span class="aligh-middle text-white">전자정부 프레임워크 </span>
			    </a>
			    <div>
			    	<%-- <c:if test="${login =='success'}">
			    		<a href="${pageContext.request.contextPath}/ch07/sessionLogout" class="btn btn-outline-success btn-sm text-white">로그아웃</a>
			    	</c:if>
			    	<c:if test="${login!='success'}">
			    		<a href="${pageContext.request.contextPath}/ch07/sessionLoginForm" class="btn btn-outline-success btn-sm text-white">로그인</a>
			    	</c:if> --%>
			    	
			    	<sec:authorize access="isAnonymous()">
			    		<a href="${pageContext.request.contextPath}/ch17/loginForm" class="btn btn-outline-success btn-sm text-white">로그인</a>
			    	</sec:authorize>
			    	
			    	<sec:authorize access="isAuthenticated()">
			    		<%--사이트간 요청 위조방지 설정이 비활성화되어 있을 경우 get방식으로 요청 가능--%>
			    		<b class="text-white me-2">
			    			<sec:authentication property="principal.username"/>
			    		</b>
			    		<a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-success btn-sm text-white">로그아웃</a>
			    		
			    		<%--사이트간 요청 위조방지 설정이 활성화시 있을 경우 post 방식으로만 요청 가능--%>
			    	<%-- 	<form method="POST" action="${pageContext.request.contextPath}/logout">
			    			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
			    			<button type="submit" class=btn btn-outline-info bts-sm">로그아웃</button>
			    		</form> --%>
			    	</sec:authorize>
			    </div>
			  </div>
			</nav>
		</header>
	</body>
</html>