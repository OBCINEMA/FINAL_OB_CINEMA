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

<title>공지사항 입력</title>

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

<!-- include summernote css -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css"
	rel="stylesheet">

<style>
table {
	border-collapse: collapse;
}

#bottom ul li {
	list-style-type: none;
	float: left;
	display: inline;
	overflow: auto;
}

.center {
	text-align: center;
}
</style>

</head>
<body>
	<!-- Add your site or application content here -->

	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		<!--메인 영역 Content -->
		<main class="page-content" style="margin-top:146px;"> <!-- Counter Area -->
		<!-- 추천 영화 섹션 시작 -->
		<section class="services-area section-padding-lg bg-grey"
			style="padding: 0; padding-bottom: 150px; padding-left: 250px;">
			<div class="container"
				style="padding-top: 50px; padding-left: 120px;">
				<div class="row">
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
					<form action="/insertNotice.do?b_type=0" method="POST"
						enctype="multipart/form-data">
						<input type="hidden" name="id" value="${Logininformation.id }">
						<h2 class="center" style="margin-bottom: 50px; color: #f1f1f1;">작성하기</h2>

						<table class="table table-hover"
							style="width: 760px; height: 300px; color: #f1f1f1;">
							<tr>
								<th width="150" style="font-size: 18px;">제목</th>
								<td><input type="text" name="title" size="30"></td>
							</tr>
							<tr>
								<th style="font-size: 18px;">작성자</th>
								<td>${Logininformation.name }</td>
							</tr>
							<tr>
								<th style="font-size: 18px;">내용</th>
								<td><textarea id="summernote" name="content"></textarea></td>
							</tr>
						</table>
						<div id="bottom" class="container"
							style="float: left; margin-left: 170px; padding-left: 130px;">
							<ul>
								<li style="padding-right: 20px;">
									<button class="btn btn-danger" type="submit">등록</button>
								</li>
								<li>
									<button class="btn btn-danger" type="button"
										onclick="location.href = '/getNoticeList.do?b_type=0&cPage=1'">목록</button>
								</li>
							</ul>
						</div>
					</form>

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

	<script>
		$(document)
				.ready(
						function() {
							$('#summernote')
									.summernote(
											{
												height : 350,
												toolbar : [
														[
																'style',
																[
																		'bold',
																		'italic',
																		'underline',
																		'clear' ] ],
														[ 'fontsize',
																[ 'fontsize' ] ],
														[ 'color', [ 'color' ] ],
														[
																'para',
																[ 'ul', 'ol',
																		'paragraph' ] ],
														[ 'table', [ 'table' ] ],
														[ 'picture',
																[ 'picture' ] ],
														[ 'height',
																[ 'height' ] ] ]
											})
						});
	</script>

	<!-- 썸머노트 js -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

</body>

</html>