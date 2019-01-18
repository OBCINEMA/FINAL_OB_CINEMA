<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

<!-- Favicons -->
<link rel="shortcut icon" href="<%=KPath%>/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=KPath%>/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=KPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=KPath%>/css/plugins.css">
<link rel="stylesheet" href="<%=KPath%>/style.css">

<!-- Color Variations -->
<!-- 헤더 로그인 버튼 색상 -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

<!-- Cusom css -->
<link rel="stylesheet" href="<%=KPath%>/css/custom.css">

<!-- Modernizer js -->
<script src="<%=KPath%>/js/vendor/modernizr-3.5.0.min.js"></script>

</head>
<body>
	<!-- Header 시작 -->
	<jsp:include page="../main/main-header.jsp"></jsp:include>
	<!-- //Header 끝 -->
	<div class="container" style="margin-top: 140px;">
<!-- 	<h4>결제방식 </h4> -->
<!-- 	<form action="payTest.do"> -->
<!-- 	<select name="pay_type"> -->
<!-- 		<option value="card">신용카드</option> -->
<!-- 		<option value="phone">핸드폰</option> -->
<!-- 		<option value="Transfer">계좌입금</option> -->
<!-- 	</select> -->
<!-- 	<input type="submit"> -->
<!-- 	</form> -->

	<form action="payTest.do">
		<div class="btn-group" data-toggle="buttons">
			<label class="btn btn-secondary"> <input type="radio"
				name="pay_type" value="card"> 신용카드
			</label> <label class="btn btn-secondary"> <input type="radio"
				name="pay_type" value="phone"> 핸드폰
			</label> <label class="btn btn-secondary"> <input type="radio"
				name="pay_type" value="Transfer"> 계좌입금
			</label>
		</div>
		<input type="submit">
	</form>
	
	</div>
	<!-- Footer Area -->
	<jsp:include page="../main/main-footer.jsp"></jsp:include>
	<!-- //Footer Area -->

	<!-- JS Files -->
	<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
	<script src="<%=KPath%>/js/popper.min.js"></script>
	<script src="<%=KPath%>/js/bootstrap.min.js"></script>
	<script src="<%=KPath%>/js/plugins.js"></script>
	<script src="<%=KPath%>/js/active.js"></script>
	<script src="<%=KPath%>/js/scripts.js"></script>

	<!-- 추가 : 로그인 modal JS File -->
	<script src="<%=contextPath%>/resources/addjs/login.js"></script>

</body>
</html>