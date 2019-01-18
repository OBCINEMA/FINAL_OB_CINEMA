<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원가입</title>

<!-- Favicons -->
<link rel="shortcut icon" href="<%=KPath%>/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=KPath%>/images/icon.png">

<!-- Google font (font-family: 'Roboto', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">
<!-- Google font (font-family: 'Roboto Condensed', sans-serif;) -->
<link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700"
	rel="stylesheet">

<!-- Stylesheets -->
<link rel="stylesheet" href="<%=KPath%>/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=KPath%>/css/plugins.css">
<link rel="stylesheet" href="<%=KPath%>/style.css">

<!-- Color Variations -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	
<style>
.row-text {
	display:block;
	margin:0;
	padding:0;
}
</style>

</head>

<body>

	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		
		<!--메인 영역 Content -->
		<main class="page-content" style="margin-top:146px">
		
		<section class="services-area section-padding-lg bg-grey" style="position:relative; margin: 0; padding:0;">
			<!-- Sidebar -->
			<div class="col-lg-3" style="position: fixed; display: inline-block">
				<div class="widgets widgets-leftside" style="margin:0">
				
					<!-- Single Widget -->
					<div class="single-widget widget-categories">
						<h5 class="widget-title">My Page</h5>
						<ul>
							<li>
							<a href="/myReservation.do">예매내역 조회/취소</a>
							</li>
							<li>
							<a href="/updateUsersGo.do">내 정보 수정</a>
							</li>
						</ul>
					</div>
					<!--// Single Widget -->
				
				</div>
			</div>
			<!--// Sidebar -->
			
			<!-- 본문 -->
			<div class="container" style="margin:500 0 0 0">
				<div class="row">
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
					<div class="col-md-6" style="padding: 40px; margin:auto;">
						<div class="pg-contact-form mr-0 mr-lg-3" style="padding:30px">

							<form id="contact-form" name="signupform" method="post">
								<fieldset style="padding: 20px 30px; min-width:500px">
									<legend>내 정보 수정</legend>
									<div class="row-text">아이디</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px; position:relative">
										<h4>${Logininformation.id}</h4>
									</div>
										
									
									<div class="row-text">비밀번호</div> 
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
										<input type="password" name="password" id="password" style="width:65%;">
									</div>
									
									<div class="row-text">비밀번호확인</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
											<input type="password" name="passwordCHK"
												id="passwordCHK" style="width:65%;">
									</div>
									&nbsp;&nbsp;&nbsp;<span id="passwordCHKText" ></span>
									
									<div class="row-text">이름</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
										<input type="text" name="name" placeholder="홍길동"
												id="name" style="width:65%;" value="${Logininformation.name }">
									</div>
									
									<div class="row-text">생년월일</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
											<input type="date" name="birth" id="birth" placeholder="ex)2000-01-01" style="width:65%;"
												 value="${Logininformation.birth}">

									</div>
									
									<div class="row-text">핸드폰</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
											<input type="text" name="phone"
												placeholder="ex)010-0000-0000" id="phone" style="width:65%;"
												 value="${Logininformation.phone}">
									</div>
									
									<div class="row-text">이메일</div>
									<div class="row" style="margin:0 0 5px 0; padding:0 15px;">
											<input type="email" name="email" placeholder="입력해주세요"
												id="email" style="width:65%;"
												 value="${Logininformation.email }">
									</div>

											<input type="hidden" id="u_id" name="u_id" value="${Logininformation.u_id }">
											<input type="hidden" id="grade" name="grade" value="${Logininformation.grade }">
											<input type="hidden" id="id" name="id" value="${Logininformation.id }">
											<input type="hidden" id="votedmovie" name="votedmovie" value="${Logininformation.votedmovie }">
<!-- 								<div class="col-md-4"> -->
									<div class="row" style="margin:0 0 5px 0; padding:0 15px; align-content: right; position:relative; min-height:80px">
										<div style="margin:0; padding:0; position:absolute; right:0; min-height:initial">
										<button class="cr-btn" type="button" id="sendgo" style="width:120px; maring: auto; padding: 10px 5px;" >
											<span>수정완료</span>
										</button>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>

					<!-- ///////////////////////////////// 여기부터 채우면끝 -->

				</div>
			</div>
		</section>

		</main>
		<!-- //메인 끝 -->

		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->

	</div>
	<!-- //Main wrapper -->
	
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script>
	$(function() {
		//비밀번호 체크
		$('#passwordCHK').on('change',function(){
				var str='';
				console.log("$('#password') : " + $('#password').val())
				console.log("$('#passwordCHK') : " + $('#passwordCHK').val())
				if($('#password').val() === $('#passwordCHK').val()){
					str += '<span style="color:blue;"><b>비밀번호 일치</b></span>';
				} else {
					str += '<span style="color:red;"><b>비밀번호 불일치</b></span>';
				}
				$('#passwordCHKText').html(str);
		});
		
		// 회원 정보 수정 처리
		$('#sendgo').click(function(e) {
			e.preventDefault();
			if ($("#password").val() == '') {
				alert('비밀번호를 입력하세요');
				$("#password").focus();
				return false;
			}
			if ($("#passwordCHK").val() == '') {
				alert('비밀번호를 다시 한번 더 입력하세요');
				$("#passwordCHK").focus();
				return false;
			}
			if ($("#password").val() !== $(
					"#passwordCHK").val()) {
				alert('비밀번호를 둘다 동일하게 입력하세요');
				return false;
			}
			if ($("#name").val() == '') {
				alert('이름을 입력해주세요');
				$("#name").focus();
				return false;
			}
			if ($("#birth").val() == '') {
				alert('생년월일을 입력하세요');
				$("#birth").focus();
				return false;
			}
			if ($("#phone").val() == '') {
				alert('휴대폰 번호를 입력하세요');
				$("#phone").focus();
				return false;
			}				
			var email = $('#email').val();
			if (email == '') {
				alert('이메일을 입력하세요');
				$("#email").focus();
				return false;
			} else {
				var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				if (!emailRegex.test(email)) {
					alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
					$("#email").focus();
					return false;
				}
			}
	
			$.ajax({
				url:'/updateUsers.do',
				type:'post',
				data : {u_id: $("#u_id").val(), grade: $("#grade").val(), id: $("#id").val(), password: $("#password").val(), name: $("#name").val(), birth: $("#birth").val(), phone: $("#phone").val(), email: $("#email").val(), votedmovie: $("#votedmovie").val()} ,
				dataType:"text",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success: function(result){
					alert(result);
					if(result == "success"){
						alert("회원 정보가 수정되었습니다.");
						location.replace("mainGO.do");
						return false;
					}
				}
			});
		});
	
	});
	</script>
</body>

</html>