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
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>OB 영화관</title>

<!-- Favicons -->
<link rel="shortcut icon" href="<%=KPath%>/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=KPath%>/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=KPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=KPath%>/css/plugins.css">
<link rel="stylesheet" href="<%=KPath%>/style.css">

<!-- Color Variations -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

</head>

<body>
	<!-- Add your site or application content here -->
	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">
		<!-- Header 시작 -->
		<jsp:include page="main-header.jsp"></jsp:include>
		<!-- //Header 끝 -->
		<!-- Features Area -->
				<div class="row justify-content-center services-grid" style="margin-bottom: 0px; margin-top: 146px; background-image: url('/views/logo/메인.jpg'); background-repeat: no-repeat; background-size: cover; height: 500px;">
				<div style="margin:0; padding; background-color:rgba(0,0,0,0.5);">
					<!-- Signle Service -->
						<div class="service text-center" style="color:#ddd; font-size:1.4em; width:65%; margin: 150px auto ; font-weight: bold;">
							<div class="service-icon">
								<span> <img alt="#" src="/views/logo/handshake3.png">
								</span> <span> <img alt="#" src="/views/logo/handshake3.png">
								</span>
							</div>
							<div class="service-content">
								<p>낙후된 시설로 대형 멀티플렉스 영화관에 밀려 지역의 폐물이 된 지역의 오래된 극장들을 모아, 간편하게 예매할 수 있는 UI를 제공하고 이용자들이 원하는 추억의 명화를 배분 상영함으로써 이용자를 유입시켜 되살리는 프로젝트.</p>
							</div>
						</div>
					<!--// Signle Service -->
				</div>
				</div>

		<!--메인 영역 Content -->
		<main class="page-content"> <!-- Counter Area --> <!-- 추천 영화 섹션 시작 -->
		<section class="services-area section-padding-lg bg-grey" style="padding:0;">
			<div class="container">
				<div class="row justify-content-center service-slider-active cr-slider-dots-1">
					<c:forEach var="i" items="${movieListOnair}">
					<!-- Signle Service -->
					<div class="col-lg-4 col-md-6 col-12">
						<div class="service service-style-4 text-center">
							<div class="service-image" >
								<img src="/resources/movieimg/${i.poster }"
									alt="Service Thumb" style="height: 410px;">
							</div>
							<div class="service-content">
								<h5>
									<a href="<%=contextPath%>/movieDetail.do?m_id=${i.m_id }">${i.title }</a>
								</h5>
							</div>
						</div>
					</div>
					</c:forEach>
					
				</div>

			</div>
		</section>
		<!--// Features Area --> </main>
		<!-- //메인 끝 -->
		<section
			class="features-area section-padding-top-xs section-padding-bottom-sm bg-grey">
		<div class="container">
		<div class="row">
		<div class="col">
		<div class="embed-responsive embed-responsive-16by9" style="background-color: black;">
		  <iframe width="764" height="573" src="https://www.youtube.com/embed/86hu4btOvXs?rel=0&autoplay=1&amp;loop=1&mute=1&showinfo=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</div>
		</div>
		</div>
		</div>
		</section>
		<!--메인 영역 Content -->
<!-- 		<main class="page-content" style="margin-top:0px"> Counter Area 추천 영화 섹션 시작 -->
<!-- 		<section class="services-area section-padding-lg bg-grey" style="padding:0;"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row justify-content-center service-slider-active cr-slider-dots-1"> -->
<%-- 					<c:forEach var="i" items="${theaterList}"> --%>
<!-- 					Signle Service -->
<!-- 					<div class="col-lg-4 col-md-6 col-12"> -->
<!-- 						<div class="service service-style-4 text-center"> -->
<!-- 							<div class="service-image" > -->
<%-- 								<img src="/resources/theaterimg/${i.img1 }" --%>
<!-- 									alt="Service Thumb" style="height: 250px;"> -->
<!-- 							</div> -->
<!-- 							<div class="service-content"> -->
<!-- 								<h5> -->
<%-- 									<a href="<%=contextPath%>/theaterList.do?t_id=${i.t_id }">${i.name }</a> --%>
<!-- 								</h5> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 					</c:forEach> --%>
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->
		<!--// Features Area  </main> -->
		<!-- //메인 끝 -->

		<!-- Footer Area -->
		<jsp:include page="main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->
	
	<!-- 추가 : 로그인 modal JS File -->
<%-- 	<script src="<%=contextPath%>/resources/addjs/login.js"></script> --%>
	
</body>

</html>