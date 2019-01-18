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
					<h3 class="breadcrumb-header">영화 상세정보</h3>
				</div>
				<div id="main-wrapper">


					<div class="row">

						<div class="col-md-4">
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.poster}"
									src="<%=MovieIMGPath %>/${movieOne.poster}">
									<p><label class="control-label">${movieOne.poster}</label></p>
									
							</div>
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.img1}"
									src="<%=MovieIMGPath %>/${movieOne.img1}">
									<label class="control-label">${movieOne.img1}</label>
							</div>
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.img2}"
									src="<%=MovieIMGPath %>/${movieOne.img2}">
									<label class="control-label">${movieOne.img2}</label>
							</div>
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.img3}"
									src="<%=MovieIMGPath %>/${movieOne.img3}">
									<label class="control-label">${movieOne.img3}</label>
							</div>
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.img4}"
									src="<%=MovieIMGPath %>/${movieOne.img4}">
									<label class="control-label">${movieOne.img4}</label>
							</div>
							<div class="panel panel-white">
								<img style="width: 220px; height: 250px"
									alt="${movieOne.img5}"
									src="<%=MovieIMGPath %>/${movieOne.img5}">
									<label class="control-label">${movieOne.img5}</label>
							</div>
							

						</div>
						<div class="col-md-5">
							<div class="panel panel-white">
								<label class="control-label">번호</label> <input id="m_id"
									type="text" class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.m_id }" /> <label
									class="control-label">제목</label> <input id="title" type="text"
									class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.title }" /> <label
									class="control-label">장르</label> <input id="gnr" type="text"
									class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.gnr }" /> <label
									class="control-label">감독</label> <input id="director"
									type="text" class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.director}" /> <label
									class="control-label">상영시간</label> <input id="runningtime"
									type="text" class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.runningtime }" />
									
									 <label
									class="control-label">관람제한</label> <input id="restrict"
									type="text" class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.restrict }" />
									

								<c:set var="test" value="${movieOne.onair}" />
								<c:choose>
									<c:when test="${test eq 1}">
										<c:set var="test2" value="상영중"></c:set>
									</c:when>
									<c:when test="${test eq 0}">
										<c:set var="test2" value="상영종료"></c:set>
									</c:when>
									<c:when test="${test eq -1}">
										<c:set var="test2" value="상영예정"></c:set>
									</c:when>
								</c:choose>
								<label class="control-label">상영정보</label> <input id="onair"
									type="text" class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${test2}" /> <label
									class="control-label">투표현황</label> <input id="vote" type="text"
									class="input-large form-control m-b-sm" readonly
									onfocus="this.blur();" value="${movieOne.vote }" />

							</div>
							<div class="panel panel-white">
								<label class="control-label">내용</label>
								<textarea class="input-large form-control" id="content"
									rows="10" cols="90" readonly onfocus="this.blur();">${movieOne.content}</textarea>
							</div>

						</div>
						<div class="col-md-2">
							<div class="panel panel-white">
								<input type="button" value="수정페이지"  onclick="updateGO(${movieOne.m_id})">
							</div>

						</div>

					</div>


				</div>
				<!-- Main Wrapper -->

			</div>
			<!-- /Page Inner -->


		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->
	
		<!-- 수정 버튼 눌렀을때 -->
	<script>
	function updateGO(m_id){
		var check = confirm("수정 페이지로 이동합니다.");
		if(check== true){
			location.href="<%=contextPath%>/admin_updateMovie.do?m_id="+m_id;
		}else if(check == false){
			return check;
		}
		
		
		
	}
	</script>
	<!-- 끝 -->


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