<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
	String MovieIMGPath = contextPath + "/resources/movieimg";
	String IMGPath = contextPath + "/resources/img";
%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>현재 상영작</title>

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

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		<!-- Page Content -->
		<main class="page-content" style="margin-top: 146px;"> <!-- Portfolio Area -->
		<section class="portfolio-area bg-grey">
			<div class="row"  style="background-image: url('/resources/img/headImg/onairsign.jpg'); background-repeat: no-repeat; background-size: cover; height: 400px; width: 100%; margin: 0 0 10px 0; padding: 0;">
			<div style="margin:0; padding:0; width:100%; height: 100%; background-color:rgba(0,0,0,0.6); text-align: center;">
				<div class="row">
					<div
						class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-12 offset-0">
						<div class="section-title text-center" style="margin: 0; padding: 0; ">
							<h2 style="margin: 150px auto; font-size:60px; color:#f1f1f1; position:relative;">현재 상영작</h2>
						</div>
					</div>
				</div>
			</div>
			</div>
			
			<div class="container">

			<div class="portfolio-wrap">
				<!-- Poftfolio Filters -->
				<div class="portfolio-filters" style="float: left;">
					<span><button class="is-checked" data-filter="*">ALL</button></span>
					<c:forEach var="gnridx" items="${gnrList}">
						<span><button data-filter=".pfolio-filter-${gnridx.gnr }">${gnridx.gnr}</button></span>
					</c:forEach>
				</div>
				<!--// Poftfolio Filters -->


					<!-- Portfolios -->
					<div class="row no-gutters portfolios portfolios-style-1"
						style="height: 900px; width: 700px; position: relative;left: 170px;" data-show="9" data-load="6">

						<c:forEach var="movieidx" items="${movieList}">
							<c:if test="${not empty movieidx.poster}">

								<!-- Single Portfolio -->
								<div
									class="col-xl-4 col-lg-6 col-md-6 col-12 portfolio-single pfolio-filter-now pfolio-filter-${movieidx.gnr}">
									<div class="portfolio">
										<div class="portfoilo-thumb">
											<img src="<%=MovieIMGPath %>/${movieidx.poster}"
												alt="${moiceidx.title}" style="height: 300px;">
										</div>
										<div class="portfolio-content" style="opacity: 0.9;">
											<div class="portfolio-content-inner text-center">
												<h6>${movieidx.title}</h6>
												<hr style="background-color: #ce2c3c; height: 3px;">
												<h3>		
													<a href="<%=contextPath%>/movieDetail.do?m_id=${movieidx.m_id}"><img alt="영화정보"
														src="<%=IMGPath%>/영화정보.png"></a>
														<a href="#" onclick="res(${movieidx.m_id })">
														<img alt="예매하기" src="<%=IMGPath%>/예매.png">
														</a>
												</h3>
											</div>
										</div>
									</div>
								</div>
								<!--// Single Portfolio -->
							</c:if>
						</c:forEach>


					</div>
					<!--// Portfolios -->







				<div class="portfolio-load-more-button text-center">
					<button class="load-more-toggle cr-btn cr-btn" style="width: 150px;" >
						<span>더 보기</span>
					</button>
				</div>
			</div>
			</div>


		</section>
		<!--// Portfolio Area --> </main>
		<!--// Page Content -->

		<!-- //메인 끝 -->

		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->
		
		
	<script>
	function idChk(){
// 		alert("idChk실행 - Logininformaion : " + "${Logininformaion}");
		if("${Logininformaion}" != null) {
			return 1;
		} else {
			return 0;
		}
	}
	 function res(m_id){
// 		 alert("m_id : " + m_id);
// 	 	console.log("${Logininformation}");
// 	 	alert("${Logininformation}");
// 	 	alert("${Logininformation.u_id}");
	 	
	 	var u_id = "${Logininformation.u_id}";
	 	if(u_id != ""){
// 	 		alert("아이디있음");
	  		location.href="movieRes.do?m_id=" + m_id;
	  	} else {
// 	  		alert("아이디없음");
	  		modal.style.display = "block";
		} 
	}
	</script>
</body>

</html>