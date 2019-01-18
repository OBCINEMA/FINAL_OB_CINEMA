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
					<h3 class="breadcrumb-header">스크린 수정페이지</h3>
				</div>
				<div id="main-wrapper">


					<div class="row">
						<form action="admin_modifyScreen.do" method="post"
							enctype="multipart/form-data" onsubmit="return formCheck();" name="upateForm">

							<div class="col-md-5">
								<div class="panel panel-white">
									<label class="control-label">스크린 ID</label> <input id="scr_id"
										type="text" class="input-large form-control m-b-sm" readonly
										onfocus="this.blur();" value="${screenOne.scr_id }"
										name="scr_id" /> <label class="control-label">극장변경</label>
									<p class="input-large form-control m-b-sm">

										<c:forEach items="${theaterList}" var="theater">
											<c:if test="${screenOne.t_id eq theater.t_id}">${theater.name}  -> </c:if>
										</c:forEach>
										<select name="t_id">
											<option value="${screenOne.t_id}" selected="selected">기본유지
												<c:forEach items="${theaterList}" var="theater">
													<option value="${theater.t_id}">${theater.name}
												</c:forEach>
										</select>

									</p>


									<label class="control-label">상영관이름</label> <input id="scr_name"
										type="text" name="scr_name" class="input-large form-control m-b-sm"
										value="${screenOne.scr_name}" /> <label class="control-label">상영관
										행</label> <input id="scr_seat_row" type="text" name="scr_seat_row"
										class="input-large form-control m-b-sm"
										value="${screenOne.scr_seat_row}" /> <label
										class="control-label">상영관 열</label> <input id="scr_seat_col"
										type="text" name="scr_seat_col"
										class="input-large form-control m-b-sm"
										value="${screenOne.scr_seat_col}" />
										<input type="hidden" value="${screenOne.scr_seat_tot}" name="scr_seat_tot">
										


								</div>





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
	
		<!-- form 보내기전 체크 -->
	<script>
		function formCheck() {
			var f = document.upateForm;
			var regNumber = /^[0-9]*$/;			
			if(!regNumber.test(f.scr_seat_row.value)){
				alert("상영관 행 입력은 숫자만 변경 가능합니다.");
				f.scr_seat_row.focus();
				return false;
			}if(!regNumber.test(f.scr_seat_col.value)){
				alert("상영관 열 입력은 숫자만 변경 가능합니다.");
				f.scr_seat_col.focus();
				return false;
			}

			return true;

		}
	</script>
	<!-- form 보내기전 체크 -->




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