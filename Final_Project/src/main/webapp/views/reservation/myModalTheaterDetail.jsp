<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/resources/modal/modalTheaterDetail.css">

</head>
<body>
		<!-- The Modal -->
		<div id="myModalTheaterDetail" class="myModalTheaterDetail">
			<!-- Modal content -->
			<div class="myModalTheaterDetail-content">
				<span id="myModalTheaterDetail-close">&times;</span>
				<div class="container" style="margin-top: 50px;">
					<div class="row">
						<div class="col-lg-12">
							<h2 id="myModalTheaterDetail-name" class="pg-service-title"><%-- ${theaterVO.name } --%></h2>
						</div>
						<div class="col-lg-7">
							<div class="pg-service-thumbs"  id="myModalTheaterDetail-img1">
								<%-- <img src="<%=TheaterIMGPath %>/${theaterVO.img1 }" alt="service thumb" style="width: 500px; height: 650px"> --%>
							</div>
						</div>
						<div class="col-lg-5">
							<div class="pg-service-details">
								<div class="small-title">
									<h4>극장소개</h4>
								</div>
								<p id="myModalTheaterDetail-contents"><%-- ${theaterVO.content } --%></p>
							</div>
							<div class="pg-service-description">
								<div class="small-title">
									<h4>상세정보</h4>
								</div>
								<ul>
									<li>전화번호 : <span id="myModalTheaterDetail-phone"><%-- ${theaterVO.phone } --%></span>
									</li>
									<li>주소 : <span id="myModalTheaterDetail-adress"><%-- ${theaterVO.adress } --%></span>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="container related-services">
						<div class="row">
							<div class="col-lg-12">
								<div class="small-title">
									<h4>상세사진</h4>
								</div>
							</div>
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="myModalTheaterDetail-img2">
										<%-- <img src="<%=TheaterIMGPath %>/${theaterVO.img2 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
	
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="myModalTheaterDetail-img3">
										<%-- <img src="<%=TheaterIMGPath %>/${theaterVO.img3 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
						</div>
					</div>
					<div class="container related-services">
						<div class="row">
							<div class="col-lg-12">
								<div class="small-title">
									<h4>지역맛집</h4>
								</div>
							</div>
							<!-- Signle Service -->
							<div class="col-lg-4 col-md-6 col-12">
								<div class="service service-style-4 text-center">
									<div class="service-image" id="myModalTheaterDetail-img4">
										<%-- <img src="<%=TheaterIMGPath %>/${theaterVO.img4 }"
											alt="service thumb"> --%>
									</div>
								</div>
							</div>
							<!--// Signle Service -->
						</div>
					</div>
				<!-- *************************************************************************** -->
				</div>
			</div>
		</div>

		<script src="/resources/modal/modalTheaterDetail.js"></script>
</body>
</html>