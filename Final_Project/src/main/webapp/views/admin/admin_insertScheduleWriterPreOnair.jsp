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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- ajax 처리하기 -->
<script>
	$(document).ready(function() {
		$("#t_id").change(function() {
		var t_id = $("select[name=t_id]").val();	
						
		$.ajax({url : '/getScrOne_m.do',
				type : 'post',
				data : {
					't_id' : t_id
					},
					dataType : 'json',
					success : function(result) {
						console.log(result);
						var str = "";
						str += "<select name='scr_id' id='scr_id'>";
						str += "<option value='noselectScreen' selected='selected'>::목록::";
						for (var i = 0; i < result.length; i++) {
							str += "<option value ="+result[i].scr_id+">"
							+ result[i].scr_name}
						str += "</option>"
						str += "</select>";
						$("#screenAdd").html(str);
						for (var i = 0; i < result.length; i++) {
							}
						}
					})
					});
		$("#screenAdd").change(function() {								
			alert("바뀜");
			var t_id = $('#t_id option:selected').val();
			var scr_id = $('#scr_id option:selected').val();
			$.ajax({url : '/getTIME.do',
				type : 'post',
				data : {
					't_id' : t_id,
					'scr_id' : scr_id
					},
					dataType : 'json',
					success : function(result) {
						var jbAry = [ '8', '11', '14','17','20' ];
						for (var i = 0; i < result.length; i++) {
							jbAry.splice(jbAry.indexOf(result[i].time),1);
							/* alert(result[i].time); */
						}
						var str = "";			
						str += "<select name='time' id='time'>"
						str += "<option value='noselectTime' selected='selected'>::목록::"
						for(var i = 0; i<jbAry.length;i++){
							str+= "<option value="+jbAry[i]+">"+jbAry[i]+"시";
							}
						str+="</select>";
						$("#timeAdd").html(str);
						
					}
					
					})			
					});			
		});
</script>
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
					<h3 class="breadcrumb-header">상영정보 등록</h3>
				</div>
				<div id="main-wrapper">
					<div class="row">
						<div id="container">

							<hr>
							<form action="admin_insertSchedulePreonair.do" method="post"
								class="form-horizontal" onsubmit="return formCheck();"
								name="insertForm">
								<table>
									<tr>
										<th>영화 선택</th>


										<td><select name="m_id" id="m_id">
												<option value="noselectMovie" selected="selected">::목록::
													<c:forEach items="${movieList}" var="movie">
														<option value="${movie.m_id}">${movie.title}
													</c:forEach>
										</select><span id="mADD" style="color: red"></span></td>

									</tr>
									<tr>
										<th>극장 선택</th>
										<td><select name="t_id" id="t_id">
												<option value="noselectTheater" selected="selected">::목록::
													<c:forEach items="${theaterList}" var="theater">
														<option value="${theater.t_id}">${theater.name}
													</c:forEach>
										</select><span id="tADD" style="color: red"></span></td>
									</tr>
									<tr>
										<th>상영관 선택</th>
										<td><span id="screenAdd"></span> <span id="sADD"
											style="color: red"></span></td>
									</tr>
									<tr>
										<th>시간 추가</th>
										<td><span id="timeAdd"></span><span id="tiADD" style="color: red"></span></td>
									</tr>
									<tr>
										<th>영화 가격 작성</th>
										<td><input type="text" name="price"
											class="form-control input-rounded"><span id="pADD"
											style="color: red"></span></td>
									</tr>


									<tr>
										<td colspan="2" style="text-align: center;"><input
											type="submit" value="상영정보 등록"
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
			if (f.m_id.value == "noselectMovie") {
				$("#mADD").html("  영화를 선택하세요");
				f.m_id.focus();
				return false;
			}
			if (f.t_id.value == "noselectTheater") {
				$("#tADD").html("  극장을 선택하세요");
				f.t_id.focus();
				return false;
			}
			if (f.scr_id.value == "noselectScreen") {
				alert("상영관을 선택하세요");
				f.scr_id.focus();
				return false;
			}
			if (f.time.value == "noselectTime") {
				$("#tiADD").html("  시간을 선택하세요");
				f.time.focus();
				return false;
			}
			if (f.price.value == "") {
				$("#pADD").html("  가격정보를 입력하세요");
				f.price.focus();
				return false;
			}
			if (!regNumber.test(f.price.value)) {
				alert("가격 입력은 숫자만 허용합니다.");
				f.price.focus();
				return false;
			}

			return true;

		}
	</script>
	<!-- form 보내기전 select Box 체크 -->

	<script>
		$("#m_id").change(function() {
			$("#mADD").html("  선택 완료").css("color", "blue");
		});
		$("#t_id").change(function() {
			$("#tADD").html("  선택 완료").css("color", "blue");
		});
		$("#time").change(function() {
			$("#tiADD").html("  선택 완료").css("color", "blue");
		});
		$("#price").change(function() {
			$("#pADD").html("  선택 완료").css("color", "blue");
		});
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
	<script src="<%=KPath%>/js/ecaps.min.js"></script>
	<script src="<%=KPath%>/js/pages/dashboard.js"></script>
</body>
</html>