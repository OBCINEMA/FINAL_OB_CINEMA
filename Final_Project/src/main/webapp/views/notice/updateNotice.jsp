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

<title>공지사항 수정</title>
	
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

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">

</head>

<body>
	<!-- Add your site or application content here -->


	<!-- 메인 영역 -->
	<div class="wrapper" id="wrapper">

		<!-- Header -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header -->

		<!--메인 영역 Content -->
		<main class="page-content" style="margin-top:146px"> <!-- Counter Area --> <!-- 추천 영화 섹션 시작 -->
		<section class="services-area section-padding-lg bg-grey" style="padding:0;">
			<div class="container">
				<div class="row">
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
					<div id="container">
						<h1>글 수정</h1>

						<form action="updateNotice.do" method="post">
							<input type="hidden" name="b_id" value="${notice.b_id }">
							<table>
								<tr>
									<th width="70">제목</th>
									<td><input type="text" name="title"
										value="${notice.title }"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td>${Logininformation.name}</td>
								</tr>
								<tr>
									<th>내용</th>
									<td><textarea id="summernote" name="content" rows="10"
											cols="40">${notice.content }</textarea></td>
								</tr>
								<tr>
									<th>등록일</th>
									<td>${notice.regdate }</td>
								</tr>
								<tr>
									<th>조회수</th>
									<td>${notice.hit }</td>
								</tr>
								<tr>
									<td><input type="submit" value="글 수정"></td>
								</tr>
							</table>
						</form>
						<p>
							<a href="getNoticeList.do?b_type=${notice.b_type }">글목록</a>
						</p>

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

	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js" defer></script>
	<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			  height: 350,
			  toolbar: [
			    ['style', ['bold', 'italic', 'underline', 'clear']],
			    ['fontsize', ['fontsize']],
			    ['color', ['color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['table', ['table']],
			    ['picture', ['picture']],
			    ['fullscreen', ['fullscreen']],
			    ['height', ['height']]
			  ]
			})
	});
	</script>
</body>

</html>