<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/assets";
	String MovieIMGPath = contextPath + "/resources/movieimg";
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

<!-- jquery  -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- jquery  -->

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
					<h3 class="breadcrumb-header">영화 수정페이지</h3>
				</div>
				<div id="main-wrapper">


					<div class="row">
						<form action="admin_modifyMovie.do" method="post"
							enctype="multipart/form-data">
							<div class="col-md-4">

								<!-- ex -->
								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="poster_file" src="<%=MovieIMGPath %>/${movieOne.poster}">
									<input type="file" name="poster_file"
										class="form-control input-rounded changedIMG"
										value="${movieOne.poster}">
								</div>

								<!-- ex끝 -->

								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="img1_file" src="<%=MovieIMGPath %>/${movieOne.img1}">
									<input type="file" name="img1_file"
										class="form-control input-rounded changedIMG"
										value="${movieOne.img1}">
								</div>


								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="img2_file" src="<%=MovieIMGPath %>/${movieOne.img2}">
									<input type="file" name="img2_file"
										class="form-control input-rounded changedIMG"
										value="${movieOne.img2}">
								</div>
								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="img3_file" src="<%=MovieIMGPath %>/${movieOne.img3}">
									<input type="file" name="img3_file" alt="${movieOne.img3}"
										class="form-control input-rounded changedIMG"
										value="${movieOne.img3}">
								</div>
								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="img4_file" src="<%=MovieIMGPath %>/${movieOne.img4}">
									<input type="file" name="img4_file" alt="${movieOne.img4}"
										class="form-control input-rounded changedIMG"
										value="${movieOne.img4}">
								</div>
								<div class="panel panel-white">
									<img class="new_img" style="width: 220px; height: 250px"
										id="img5_file" src="<%=MovieIMGPath %>/${movieOne.img5}">
									<input type="file" name="img5_file" alt="${movieOne.img5}"
										class="form-control input-rounded changedIMG"
										value="${movieOne.img5}">
								</div>


							</div>
							<div class="col-md-5">
								<div class="panel panel-white">
									<label class="control-label">번호</label> <input id="m_id"
										type="text" class="input-large form-control m-b-sm" readonly
										onfocus="this.blur();" value=" ${movieOne.m_id }" name="m_id" />
									<label class="control-label">제목</label> <input id="title"
										type="text" name="title"
										class="input-large form-control m-b-sm"
										value="${movieOne.title }" /> <label class="control-label">장르</label>
									<input id="gnr" type="text" name="gnr"
										class="input-large form-control m-b-sm"
										value="${movieOne.gnr }" /> <label class="control-label">감독</label>
									<input id="director" type="text" name="director"
										class="input-large form-control m-b-sm"
										value="${movieOne.director}" /> <label class="control-label">상영시간</label>
									<input id="runningtime" type="text" name="runningtime"
										class="input-large form-control m-b-sm"
										value="${movieOne.runningtime }" /> <label
										class="control-label">관람제한</label>

									<p class="input-large form-control m-b-sm">
										${movieOne.restrict} -><select name="restrict">

											<option value="${movieOne.restrict}" selected="selected">기본유지

											
											<option value="전체 이용가">전체 관람가
											<option value="12세 관람가">12세 관람가
											<option value="15세 관람가">15세 관람가
											<option value="청소년 관람불가">청소년 관람불가
										</select>
									</p>

									<label class="control-label">상영정보</label>

									<p class="input-large form-control m-b-sm">

										<c:choose>
											<c:when test="${movieOne.onair eq 1}">상영중 -> </c:when>
											<c:when test="${movieOne.onair eq 0}">상영종료 -> </c:when>
											<c:when test="${movieOne.onair eq -1}">상영예정 -> </c:when>
										</c:choose>
										<select name="onair">
											<option value="${movieOne.onair}" selected="selected">기본유지





											<option value="-1">상영예정
											<option value="0">상영종료
											<option value="1">상영중
										</select>
									</p>


									<label class="control-label">투표현황</label> <input id="vote"
										name="vote" type="text"
										class="input-large form-control m-b-sm" readonly
										onfocus="this.blur();" value="${movieOne.vote }" />

								</div>
								<div class="panel panel-white">
									<label class="control-label">내용</label>
									<textarea class="input-large form-control" id="content"
										name="content" rows="10" cols="90">${movieOne.content}</textarea>
								</div>

								<input type="hidden" name="poster" value="${movieOne.poster }" />
								<input type="hidden" name="img1" value="${movieOne.img1 }" />
								<input type="hidden" name="img2" value="${movieOne.img2 }" />
								<input type="hidden" name="img3" value="${movieOne.img3 }" />
								<input type="hidden" name="img4" value="${movieOne.img4 }" />
								<input type="hidden" name="img5" value="${movieOne.img5 }" />


							</div>
							<div class="col-md-2">
								<div class="panel panel-white">
									<input type="submit" value="수정">
								</div>

							</div>

						</form>

					</div>


				</div>
				<!-- Main Wrapper -->

			</div>
			<!-- /Page Inner -->


		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->

	<script>
		$(".changedIMG").change(function() {
			var what = $(this).attr("name");
			readURL(this, what);
		});
		function readURL(input, what) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					var ss = "'" + what + "'";
					$("img[id=" + ss + "]").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>




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