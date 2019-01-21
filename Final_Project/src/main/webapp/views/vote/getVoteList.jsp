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
			<div class="container" style="">
			
				<div class="row" style="margin: 30px;">
					<h1 style="margin:auto; font-size:60px; color:black; position:relative;">보고싶은 명화</h1>
				</div>
				
				<div class="votedmovie" style="display:flex"></div>
				<div class="mListByVote" style="display:flex"></div>
				<div class="mList" style="display:flex"></div>
				
				
<!-- 				<div class="votedmovie-content" style="width:80%; height:auto; margin:auto; padding:30px; border: 1px solid #999; border-radius:10px; min-width:550px;"> -->
<!-- 					<div class="row" style="margin:0;"> -->
<!-- 						<h1 style="color:black;" style="margin:0;">내가 선택한 영화</h1> -->
<!-- 					</div> -->
<!-- 					<hr> -->
<!-- 					<div class="row" style="margin:0;"> -->
<!-- 						<div class="col-3" style="height:200px; line-height:200px;"> -->
<!-- 							<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg" -->
<!-- 								style="height: auto;"> -->
<!-- 						</div> -->
<!-- 						<div class="col-5"> -->
<!-- 							<h2 class="votedmovie_title" style="margin:auto;">국가부도의 날</h2> -->
<!-- 							<ul style="list-style:none; margin: 5px 0; padding:0 0 0 10px"> -->
<!-- 							<li><h6 class="votedmovie_gnr">장르 : 로맨스</h6></li> -->
<!-- 							<li><h6 class="votedmovie_director">감독 : 누구누구</h6></li> -->
<!-- 							<li><h6 class="votedmovie_runningtime">상영시간 : 20000분</h6></li> -->
<!-- 							<li><h6 class="votedmovie_restrict"> 제한상영가 : 7세 시청가</h6></li> -->
<!-- 							</ul> -->
<!-- 							<a href="" style="margin:">영화정보 상세보기</a> -->
<!-- 						</div> -->
<!-- 						<div class="col-4" style="height:200px; line-height:200px; "> -->
<!-- 							<span class="votedmovie_vote" style="font-size:50px">43표</span> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
<!-- 				<div class="mListByVote-content" style="width:80%; height:auto; margin:auto; padding:30px; border: 1px solid #999; border-radius:10px;  min-width:550px;"> -->
<!-- 					<div class="row" style="margin:0;"> -->
<!-- 						<h1 style="color:black;" style="margin:0;">득표수 상위 영화 5개</h1> -->
<!-- 					</div> -->
<!-- 					<hr> -->
<!-- 					<div class="row" style="margin:0;"> -->
<!-- 						<div class="row mListByVote-content-one" style="width: 100%; height:auto; margin:0 0 5px 0;"> -->
<!-- 							<div class="col-3" style="height:100px; line-height:100px;"> -->
<!-- 							<a href="#"> -->
<!-- 								<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg" -->
<!-- 									style="height: 100px; margin:auto;"> -->
<!-- 							</a> -->
<!-- 							</div> -->
<!-- 							<div class="col-4" style="height:100px; line-height:100px;"> -->
<!-- 							<a href="#"> -->
<!-- 								<span style="margin:auto;">국가 부도의 날</span> -->
<!-- 							</a> -->
<!-- 							</div> -->
<!-- 							<div class="col-5" style="height:100px; line-height:100px;"> -->
<!-- 								<span style="margin:auto;">차트 ------------------ 123표</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="row mListByVote-content-one" style="width: 100%; height:auto; margin:0 0 5px 0;"> -->
<!-- 							<div class="col-3" style="height:100px; line-height:100px;"> -->
<!-- 							<a href="#"> -->
<!-- 								<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg" -->
<!-- 									style="height: 100px; margin:auto;"> -->
<!-- 							</a> -->
<!-- 							</div> -->
<!-- 							<div class="col-4" style="height:100px; line-height:100px;"> -->
<!-- 							<a href="#"> -->
<!-- 								<span style="margin:auto;">국가 부도의 날</span> -->
<!-- 							</a> -->
<!-- 							</div> -->
<!-- 							<div class="col-5" style="height:100px; line-height:100px;"> -->
<!-- 								<span style="margin:auto;">차트 ------------------ 123표</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
					
<!-- 				</div> -->
				
