<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>보고싶은 명화(투표)</title>

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

<!-- 투표페이지 CSS -->
<!-- <link rel="stylesheet" href="/views/vote/voteList.css"> -->

<style>
.disabled {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 100; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}
</style>

</head>
<body>

	<!-- Main wrapper -->
	<div class="wrapper" id="wrapper" style="margin-top : 150px;">
		
		<!-- Header 시작 -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header 끝 -->
			
		<!--메인 영역 Content -->
		<main class="page-content"  style="margin-top:146px;"> 
			<div class="container">
			
				<div class="row" style="margin: 30px;">
					<h1 style="margin:auto; font-size:60px;">보고싶은 명화</h1>
				</div>
				
				<div class="votedmovie" style="display:flex"></div>
				<div class="mListByVote" style="display:flex"></div>
				<div class="mList" style="display:flex"></div>
				
				
				<div class="votedmovie-content" style="width:80%; height:auto; margin:auto; padding:30px; border: 1px solid #999; border-radius:10px;">
					<div class="row" style="margin:0;">
						<h1 style="color:black;">내가 선택한 영화</h1>
					</div>
					<hr>
					<div class="row" style="margin:0;">
						<div class="col-3">
							<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg"
								style="height: inherit">
						</div>
						<div class="col-5">
							<h2 class="votedmovie_title" style="margin:auto;">국가부도의 날</h2>
							<ul style="list-style:none; margin: 5px 0; padding:0 0 0 10px">
							<li><h6 class="votedmovie_gnr">장르 : 로맨스</h6></li>
							<li><h6 class="votedmovie_director">감독 : 누구누구</h6></li>
							<li><h6 class="votedmovie_runningtime">상영시간 : 20000분</h6></li>
							<li><h6 class="votedmovie_restrict"> 제한상영가 : 7세 시청가</h6></li>
							</ul>
							<a href="" style="margin:">영화정보 상세보기</a>
						</div>
						<div class="col-4">
							<span class="votedmovie_vote" style="font-size:50px">43표</span>
						</div>
					</div>
				</div>
				
				<div class="mListByVote-content" style="width:80%; height:auto; margin:auto; padding:30px; border: 1px solid #999; border-radius:10px;">
					<div class="row" style="margin:0;">
						<h1 style="color:black;">득표수 상위 영화 5개</h1>
					</div>
					<hr>
					<div class="row" style="margin:0;">
						<div class="row mListByVote-content-one" style="height:130px; margin:0;">
							<a href="#" style="display:inline">
							<div class="col-3">
								<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg"
									style="width:auto;">
								<span>국가 부도의 날</span>
							</div>
							</a>
							<div class="col-3">
								차트 ----------------------- 123표
							</div>
						</div>
					</div>
					
				</div>
				
				
				
			</div>
		</main>	
		<!--// 메인 영역 Content -->
		
		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->
			
	</div>
	<!--// Main wrapper -->

	<script>
	$(function(){
		getVoteList();
	// 	document.getElementsByTagname("jsp:include")[1].setAttribute("page","/views/vote/login_modal_vote.jsp");
	})
	
	function getVoteList(){
	// 	alert('getVoteList.jsp 페이지 로딩완료');
		$.ajax({
			url:'/voteRefresh.do',
			type:'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'json',
			success: function(result){
				voteListing(result);
			}
		})
	}
	
	function vote(m_id){
	// 	alert("vote() 실행");
	// 	alert(m_id);
		$.ajax({
			url: '/vote.do',
			type: 'post',
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: {'m_id':m_id},
			dataType: 'json',
			success: function(result){
				var loginChk = result.loginChk;
				if(loginChk==0){
					alert("로그인하셔야 투표에 참여할 수 있습니다");
			  		modal.style.display = "block";
				}else if(loginChk!=0){
					getVoteList();
				}
			}
		});
	}
	
	function voteListing(result){
		console.log("voteListing 실행됨");
		console.log("result : " + result);
		var loginChk = result.loginChk;
		var votedmovie = result.votedmovie;
		var mListByVote = result.mListByVote;
		var mList = result.mList;
		
		console.log(votedmovie);
		console.log(mListByVote);
		console.log(mList);
		
		if(loginChk!=0){
			if(votedmovie.title!=1){
				//	내가 선택한 영화(votedmovie)******************************
				var str = '';
				str += '<div class="votedmovie-content" style="width:80%; height:auto; margin:10px auto; padding:30px; border: 1px solid #999; border-radius:10px;">';
				str += '<div class="row" style="margin:0;">';
				str += '		<h1 style="color:black;">내가 선택한 영화</h1>';
				str += '		</div>';
				str += '		<hr>';
				str += '	<div class="row" style="margin:0;">';
				str += '		<div class="col-3">';
				str += '			<img class="votedmovie_img" src="/resources/img/'+ votedmovie.poster +'" alt="'+ votedmovie.poster +'"';
				str += '				style="height: inherit">';
				str += '</div>';
				str += '		<div class="col-5">';
				str += '			<h2 class="votedmovie_title" style="margin:auto;">'+ votedmovie.title + '</h2>';
				str += '			<ul style="list-style:none; margin: 5px 0; padding:0 0 0 10px">';
				str += '			<li><h6 class="votedmovie_gnr">장르 : ' + votedmovie.gnr + '</h6></li>';
				str += '			<li><h6 class="votedmovie_director">감독 : ' + votedmovie.director + '</h6></li>';
				str += '			<li><h6 class="votedmovie_runningtime">상영시간 : ' + votedmovie.runningtime + '</h6></li>';
				str += '			<li><h6 class="votedmovie_restrict"> 제한상영가 : ' + votedmovie.restrict + '</h6></li>';
				str += '			</ul>';
				str += '			<a href="#" style="margin:auto">영화정보 상세보기</a>';
				str += '		</div>';
				str += '		<div class="col-4" style="text-align:center;">';
				str += '			<span class="votedmovie_vote" style="font-size:100px; height:270px; line-height:270px;">' + votedmovie.vote + '표</span>';
				str += '		</div>';
				str += '	</div>';
				str += '</div>';
				
				$('.votedmovie').html(str);
			}
		}
		
		//	득표수 높은 5개 영화(mListByVote)******************************
		var str = '';
		str += '<center>';
		str += '<div class="mListByVote-content container">';
		for(var i in mListByVote){
			str += '<div class="mListByVote-item">';
			str += 	'<h1>'+mListByVote[i].title+'</h1>';
			str += '</div>';
		};
		str += '</div>';
		str += '</center>';
		$('.mListByVote').html(str);
		
		//	전체 영화 리스트(mList)******************************
		var str ='';
		str += '<div class="mList-content container">';
		for(var i in mList){
			console.log(mList[i].onair);
			if(mList[i].onair==0){
			str += '<a onclick="vote('+mList[i].m_id+')">';
			str += '<div class="mList-item card border-dark mb-3 col-3" mList_m_id="' + mList[i].m_id + '" style=max-width: 18rem; margin: 5px; padding: 0; display: block>';
			} else {
			str += '<a>';
			str += '<div class="mList-item card border-dark mb-3 col-3" mList_m_id="' + mList[i].m_id + '" style=max-width: 18rem; margin: 5px; padding: 0; display: block; background-color:red>';
			}
			str += '	<div class="card-header" style="padding:0">';
			str += 			'<div class="counter text-center">';	
			str += 				'<h3 class="counter-active">' + mList[i].vote + '</h3>';
			str += 			'</div>';
			str += '		<div class="imgBox" style="width:100%; margin:auto; overflow:hidden">';
			str += '		<img src="/resources/movieimg/'+mList[i].poster+'" style="width:100%"><br>';
			str += '		</div>';
			str += '	</div>';
			str += '	<div class="card-body text-dark text-center" style="min-height:50px">';
			str += '		<h5 class="card-title" style="margin: ">' + mList[i].title + '</h5>';
			str += '		<p class="card-text"><a href="#">상세보기</a></p>';
			str += '	</div>';
			str += '</div>';
			str += '</a>';
			str += '</div>';
		};
		str += '</div>';
		
		$('.mList').html(str);
	}
	
	</script>
</body>
</html>