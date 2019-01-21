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
<link rel="stylesheet"
	href="<%=contextPath%>/resources/addcss/login_main.css">

<!-- 이거말고 다른 jQuery는 지울것. 각 페이지의 JavaScript는 Body 하단에 작성할 것-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>
		
		<!-- Header -->
		<header class="header header-style-1 transparent-header sticky-header megamenu-container"
			data-black-overlay="10">

			<div class="container d-none d-lg-block">
				<div class="row">
					<div class="col-lg-12">
						<div class="header-inner">
							<div class="logo">
								<a href="/mainGO.do">
								<img src="/views/logo/로고1.png" alt="logo secondary dark" style="height: 100px; width: 150px;">
								</a>
							</div>
							<nav class="menu">
								<ul>
									<li class="cr-dropdown"><a href="#">영화/예매</a>
										<ul>
											<li><a href="<%=contextPath%>/checkMovieList.do">현재상영작</a></li>
											<li><a href="getMovieListPreair.do">상영예정작</a></li>
											<li><a href="index-marketing-agency.html">상영시간표</a></li>
											<li><a href="index-creative-agency.html">(관람가이드)</a></li>
											<li><a href="/getVoteList.do">보고싶은 명화</a></li>
										</ul></li>
									<li class="cr-dropdown"><a href="about-us.html">극장</a>
										<ul>
											<c:forEach var="i" items="${theaterList}">
											<li><a href="<%=contextPath%>/theaterList.do?t_id=${i.t_id }">${i.name }</a></li>
											</c:forEach>
										</ul></li>

									<li class="cr-dropdown"><a href="about-us.html">즐기기</a>
										<ul>
											<li><a href="about-us-2.html">이벤트</a></li>
											<li><a href="about-us-3.html">영화추천</a></li>
										</ul></li>

									<li class="cr-dropdown"><a href="about-us.html">명예의 전당</a>
										<ul>
											<li><a href="about-us.html">A</a></li>
											<li><a href="about-us-2.html">B</a></li>
											<li><a href="about-us-3.html">C</a></li>
										</ul></li>


									<li class="cr-dropdown"><a href="/getNoticeList.do?b_type=0&cPage=1">고객센터</a>
										<ul>
											<li><a href="/getNoticeList.do?b_type=0&cPage=1">공지사항</a></li>
											<li><a href="contact-us-3.html">뭐쓸까?</a></li>
											<li><a href="contact-us-4.html">모행?</a></li>
										</ul></li>

									<!--   -->
								</ul>
							</nav>
							<c:if test="${empty Logininformation}">
								<button id="myBtn" style="width: auto;" class="cr-btn cr-btn-sm">
									<span>로그인</span>
								</button>
							</c:if>
							<c:if test="${not empty Logininformation}">
							<nav class="menu">
								<ul>
								<li class="cr-dropdown">${Logininformation.name} 님 환영합니다.
									<ul>
										<li><a href="<%=contextPath%>/logOUT.do">로그아웃</a></li>
										<c:if test="${Logininformation.id eq 'admin' }">									
										<li><a href="<%=contextPath%>/admin_Main.do">관리자모드</a></li>
										</c:if>
										<li><a href="mypage.do">마이페이지</a></li>
									</ul>

								</li>
								</ul>
								</nav>
							</c:if>

						</div>
					</div>
				</div>
			</div>

		<!-- 로그인 modal 시작 (login폴더에 login_modal.jsp을 포함시킴)-->
		<jsp:include page="/views/login/login_modal2.jsp"></jsp:include>
		<!-- 로그인 modal 끝 -->
		
		</header>
		<!-- //Header -->
		
</body>

</html>