<!-- 				<div class="mList-content" style="width:100%; height:auto; margin: 0 auto 10px; padding:30px; border: 1px solid #999; border-radius:10px; min-width:550px;"> -->
<!-- 					<div class="row" style="margin:0;"> -->
<!-- 						<h1 style="color:black; margin:0 auto;">전체 영화 목록</h1> -->
<!-- 					</div> -->
<!-- 					<hr> -->
<!-- 					<div class="row" style="margin:0; padding: 10px"> -->
<!-- 						<div class="mList-content-one" style="width: auto; height:auto; margin:0 5px 5px 0;"> -->
<!-- 							<div class="col" style="width:auto; min-width:130px; border:1px solid #ddd; border-radius: 8px;"> -->
<!-- 								<div class="row mList-content-one-vote"  style="margin:0; padding: 0"> -->
<!-- 									<p style="margin:0 auto; font-size:0.8em">23</p> -->
<!-- 								</div> -->
<!-- 								<div class="row mList-content-one-chart"  style="margin:0; padding: 0"> -->
<!-- 									<p style="margin:auto;">|</p> -->
<!-- 									<p style="margin:auto;">|</p> -->
<!-- 								</div> -->
<!-- 								<div class="row mList-content-one-poster"  style="margin:0; padding: 0; height:auto;"> -->
<!-- 									<img class="votedmovie_img" src="/resources/img/국가부도의날 포스터.jpg" alt="이미지파일명.jpg" -->
<!-- 										style="height: 130px; margin:auto;"> -->
<!-- 								</div> -->
<!-- 								<div class="row mList-content-one-title"  style="margin:0; padding: 0; height:20px; line-height:20px;"> -->
<!-- 									<h6 style="margin: 2px auto; font-size:0.8em">국가부도의 날</h6> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
				
			</div>
		</main>	
		<!--// 메인 영역 Content -->
		
		<!-- Footer Area -->
		<jsp:include page="../main/main-footer.jsp"></jsp:include>
		<!-- //Footer Area -->
			
	</div>
	<!--// Main wrapper -->
	
	
	<!-- 구글차트(가로 바) -->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<script>
	
	//페이지 로딩시 투표 목록 갱신
	$(function(){
		getVoteList();
	})

	//전역변수 선언
	var maxVote = 0;
	
	//차트 그리기(득표순 5개 차트)
	function drawChart(){
// 		alert("drawChart 실행");
		var divs = [];
		divs = document.getElementsByClassName('chart_div');
// 		var divs = $('.chart_div');
		console.log("divs : " + divs);
// 		var maxVote = $(divs[0]).attr('vote');
// 		var maxVote = divs[0].getAttribute('vote');
		console.log('maxVote : ' + maxVote);
		for(var i in divs){ 
// 			console.log('vote[' + i + '] : ' + $(divs[i]).attr('vote'));
			var votes = divs[i].getAttribute('vote');
			var voteInt = parseInt(votes, 10);
			console.log('voteInt : ' +  voteInt);
			
			var data = google.visualization.arrayToDataTable([
				['제목', '득표수', { role: 'style' }],
				['', voteInt, 'color: #ce2c3c']
			]);
			
			var options = {
			        width: '90%',
			        height: '100%',
					chartArea: {
		 		        width: 300,
		 		        height: 50,
				        bar: {groupWidth: "30%"}},
					hAxis : {
						minValue: 0,
						maxValue: maxVote},
				    legend: { position: "none" }
			};
			var id = $(divs[i]).attr('id');
// 			console.log("id : " + id);
			var chart = new google.visualization.BarChart(document.getElementById(id));
			chart.draw(data, options);
		}
	}
	
	//차트 그리기2(영화 전체 히스토그램 차트)
	function drawChart2(){
// 		alert("drawChart2 실행");
		var divs2 = [];
		divs2 = document.getElementsByClassName('chart_div2');
// 		var divs = $('.chart_div');
		console.log("divs2 : " + divs2);
		console.log('maxVote : ' + maxVote);
		for(var i in divs2){ 
// 			console.log('vote[' + i + '] : ' + $(divs[i]).attr('vote'));
			var votes2 = divs2[i].getAttribute('vote');
			var voteInt2 = parseInt(votes2, 10);
			console.log('voteInt2 : ' +  voteInt2);
			
			var data = google.visualization.arrayToDataTable([
				['제목', '득표수', { role: 'style' }],
				['', voteInt2, 'color: #ce2c3c']
			]);
			
			var options = {
			        width: '100%',
			        height: '100%',
					chartArea: {
		 		        width: 60,
		 		        height: 400,
				        bar: {groupWidth: "10%"}},
					vAxis : {
						minValue: 0,
						maxValue: maxVote,
						textPosition: 'none'},
				    legend: { position: "none" }
			};

// 		     var options = {
// 		       width: 600,
// 		       height: 400,
// 		       bar: {groupWidth: "95%"},
// 		       legend: { position: "none" },
// 		     };

			
			var id = $(divs2[i]).attr('id');
// 			console.log("id : " + id);
			var chart = new google.visualization.ColumnChart(document.getElementById(id));
			chart.draw(data, options);
		}
	}
	
	//투표 목록 갱신
	function getVoteList(){
	// 	alert('getVoteList.jsp 페이지 로딩완료');
		//차트 로딩
		google.charts.load('current', {'packages':['corechart']});
		
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
	
	//투표
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
	
	//투표 현황 출력
	function voteListing(result){
		console.log("voteListing 실행됨");
// 		alert("voteListing 실행됨");
		console.log("result : " + result);
		var loginChk = result.loginChk;
		var votedmovie = result.votedmovie;
		var mListByVote = result.mListByVote;
		var mList = result.mList;
		
		console.log(votedmovie);
		console.log(mListByVote);
		console.log(mList);
		
		if(loginChk!=0){
			if(votedmovie.title!=null){
				//	내가 선택한 영화(votedmovie)******************************
				var str = '';
				str += '<div class="votedmovie-content" style="width:80%; height:auto; margin: 0 auto 10px; padding:30px; border: 1px solid #999; border-radius:10px; min-width:740px;">';
				str += '		<div class="row" style="margin:0;">';
				str += '		<h1 style="color:black; margin:0 auto;">내가 선택한 영화</h1>';
				str += '		</div>';
				str += '		<hr>';
				str += '	<div class="row" style="margin:0;">';
				str += '		<div class="col-3" style="height:200px; line-height:200px;">';
				str += '			<img class="votedmovie_img" src="/resources/movieimg/'+ votedmovie.poster +'" alt="'+ votedmovie.poster +'"';
				str += '				style="height: 100%;">';
				str += '</div>';
				str += '		<div class="col-5">';
				str += '			<h2 class="votedmovie_title" style="margin:auto; color:#333">'+ votedmovie.title + '</h2>';
				str += '			<ul style="list-style:none; margin: 5px 0; padding:0 0 0 10px">';
				str += '			<li><h6 class="votedmovie_gnr">장르 : ' + votedmovie.gnr + '</h6></li>';
				str += '			<li><h6 class="votedmovie_director">감독 : ' + votedmovie.director + '</h6></li>';
				str += '			<li><h6 class="votedmovie_runningtime">상영시간 : ' + votedmovie.runningtime + '</h6></li>';
				str += '			<li><h6 class="votedmovie_restrict"> 제한상영가 : ' + votedmovie.restrict + '</h6></li>';
				str += '			</ul>';
				str += '			<p><a href="#" style="margin:auto;">영화정보 상세보기</a></p>';
				str += '		</div>';
				str += '		<div class="col-4"  style="height:200px; line-height:200px;">';
				str += '			<span class="votedmovie_vote" style="font-size:80px; margin:auto;">' + votedmovie.vote + '표</span>';
				str += '		</div>';
				str += '	</div>';
				str += '</div>';
				
				$('.votedmovie').html(str);
			}
		}
		
		//	득표수 높은 5개 영화(mListByVote)******************************
		var str = '';
		str += '<div class="mListByVote-content" style="width:80%; height:auto; margin: 0 auto 10px;';
		str += '	 padding:30px; border: 1px solid #999; border-radius:10px;';
		str += '	 min-width:740px;">';
		str += '	<div class="row" style="margin:0;">';
		str += '		<h1 style="color:black; margin:0 auto;">현재 득표수 높은 영화들</h1>';
		str += '	</div>';
		str += '	<hr>';
		for(var i in mListByVote){
		str += '	<div class="row" style="margin:0;">';
		str += '		<div class="row mListByVote-content-one" style="width: 100%; height:auto; margin:0 0 5px 0;">';
		str += '			<div class="col-2" style="height:100px; line-height:100px;">';
		str += '			<a href="#" style="margin:auto;">';
		str += '				<img class="votedmovie_img" src="/resources/movieimg/' + mListByVote[i].poster + '" alt="이미지파일명.jpg"';
		str += '					style="height: 100px; margin:auto;">';
		str += '			</a>';
		str += '			</div>';
		str += '			<div class="col-2" style="height:100px; line-height:100px; padding:0; margin: 0;">';
		str += '			<a href="#" style="margin: auto;">';
		str += '				<h2 style="margin: auto;">' + mListByVote[i].title + '</h2>';
		str += '			</a>';
		str += '			</div>';
		str += '			<div class="col-8" style="height:100px; line-height:100px; padding:0;">';
		str += '				<div class="row" style="height:100px; line-height:100px; margin:auto;"><div class="chart_div" id="chart_'+mListByVote[i].m_id+'" vote="'+mListByVote[i].vote+'" style="width : 80%; height:100px; display:inline;"></div><h2 style="margin:auto 0;">' + mListByVote[i].vote + '</h2></div>';
		str += '			</div>';
		str += '		</div>';
		str += '	</div>';
		};
		str += '</div>';
		
		$('.mListByVote').html(str);

		
		//	전체 영화 리스트(mList)******************************
		var onairStatus = '';
		var str = '';
		str += '<div class="mList-content" style="width:100%; height:auto; margin: 0 auto 10px;';
		str += '		padding:30px; border: 1px solid #999; border-radius:10px;';
		str += '		min-width:740px;">';
		str += '	<div class="row" style="margin:0;">';
		str += '		<h1 style="color:black; margin:0 auto;">전체 영화 목록</h1>';
		str += '	</div>';
		str += '	<hr>';
		str += '	<div class="row" style="margin:0; padding: 10px">';
		for(var i in mList){
		var onair = mList[i].onair;
		if(onair==1){
			onairStatus='상영중';
		} else if(onair==-1){
			onairStatus='상영예정작';
		} else if(onair==0){
			onairStatus='대기중';
		} 
		if(onair==0){
		str += '		<a onclick="vote(' + mList[i].m_id + ')">';
		str += '		<div class="mList-content-one" style="width: auto; height:auto; margin:0 5px 5px 0;">';
		} else {
// 		str += '		<a class="disabledMovie" style="color: currentColor; cursor: not-allowed; opacity: 0.5; text-decoration: none;">';
		str += '		<a class="disabledMovie" style="color: currentColor; opacity: 0.5; text-decoration: none;">';
		str += '		<div class="mList-content-one" style="width: auto; height:auto; margin:0 5px 5px 0;">';
		}
		str += '			<div class="col" style="width:auto; min-width:130px; border:1px solid #ddd; border-radius: 8px;">';
		str += '				<div class="row mList-content-one-vote"  style="margin:0; padding: 0">';
		str += '					<p style="margin:0 auto; font-size:0.8em">' + mList[i].vote + '</p>';
		str += '				</div>';
		str += '				<div class="row mList-content-one-chart"  style="margin:0; padding: 0">';
		str += '					<div class="chart_div2" id="chart2_'+mList[i].m_id+'" vote="'+mList[i].vote+'" style="width : 90px; height:50px; display:inline; margin:0 auto;"></div>';
		str += '				</div>';
		str += '				<div class="row mList-content-one-poster"  style="margin:0; padding: 0; height:auto;">';
		str += '					<img class="votedmovie_img" src="/resources/movieimg/'+ mList[i].poster +'" alt="이미지파일명.jpg"';
		str += '						style="height: 130px; margin:auto;">';
		str += '				</div>';
		str += '				<div class="row mList-content-one-title"  style="margin:0; padding: 0; height:20px; line-height:20px;">';
		str += '					<h6 style="margin: 2px auto; font-size:0.8em">'+ mList[i].title +'</h6>';
		if(onair!=0){
		str += '					<br><h6 style="margin: 2px auto; font-size:0.8em">('+ onairStatus +')</h6>';
		}
		str += '				</div>';
		str += '			</div>';
		str += '		</div>';
		str += '		</a>';
		};
		str += '	</div>';
		str += '</div>';

		$('.mList').html(str);

		maxVote = document.getElementsByClassName('chart_div')[0].getAttribute('vote');
		console.log('maxVote 전역 : ' + maxVote);
		
	 	google.charts.setOnLoadCallback(drawChart);
	 	google.charts.setOnLoadCallback(drawChart2);
	}
	

	
	
	</script>
	
</body>
</html>