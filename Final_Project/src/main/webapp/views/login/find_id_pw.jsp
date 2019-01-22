<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>ID/PW 찾기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Favicons -->
<link rel="shortcut icon" href="<%=KPath%>/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=KPath%>/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=KPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=KPath%>/css/plugins.css">
<link rel="stylesheet" href="<%=KPath%>/style.css">

<!-- Color Variations -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

<!-- Cusom css -->
<link rel="stylesheet" href="<%=KPath%>/css/custom.css">

<!-- Modernizer js -->
<script src="<%=KPath%>/js/vendor/modernizr-3.5.0.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- ID찾기 ajax 적용  -->
<script>
	function findIDGO(frm) {
		var email = $("#email_1").val();
		var name = $("#name_1").val();
		if (name == '') {
			alert("이름을 입력하세요");
			return false;
		}

		if (email == '') {
			alert('이메일을 입력하세요');
			$("#email_1").focus();
			return false;
		} else {
			var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!emailRegex.test(email)) {
				alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
				$("#email_1").focus();
				return false;
			}
		}
		var commentData = $("form[name=findID]").serialize();

		/* 여기부터 */
		$.ajax({
			url : "/findIDchk.do",
			type : "post",
			data : commentData,
			dataType : "text",
			success : function(result) {
				var okID = result;
				var noID = "notfound";

				if (result == noID) {
					$("#show").css("display", "block");
					$("#nouser").css("display", "none");
					$("#userID").html("일치하는 정보가 없습니다").css("color", "red");

				} else if (result == okID) {
					alert("아이디가 있고");
					$("#userID").html("회원님의 아이디는  : " + result).css("color",
							"white");
					$("#show").css("display", "block");

				}

			}
		});

		/* 여기까지 */
	}

	/* 여기서부턴 비밀번호 찾기 */
	function findPWGO(frm) {
		var email = $("#email_2").val();
		var id = $("#id_2").val();
		if (id == '') {
			alert("ID를 입력하세요");
			return false;
		}

		if (email == '') {
			alert('이메일을 입력하세요');
			$("#email_2").focus();
			return false;
		} else {
			var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!emailRegex.test(email)) {
				alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
				$("#email_2").focus();
				return false;
			}
		}
		var commentData = $("form[name=findPW]").serialize();

		/* 여기부터 */
		$.ajax({
			url : "/findPWchk.do",
			type : "post",
			data : commentData,
			dataType : "text",
			success : function(result) {
				var getMSG = result;
				if (getMSG == "mailsendOk") {
					alert("임시 비밀번호를 Mail로 보내드렸습니다.");
					location.href="/mainGO.do";



				} else if (getMSG == "mailsendNo") {
					$("#nocheck").css("display", "block");
				}

			}

		});

		/* 여기까지 */
	}
</script>


</head>

<body>


	<!-- Add your site or application content here -->


	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		<!-- Page Content -->
		<main class="page-content" style="margin-top: 146px;"> <!-- Service Area -->
		<section id="service-area"
			class="service-area section-padding-lg bg-grey">
			<div class="container" style="margin-top: -100px;">
				<div class="row">

					<div
						class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-12 offset-0 "  style="background-color: #303030;">
						<div class="section-title text-center" >
							<form method="post" name="findID">
								<h6>Id찾기</h6>
								<div class="row no-gutters" >
									<div class="col-md-1">
										<h6 style="margin-bottom: 0px; margin-top: 20px; color: #f1f1f1" >NAME:</h6>
									</div>
									<div class="col-md-3">
										<input type="text" name="name" placeholder="Name" id="name_1" style="background-color: #252525;">
									</div>
									<div class="col-md-1 offset-1" >
										<h6 style="margin-bottom: 0px; margin-top: 20px; color: #f1f1f1">EMAIL:</h6>
									</div>
									<div class="col-md-4 ">
										<input type="text" name="email" placeholder="Email"
											id="email_1" style="background-color: #252525;">
									</div>
									<div class="col-md-2">
										<div class="single-input">
											<button class="cr-btn" type="button"
												onclick="findIDGO(this.form)">
												<span>찾기</span>
											</button>

										</div>
									</div>

								</div>
								<div class="row" id="show" style="display: none;">
									<div class="row no-gutters">
										<div class="col-md-3" id="nouser" style="display: none;"></div>
										<div class="col-md-9" id="userID"></div>
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 68px;">

					<div
						class="col-xl-8 offset-xl-2 col-lg-10 offset-lg-1 col-12 offset-0"  style="background-color: #303030;">
						<div class="section-title text-center">
							<form method="post" name="findPW">
								<h6>Password찾기</h6>
								<div class="row no-gutters">
									<div class="col-md-1 ">
										<h6 style="margin-bottom: 0px; margin-top: 20px; color: #f1f1f1">ID:</h6>
									</div>
									<div class="col-md-3">
										<input type="text" name="id" placeholder="ID" id="id_2" style="background-color: #252525;">
									</div>
									<div class="col-md-1 offset-1">
										<h6 style="margin-bottom: 0px; margin-top: 20px; color: #f1f1f1">EMAIL:</h6>
									</div>
									<div class="col-md-4 ">
										<input type="text" name="email" placeholder="Email"
											id="email_2" style="background-color: #252525;">
									</div>
									<div class="col-md-2">
										<div class="single-input">
											<button class="cr-btn" type="button"
												onclick="findPWGO(this.form)">
												<span>찾기</span>
											</button>
										</div>
									</div>

								</div>
								<div class="col-md-7" id="nocheck"
									style="color: red; display: none">등록정보가 일치하지 않습니다.</div>


							</form>
						</div>
					</div>
				</div>



			</div>
		</section>
		</main>
		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->

	<!-- JS Files -->
	<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
	<script src="<%=KPath%>/js/popper.min.js"></script>
	<script src="<%=KPath%>/js/bootstrap.min.js"></script>
	<script src="<%=KPath%>/js/plugins.js"></script>
	<script src="<%=KPath%>/js/active.js"></script>
	<script src="<%=KPath%>/js/scripts.js"></script>
</body>

</html>