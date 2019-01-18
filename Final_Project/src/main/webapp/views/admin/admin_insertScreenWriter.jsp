<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<h3 class="breadcrumb-header">상영관 등록</h3>
				</div>
				<div id="main-wrapper">
					<div class="row">
						<div id="container">

							<hr>
							<form action="admin_insertScreen.do" method="post"
								class="form-horizontal" onsubmit="return formCheck();"
								name="insertForm">
								<table>
									<tr>
										<th>극장 선택</th>


										<td><c:forEach items="${theaterList}" var="theater">
												<c:if test="${screenOne.t_id eq theater.t_id}">${theater.name}  -> </c:if>
											</c:forEach> <select name="t_id">
												<option value="noselect" selected="selected">::목록::
													<c:forEach items="${theaterList}" var="theater">
														<option value="${theater.t_id}">${theater.name}
													</c:forEach>
										</select></td>

									</tr>
									<tr>
										<th>상영관 이름 작성</th>
										<td><input type="text" name="scr_name"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>상영관 행</th>
										<td><input type="text" name="scr_seat_row"
											class="form-control input-rounded"></td>
									</tr>
									<tr>
										<th>상영관 열</th>
										<td><input type="text" name="scr_seat_col"
											class="form-control input-rounded"></td>
										<td><input type="hidden" name="scr_seat_tot"></td>
									</tr>


									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="submit" value="극장 등록"
											class="btn btn-success btn-download"></td>
									</tr>
								</table>
							</form>
							<p></p>
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


	<!-- form 보내기전 select Box 체크 -->
	<script>
		function formCheck() {
			var f = document.insertForm;
			var regNumber = /^[0-9]*$/;
			if (f.t_id.value == "noselect") {
				alert("극장을 선택해 주세요");
				f.t_id.focus();
				return false;
			}
			if(!regNumber.test(f.scr_seat_row.value)){
				alert("상영관 행 입력은 숫자만 허용합니다.");
				f.scr_seat_row.focus();
				return false;
			}if(!regNumber.test(f.scr_seat_col.value)){
				alert("상영관 열 입력은 숫자만 허용합니다.");
				f.scr_seat_col.focus();
				return false;
			}

			return true;

		}
	</script>
	<!-- form 보내기전 select Box 체크 -->


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