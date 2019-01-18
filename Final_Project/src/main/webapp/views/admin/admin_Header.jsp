<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>관리자페이지 해더</title>
</head>
<body>

	<!-- Page Sidebar -->
	<div class="page-sidebar">
		<a class="logo-box" href="<%=contextPath%>/admin_Main.do"> <span>OB관리자</span>

		</a>
		<div class="page-sidebar-inner">
			<div class="page-sidebar-menu">
				<ul class="accordion-menu">
					<li class="active-page"><a
						href="<%=contextPath%>/admin_Main.do"> <i
							class="menu-icon icon-home4"></i><span>Home</span>
					</a></li>
					<!-- 수정중 -->
					<li><a href="javascript:void(0)"> <i
							class="menu-icon icon-flash_on"></i><span>영화</span><i
							class="accordion-icon fa fa-angle-left"></i>
					</a>
						<ul class="sub-menu">
							<li><a href="<%=contextPath%>/admin_searchMovie.do">영화전체조회</a></li>
							<li><a href="<%=contextPath%>/admin_insertMovieWriter.do">영화
									추가</a></li>
						</ul></li>

					<!-- 수정전 -->
					<li><a href="javascript:void(0);"> <i
							class="menu-icon icon-inbox"></i><span>극장</span><i
							class="accordion-icon fa fa-angle-left"></i>
					</a>
						<ul class="sub-menu">
							<li><a href="<%=contextPath%>/admin_searchTheater.do">극장전체조회</a></li>
							<li><a href="<%=contextPath%>/admin_insertTheaterWriter.do">극장정보
									추가</a></li>
						</ul></li>

					<li><a href="javascript:void(0);"> <i
							class="menu-icon icon-layers"></i><span>상영관</span><i
							class="accordion-icon fa fa-angle-left"></i>
					</a>
						<ul class="sub-menu">
							<li><a href="<%=contextPath%>/admin_searchScreen.do"
								class="active">극장별 상영관 조회 </a></li>
							<li><a href="/admin_insertScreenWriter.do">상영관추가</a></li>


						</ul></li>
					<li><a href="javascript:void(0);"> <i
							class="menu-icon icon-code"></i><span>상영정보</span><i
							class="accordion-icon fa fa-angle-left"></i>
					</a>
						<ul class="sub-menu">
							<li><a href="/admin_searchSchedule.do">상영정보 전체조회</a></li>							
							<li><a href="/admin_insertScheduleWriter.do">상영중 영화(상영정보) 추가 </a></li>
							<li><a href="/admin_insertScheduleWriterPreOnair.do">상영예정 영화(상영정보) 추가 </a></li>
						</ul></li>

					<li><a href="/admin_voteRefresh.do"> <i
							class="menu-icon icon-show_chart"></i><span>투표갱신</span>
					</a></li>
				
				<!--  -->
					
					<li class="menu-divider"></li>
					<li><a href="<%=contextPath%>/mainGO.do"> <i
							class="menu-icon icon-help_outline"></i><span>영화관 홈페이지</span>
					</a></li>

				</ul>
			</div>
		</div>
	</div>
	<!-- /Page Sidebar -->

</body>
</html>