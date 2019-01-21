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
	<footer id="footer" class="footer-area">
		<!-- Footer Bottom Area -->
		<div class="footer-bottom-area bg-dark">
			<div class="container">
				<div class="row">
					<div class="col-lg-8">
						<ul class="footer-social">
							<li><a href="https://www.facebook.com/">Facebook</a></li>
							<li><a href="https://twitter.com/">Twitter</a></li>
							<li><a href="https://plus.google.com/">Google+</a></li>
							<li><a href="https://www.linkedin.com/">Linkedin</a></li>
							<li><a href="https://www.behance.net/">Behance</a></li>
						</ul>
					</div>
					<div class="col-lg-4">
						<p class="footer-copyright">
							Copyright &copy; <a href="#">Themes-Hub</a> 2018. All Right
							Reserved
						</p>
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