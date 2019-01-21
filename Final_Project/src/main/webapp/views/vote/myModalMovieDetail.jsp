<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/resources/modal/modalMovieDetail.css">

</head>
<body>
		<!-- The Modal -->
		<div id="myModalMovieDetail" class="myModalMovieDetail">
			<!-- Modal content -->
			<div class="myModalMovieDetail-content">
				<span id="myModalMovieDetail-close">&times;</span>
				<div class="container" style="margin-top: 50px;">
					<div class="row">
						<div class="col-lg-12">
							<h2 id="movieDetailModal-title" class="pg-service-title"><%-- ${movieOne.title } --%></h2>
						</div>
						<div class="col-lg-6">
							<div class="pg-service-thumbs" id="movieDetailModal-poster" >
								<%-- <img src="/resources/movieimg/${movieOne.poster }" alt="service thumb" style="width: 500px; height: 650px"> --%>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="pg-service-details">
								<div class="small-title">
									<h4>작품소개</h4>
								</div>
								<p id="movieDetailModal-content" ><%-- ${movieOne.content } --%></p>
							</div>
							<div class="pg-service-description">
								<div class="small-title">
									<h4>상세정보</h4>
								</div>
								<ul>
									<li>감독 : <span id="movieDetailModal-director" ><%-- ${movieOne.director } --%></span>
									</li>
									<li>장르 : <span id="movieDetailModal-gnr" ><%-- ${movieOne.gnr } --%></span>
									</li>
									<li>상영시간 : <span id="movieDetailModal-runningtime" > <%-- ${movieOne.runningtime } --%> </span>
									</li>
									<li>등급 : <span id="movieDetailModal-restrict" > <%-- ${movieOne.restrict } --%> </span>
									</li>
								</ul>
								<div>			
	<%-- 								<a href="#" onclick="res(${movieOne.m_id })" class="cr-btn cr-btn-sm"  --%>
	<!-- 								style="background-color: #f6644f; float: right">예매</a> -->
								</div>
							</div>
						</div>
					</div>
					<div class="container related-services">
						<div class="row">
							<div class="col-lg-12">
								<div class="small-title">
									<h4>스틸컷</h4>
								</div>
							</div>
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="movieDetailModal-img1" >
										<%-- <img src="/resources/img/${movieOne.img1 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
	
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="movieDetailModal-img2" >
										<%-- <img src="/resources/img/${movieOne.img2 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
	
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="movieDetailModal-img3" >
										<%-- <img src="/resources/img/${movieOne.img3 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="/resources/modal/modalMovieDetail.js"></script>
</body>
</html>