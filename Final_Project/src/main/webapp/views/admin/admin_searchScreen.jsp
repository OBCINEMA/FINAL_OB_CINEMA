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
					<h3 class="breadcrumb-header">상영관 조회</h3>
				</div>
				<div id="main-wrapper">
					<div class="row"></div>
					<!-- Row -->
				</div>
				<!-- Main Wrapper -->



				<div class="panel panel-white">
					<div class="panel-heading clearfix">
						<h4 class="panel-title">극장별 상영관 조회</h4>
					</div>
					<div class="panel-body" style="height: 500px;">
						<div class="tabs-left" role="tabpanel">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist" style="height: 500px;">
								<li role="presentation" class="active"><a href="#기본"
									role="tab" data-toggle="tab">[극장이름]</a></li>
								<c:forEach items="${theaterList}" var="theater">
									<li role="presentation"><a href="#tab${theater.t_id}"
										role="tab" data-toggle="tab">${theater.name }</a></li>
								</c:forEach>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active fade in" id="기본">
									<p>극장별 상영관 수를 볼 수 있습니다.</p>
								</div>
								<c:forEach items="${theaterList}" var="theater">
									<div role="tabpanel" class="tab-pane fade"
										id="tab${theater.t_id}">
										${theater.name}
										<hr>
										<c:forEach var="screen" items="${screenList}">
											<c:if test="${theater.t_id eq screen.t_id}">
                                                    ${screen.scr_name}   
															<table border="1px">
													<thead>
														<tr>
															<th width="10%">상영관 ID</th>
															<th width="20%">상영관 행</th>
															<th width="20%">상영관 열</th>
															<th width="20%">총 좌석수</th>
															<th>비고</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${screen.scr_id}</td>
															<td>${screen.scr_seat_row}</td>
															<td>${screen.scr_seat_col}</td>
															<td>${screen.scr_seat_tot}</td>
															<td>
																<div>
																	<input type="button" value="수정"
																		onclick="updateGO(${screen.scr_id} ,${theater.t_id})">
																</div> <input type="button" value="삭제"
																onclick="deleteGO(${screen.scr_id })">
															</td>
														</tr>
													</tbody>
												</table>



											</c:if>

										</c:forEach>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /Page Inner -->

		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->
	
	<!-- 페이지가 로딩될때 먼저 실행되는 곳  -->
	<script>
	$(document).ready(function(){
		var result = "${result}";
		if(result == "delete"){
			alert(" 정상 삭제되었습니다.");
		}
		if(result =="update"){
			alert(" 정상 수정되었습니다.");
		}
		

	});
	
	</script>
	
	<!-- 수정 버튼 눌렀을때 -->
	<script>
	function updateGO(scr_id , t_id){
		alert("scr_id = "+scr_id);
		alert("t_id = "+t_id);
		var check = confirm("수정 페이지로 이동합니다.");
		if(check== true){
			location.href="<%=contextPath%>/admin_updateScreen.do?scr_id="+scr_id+"&t_id="+t_id;

		}else if(check == false){
			return check;
		}
		
		
		
	}
	</script>
	<!-- 끝 -->
	
	<!-- 상영관 삭제 스크립트 -->
	<script>
	function deleteGO(scr_id){
		var check = confirm("정말 삭제하시겠습니까?");
		if(check== true){
			location.href="/admin_deleteScreen.do?scr_id="+scr_id;
		}else if(check == false){
			return check;
		}
		
		
	}
	</script>
<!-- 상영관 삭제 스크립트 -->

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