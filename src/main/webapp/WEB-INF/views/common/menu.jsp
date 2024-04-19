<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button
					class="accordion-button ${chNum == 'ch01' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseOne" aria-expanded="true"
					aria-controls="collapseOne">Ch01.개발환경구축</button>
			</h2>
			<div id="collapseOne"
				class="accordion-collapse collapse ${chNum == 'ch01' ? 'show' : ''}"
				aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch01/content?chNum=ch01">content</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTwo">
				<button
					class="accordion-button ${chNum == 'ch02' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseTwo" aria-expanded="flase"
					aria-controls="collapseTwo">Ch02.요청 매핑</button>
			</h2>
			<div id="collapseTwo"
				class="accordion-collapse collapse ${chNum == 'ch02' ? 'show' : ''}"
				aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch02/getMethod?chNum=ch02">GET
								method</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/postMethod?chNum=ch02">POST
								method</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/modelAndView?chNum=ch02">Model
								And View</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/voidReturn?chNum=ch02">Void
								Return</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/objectreturn?chNum=ch02">Object
								Return</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/freeAuth?chNum=ch02">Free
								Auth</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch02/onlyAuth?chNum=ch02">Only
								Auth</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingThree">
				<button
					class="accordion-button ${chNum == 'ch03' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseThree" aria-expanded="false"
					aria-controls="collapseThree">Ch03. 요청 매핑 메소드의 매개변수</button>
			</h2>
			<div id="collapseThree"
				class="accordion-collapse collapse ${chNum == 'ch03' ? 'show' : ''}"
				aria-labelledby="headingThree" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch03/receiveData?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15&chNum=ch03">Get
								data by Get method</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/postMethodForm">Get
								data by Post method</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/requestParamAnnotaion?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15">@RequestParam</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/requestParamAnnotaionRequired?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15">@RequestParam
								required</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/requestParamAnnotaionDefaultValue?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15">@RequestParam
								DefaultValue</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/typeChange?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15">Type
								Change</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch03/getDto?param1=string&param2=5&param3=3.14&param4=true&param5=2024-4-15">Get
								Dto</a></li>
						<li><a href="${pageContext.request.contextPath}/ch03/ajax">Ajax</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingFour">
				<button
					class="accordion-button ${chNum == 'ch04' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseFour" aria-expanded="false"
					aria-controls="collapseFour">Ch04. 유효성 검사</button>
			</h2>
			<div id="collapseFour"
				class="accordion-collapse collapse ${chNum == 'ch04' ? 'show' : ''}"
				aria-labelledby="headingFour" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch04/loginForm">로그인</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch04/signupForm">회원가입</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingFive">
				<button
					class="accordion-button ${chNum == 'ch05' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseFive" aria-expanded="false"
					aria-controls="collapseFive">Ch05. 요청 헤더값 및 쿠키 사용</button>
			</h2>
			<div id="collapseFive"
				class="accordion-collapse collapse ${chNum == 'ch05' ? 'show' : ''}"
				aria-labelledby="headingFive" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a href="${pageContext.request.contextPath}/ch05/header">헤더값
								얻기</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch05/createCookie">쿠키
								생성 및 응답HTTP에 포함시키기</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch05/readCookie">요청HTTP에서
								쿠키값 얻기</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingSix">
				<button
					class="accordion-button ${chNum == 'ch06' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseSix" aria-expanded="false"
					aria-controls="collapseSix">Ch06. 포워드와 리다이렉트</button>
			</h2>
			<div id="collapseSix"
				class="accordion-collapse collapse ${chNum == 'ch06' ? 'show' : ''}"
				aria-labelledby="headingSix" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a href="${pageContext.request.contextPath}/ch06/forward">포워드와
								request 범위 데이터</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch06/redirect">리다이렉트와
								session 범위 데이터</a></li>
						<li><a href="${pageContext.request.contextPath}/ch06/session">session
								범위 데이터</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingSeven">
				<button
					class="accordion-button ${chNum == 'ch07' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseSeven" aria-expanded="false"
					aria-controls="collapseSeven">Ch07. 데이터 전달</button>
			</h2>
			<div id="collapseSeven"
				class="accordion-collapse collapse ${chNum == 'ch07' ? 'show' : ''}"
				aria-labelledby="headingSeven" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch07/request1">ModelAndView:
								request</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch07/request2">DTO:request</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch07/sessionLoginForm">HttpSession:
								session</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch07/application">ServletContext:
								application</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingEight">
				<button
					class="accordion-button ${chNum == 'ch08' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseEight" aria-expanded="false"
					aria-controls="collapseEight">Ch08. 세션 지원</button>
			</h2>
			<div id="collapseEight"
				class="accordion-collapse collapse ${chNum == 'ch08' ? 'show' : ''}"
				aria-labelledby="headingEight" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch08/productList">상품
								목록</a></li>
						<li><a href="${pageContext.request.contextPath}/ch08/cart">장바구니</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingNine">
				<button
					class="accordion-button ${chNum == 'ch09' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseNine" aria-expanded="false"
					aria-controls="collapseNine">Ch09. 파일 업로드와 다운로드</button>
			</h2>
			<div id="collapseNine"
				class="accordion-collapse collapse ${chNum == 'ch09' ? 'show' : ''}"
				aria-labelledby="headingNine" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch09/fileUploadForm">파일
								업로드</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch09/downloadFileList">파일
								다운로드</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingTen">
				<button
					class="accordion-button ${chNum == 'ch10' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseTen" aria-expanded="false"
					aria-controls="collapseTen">Ch10. 에외 처리</button>
			</h2>
			<div id="collapseTen"
				class="accordion-collapse collapse ${chNum == 'ch10' ? 'show' : ''}"
				aria-labelledby="headingTen" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch10/handlingException1">try-catch
								이용</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch10/handlingException2">@ControllerAdvice
								이용 널 처리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch10/handlingException3">커스텀
								에외처리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch10/handlingException4">공용
								예외 처리</a></li>
						<li><a
							href="${pageContext.request.contextPath}/ch10/handlingException5">404
								에러 처리</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="accordion-item">
			<h2 class="accordion-header" id="headingEleven">
				<button
					class="accordion-button ${chNum == 'ch11' ? '' : 'collapsed'}"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#collapseEleven" aria-expanded="false"
					aria-controls="collapseEleven">Ch11. 국제화(x)</button>
			</h2>
			<div id="collapseEleven"
				class="accordion-collapse collapse ${chNum == 'ch11' ? 'show' : ''}"
				aria-labelledby="headingEleven" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<ul>
						<li><a
							href="${pageContext.request.contextPath}/ch11/no">국제화</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>