<%@page import="java.util.List"%>
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
#container {
	width: 700px;
	margin: 0 auto;
}

/* h1, h3 {
	text-align: center;
} */
table {
	border-collapse: collapse;
}

/* table, th, td {
	border: 1px solid black;
	margin: 0 auto;
} */

/* th {
	background-color: orange;
} */
.center {
	text-align: center;
}

.border-none, .border-none td {
	border: none;
}

.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid none;
	font-weight: bold;
	color: #f1f1f1;
}

.paging li a:hover {
/* 	background-color: #f1f1f1; */
	color: #ce2c3c;
}

.paging .disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
	border: 1px solid none;
/* 	background-color: #252525; */
	color: #ce2c3c;
	font-weight: bold;
}

.table {
	border-collapse: collapse;
}

.table tr{
	border-collapse: collapse;
}

.table th{
	background-color: #4f4f4f;
}

.table td{
	background-color: #303030;
	border-collapse: collapse;
}

.row > .row {
 	margin: auto;
 	width: 900px;
 	height: 550px;
	padding: 50px;
	margin: 20px auto 40px;
}

.paging {
	width: 30%;
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
			style="padding: 0;">
			<div class="row">
				<div class="row">
					<!-- ///////////////////////////////// 여기부터 채우면됨 -->
					<form action="getNoticeList.do" method="GET">
						<%-- <input type="hidden" name="id" value="${Logininformation.id }"> --%>
						<input type="hidden" name="cPage" value="${pvo.nowPage }">
						<h2 class="center" style="margin-bottom: 50px; color: #f1f1f1;">공지사항</h2>
						<table class="table table-hover" style="color: #f1f1f1;">
							<thead>
								<tr>
									<th class="center" width="100" style="font-size: 18px;">NO</th>
									<th class="center" width="250" style="font-size: 18px;">제목</th>
									<th class="center" width="150" style="font-size: 18px;">작성자</th>
									<th class="center" width="150" style="font-size: 18px;">날짜</th>
									<th class="center" width="100" style="font-size: 18px;">조회수</th>
								</tr>
							</thead>
							<c:choose>
								<c:when test="${empty list }">
									<tr>
										<td colspan="5"><h1>작성된 글이 없습니다.</h1></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="noticeList" items="${list }">
										<tr>
											<td class="center" style="font-size: 15px;">${noticeList.b_id }</td>
											<td class="center" style="font-size: 15px; text-align: left;"><a
												href="getNotice.do?b_id=${noticeList.b_id }&cPage=${pvo.nowPage}">
													${noticeList.title }</a></td>
											<td class="center" style="font-size: 15px;">${noticeList.name }</td>
											<td class="center" style="font-size: 15px;">${noticeList.regdate }</td>
											<td class="center" style="font-size: 15px;">${noticeList.hit }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<div class="row">
						<div style="margin:auto;">
							<ol class="paging" >
								<c:forEach var="k" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:choose>
										<c:when test="${k == pvo.nowPage }">
											<li class="now" style="font-size: 20px;">${k }</li>
										</c:when>
										<c:otherwise>
											<li><a href="getNoticeList.do?b_type=0&cPage=${k }">${k }</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ol>
							<div style="width: 150px; margin-left: 375px; margin-top: 15px;">
								<c:if test="${Logininformation.id == 'admin'}">
									<button class="btn btn-danger" type="button"
										onclick="javascript:location.href='/views/notice/insertNotice.jsp'">작성</button>
									<!-- <input type="button" value="글쓰기"
										onclick="javascript:location.href='/views/notice/insertNotice.jsp'"> -->
								</c:if>
								<c:if test="${Logininformation.id != 'admin'}">
								</c:if>
							</div>
						</div>
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
</body>

</html>