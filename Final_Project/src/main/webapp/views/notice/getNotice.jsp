<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";

	String MovieIMGPath = contextPath + "/resources/notice";
%>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>공지사항</title>

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
					<form action="getNotice.do" method="GET">
						<input type="hidden" name="b_id" value="${notice.b_id }">
						<h2 class="center" style="margin-bottom: 50px; color: #f1f1f1;">상세보기</h2>

						<table class="table table-hover"
							style="width: 760px; height: 300px; color: #f1f1f1;">
							<tr>
								<th width="150" style="font-size: 18px;">제목</th>
								<td>${notice.title }</td>
							</tr>
							<tr>
								<th style="font-size: 18px;">작성자</th>
								<td>관리자</td>
							</tr>
							<tr>
								<th style="font-size: 18px;">내용</th>
								<td>${notice.content}</td>
							</tr>
							<tr>
								<th style="font-size: 18px;">등록일</th>
								<td>${notice.regdate }</td>
							</tr>
							<tr>
								<th style="font-size: 18px;">조회수</th>
								<td>${notice.hit }</td>
							</tr>
						</table>
					</form>
					<c:if test="${Logininformation.id == 'admin'}">
						<div id="bottom" class="container"
							style="float: left; margin-left: 100px; padding-left: 130px;">
							<ul>
								<li style="padding-right: 20px;">
									<button class="btn btn-danger" type="button"
										onclick="location.href = 'updateNoticeGo.do?b_id=${notice.b_id }'">수정</button>
								</li>
								<%-- <a href="updateNoticeGo.do?b_id=${notice.b_id }">글수정</a> --%>
								<li>
									<button class="btn btn-danger" type="button"
										onclick="location.href = 'getNoticeList.do?b_type=${notice.b_type }&cPage=${pvo.nowPage }'">목록</button>
								</li>
								<%-- <a href="getNoticeList.do?b_type=${notice.b_type }&cPage=${pvo.nowPage }">글목록</a> --%>
								<li style="padding-left: 20px;">
									<button class="btn btn-danger" type="button"
										onclick="delete_go()">삭제</button>
								</li>
								<!-- <a href="#" onclick="delete_go()">글삭제</a> -->
							</ul>
						</div>
					</c:if>
					<c:if test="${Logininformation.id != 'admin'}">
						<div id="bottom" class="container"
							style="float: left; margin-left: 170px; padding-left: 150px;">
							<ul>
								<li>
									<button class="btn btn-danger" type="button"
										onclick="location.href = 'getNoticeList.do?b_type=${notice.b_type }&cPage=${pvo.nowPage }'">목록</button>
									<%-- <a href="getNoticeList.do?b_type=${notice.b_type }&cPage=${pvo.nowPage }">글목록</a> --%>
								</li>
							</ul>
						</div>
					</c:if>
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
		function delete_go() {
			var deleteOk = confirm("정말 삭제하시겠습니까?");
			if (deleteOk) {
				location.href = "deleteNotice.do?b_type=${notice.b_type }&b_id=${notice.b_id }";
			} else {
				return false;
			}
		}
	</script>

</body>

</html>