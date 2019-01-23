<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
</head>
<body>
	<!-- Footer Area -->
	<footer id="footer" class="footer-area" >
		<!-- Footer Bottom Area -->
		<div class="footer-bottom-area bg-dark" style="padding-top: 1px; padding-bottom: 1px;">
			<div class="container">
				<div class="row" style="font-size: small;">
					<div class="logo">
						<a href="/mainGO.do">
						<img src="/views/logo/로고1.png" alt="logo secondary dark" style="height: 100px; width: 150px;">
						</a>
					</div>
					<div style="margin-left: 100px;">
						(주)영화사 RETRO CINEMA (03760) 서울 마포구 백범로 23 구프라자 3층 RETRO CINEMA<br>
						TEL: 02-363-5333  |  FAX: 02-747-7785<br>
						대표자명: 임선기  |  사업자등록번호: 101-81-39786<br>
						
					</div>
				</div>
			</div>
		</div>
		<!--// Footer Bottom Area -->
	</footer>
	<!-- //Footer Area -->


	<!-- JS Files -->
	<script src="<%=KPath%>/js/popper.min.js"></script>
	<script src="<%=KPath%>/js/bootstrap.min.js"></script>
	<script src="<%=KPath%>/js/plugins.js"></script>
	<script src="<%=KPath%>/js/active.js"></script>
	<script src="<%=KPath%>/js/scripts.js"></script>
</body>

</html>