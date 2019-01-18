<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/assets";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Responsive Admin Dashboard Template">
<meta name="keywords" content="admin,dashboard">
<meta name="author" content="skcats">
<!-- The above 6 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>OBFINAL - 관리자 페이지</title>

<!-- Styles -->
<link href="https://fonts.googleapis.com/css?family=Ubuntu"
	rel="stylesheet">
<link href="<%=KPath%>/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=KPath%>/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="<%=KPath%>/plugins/icomoon/style.css" rel="stylesheet">
<link href="<%=KPath%>/plugins/uniform/css/default.css" rel="stylesheet" />
<link href="<%=KPath%>/plugins/switchery/switchery.min.css"
	rel="stylesheet" />
<link href="<%=KPath%>/plugins/nvd3/nv.d3.min.css" rel="stylesheet">

<!-- Theme Styles -->
<link href="<%=KPath%>/css/ecaps.min.css" rel="stylesheet">
<link href="<%=KPath%>/css/custom.css" rel="stylesheet">

</head>
<body>

	<!-- Page Container -->
	<div class="page-container">

		<!-- Header 시작 -->
		<jsp:include page="admin_Header.jsp"></jsp:include>
		<!-- //Header 끝 -->

		<!-- Page Content -->
		<div class="page-content">
			<!-- Page Header -->

			<!-- Page Inner -->
			<div class="page-inner">
				<div class="page-title">
					<h3 class="breadcrumb-header">영화 등록</h3>
				</div>
				<div id="main-wrapper">
					<div class="row">
						<div id="container">
							<!-- MovieVO 내용 -->
							<!--  m_id title gnr director runningtime restrict onair poster img1 img2
		img3 img4 img5  -->
							<!-- 영화 인덱스 영화제목 장르 감독 상영시간 제한 현재상영중(01) 포스터이미지 영화 관련img1 영화
		관련img2 영화 관련img3 영화 관련img4 영화 관련img5 -->
							<hr>
							<form action="admin_insertMovie.do" method="post"
								enctype="multipart/form-data" class="form-horizontal">
								<table>
									<tr>
										<th width="80">영화 제목</th>


										<td><input type="text" name="title"
											class="form-control input-rounded"></td>

									</tr>
									<tr>
										<th>내용</th>
										<td><textarea name="content" rows="10" cols="40"
												class="form-control input-rounded"></textarea></td>
									</tr>
									<tr>
										<th>장르</th>
										<td><input type="text" name="gnr"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>감독</th>
										<td><input type="text" name="director"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>상영시간</th>
										<td><input type="text" name="runningtime"
											class="form-control input-rounded"></td>
									</tr>
									<!--  m_id title gnr director runningtime restrict onair poster img1 img2
		img3 img4 img5  -->
									<tr>
										<th>제한</th>
										<td><select name="restrict" class="form-control">
												<option value="전체 이용가">전체 관람가
												<option value="12세 관람가">12세 관람가
												<option value="15세 관람가">15세 관람가
												<option value="청소년 관람불가">청소년 관람불가
										</select></td>
									</tr>
									<tr>
										<th>상영중</th>
										<td><select name="onair" class="form-control">
										
												<option value="-1">상영예정
												<option value="0">상영종료
												<option value="1">상영중
										</select></td>
									</tr>
									<tr>
										<th>포스터</th>
										<td><input type="file" name="poster_file"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>이미지1</th>
										<td><input type="file" name="img1_file"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>이미지2</th>
										<td><input type="file" name="img2_file"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>이미지3</th>
										<td><input type="file" name="img3_file"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>이미지4</th>
										<td><input type="file" name="img4_file"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>이미지5</th>
										<td><input type="file" name="img5_file"
											class="form-control input-rounded"></td>
									</tr>

									<tr>

										<td colspan="2" style="text-align: center;"><input
											type="submit" value="영화 등록"
											class="btn btn-success btn-download"></td>
									</tr>
								</table>
							</form>
							<p>
							
							</p>
						</div>

					</div>
					<!-- Row -->
				</div>
				<!-- Main Wrapper -->

			</div>
			<!-- /Page Inner -->


		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->


	<!-- Javascripts -->
	<script src="<%=KPath%>/plugins/jquery/jquery-3.1.0.min.js"></script>
	<script src="<%=KPath%>/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="<%=KPath%>/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script
		src="<%=KPath%>/plugins/uniform/js/jquery.uniform.standalone.js"></script>
	<script src="<%=KPath%>/plugins/switchery/switchery.min.js"></script>
	<script src="<%=KPath%>/plugins/d3/d3.min.js"></script>
	<script src="<%=KPath%>/plugins/nvd3/nv.d3.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.time.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.symbol.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.tooltip.min.js"></script>
	<script src="<%=KPath%>/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="<%=KPath%>/plugins/chartjs/chart.min.js"></script>
	<script src="<%=KPath%>/js/ecaps.min.js"></script>
	<script src="<%=KPath%>/js/pages/dashboard.js"></script>
</body>
</html>