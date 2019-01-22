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

<!-- 투표페이지 영화상세 모달용 CSS -->
<link rel="stylesheet" href="/resources/modal/modalMovieDetail.css">

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
	<div class="wrapper" id="wrapper">
		
		<!-- Header 시작 -->
		<jsp:include page="../main/main-header.jsp"></jsp:include>
		<!-- //Header 끝 -->
			
		<!--메인 영역 Content -->
		<main class="page-content bg-grey"  style="margin-top:146px; "> 
			<div class="row" style="margin: 0; padding: 0; width: 100%;">
			
				<div class="row" style="background-image: url('/resources/img/headImg/filmtapes2.jpg'); background-repeat: no-repeat; background-size: cover; height: 400px; width: 100%; margin: 0 0 10px;">
				<div style="margin:0; padding:0; width:100%; background-color:rgba(0,0,0,0.7); text-align: center;">
					<h2 style="margin: 150px auto; font-size:60px; color:#f1f1f1; position:relative;">보고싶은 명화</h2>
				</div>
				</div>
				
				<div class="votedmovie" style="display:flex"></div>
				<div class="mListByVote" style="display:flex"></div>
				<div class="mList" style="display:flex"></div>
				
				<jsp:include page="/views/vote/myModalMovieDetail.jsp"></jsp:include>
				
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
	var votedmovie;
	var mListByVote;
	var mList;
	
	//모달용 상세 정보
	var detail_title;
	var detail_poster;
	var detail_content;
	var detail_director;
	var detail_gnr;
	var detail_runningtime;
	var detail_ristrict;
	var detail_img1;
	var detail_img2;
	var detail_img3;
	
	//영화상세 모달 script**************************************************************
// 		// Get the modal
// 		var modal = document.getElementById('modalMovieDetail');
		 
// 		// Get the <span> element that closes the modal
// 		var span = document.getElementById("myModal-close");                                          
		 
// 		// When the user clicks on <span> (x), close the modal
// 		span.onclick = function() {
// 		    modal.style.display = "none";
// 		}
		 
// 		// When the user clicks anywhere outside of the modal, close it
// 		window.onclick = function(event) {
// 			if (event.target == modal) {
// 					modal.style.display = "none";
// 			}
// 		}
	//**********************************************************************************
	
	//영화 상세 모달(내가 선택한 영화)
	function movieDetailModalOn(){
		
		detail_title = votedmovie.title;
		detail_poster = votedmovie.poster;
		detail_content = votedmovie.content;
		detail_director = votedmovie.director;
		detail_gnr = votedmovie.gnr;
		detail_runningtime = votedmovie.runningtime;
		detail_ristrict = votedmovie.ristrict;
		detail_img1 = votedmovie.img1;
		detail_img2 = votedmovie.img2;
		detail_img3 = votedmovie.img3;
		
		console.log('detail_title : ' + detail_title);
		console.log('detail_poster : ' + detail_poster);
		console.log('detail_content : ' + detail_content);
		console.log('detail_director : ' + detail_director);
		console.log('detail_gnr : ' + detail_gnr);
		console.log('detail_runningtime : ' + detail_runningtime);
		console.log('detail_ristrict : ' + detail_ristrict);
		console.log('detail_img1 : ' + detail_img1);
		console.log('detail_img2 : ' + detail_img2);
		console.log('detail_img3 : ' + detail_img3);
		console.log('test완료');
		
		$('#movieDetailModal-title').html(detail_title);
		$('#movieDetailModal-poster').html('<img src="/resources/movieimg/'+detail_poster+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-content').html(detail_content);
		$('#movieDetailModal-director').html(detail_director);
		$('#movieDetailModal-gnr').html(detail_gnr);
		$('#movieDetailModal-runningtime').html(detail_runningtime);
		$('#movieDetailModal-ristrict').html(detail_ristrict);
		$('#movieDetailModal-img1').html('<img src="/resources/movieimg/'+detail_img1+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-img2').html('<img src="/resources/movieimg/'+detail_img2+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-img3').html('<img src="/resources/movieimg/'+detail_img3+'" alt="service thumb" style="width: 100%;">');
		
	    modal2.style.display = "block";
	}
	
	//영화 상세 모달(득표 상위 영화 5개)
	function movieDetailModalOn2(i){
		
		detail_title = mListByVote[i].title;
		detail_poster = mListByVote[i].poster;
		detail_content = mListByVote[i].content;
		detail_director = mListByVote[i].director;
		detail_gnr = mListByVote[i].gnr;
		detail_runningtime = mListByVote[i].runningtime;
		detail_ristrict = mListByVote[i].ristrict;
		detail_img1 = mListByVote[i].img1;
		detail_img2 = mListByVote[i].img2;
		detail_img3 = mListByVote[i].img3;
		
		console.log('detail2_title : ' + detail_title);
		console.log('detail2_poster : ' + detail_poster);
		console.log('detail2_content : ' + detail_content);
		console.log('detail2_director : ' + detail_director);
		console.log('detail2_gnr : ' + detail_gnr);
		console.log('detail2_runningtime : ' + detail_runningtime);
		console.log('detail2_ristrict : ' + detail_ristrict);
		console.log('detail2_img1 : ' + detail_img1);
		console.log('detail2_img2 : ' + detail_img2);
		console.log('detail2_img3 : ' + detail_img3);
		console.log('test완료');
		
		$('#movieDetailModal-title').html(detail_title);
		$('#movieDetailModal-poster').html('<img src="/resources/movieimg/'+detail_poster+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-content').html(detail_content);
		$('#movieDetailModal-director').html(detail_director);
		$('#movieDetailModal-gnr').html(detail_gnr);
		$('#movieDetailModal-runningtime').html(detail_runningtime);
		$('#movieDetailModal-ristrict').html(detail_ristrict);
		$('#movieDetailModal-img1').html('<img src="/resources/movieimg/'+detail_img1+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-img2').html('<img src="/resources/movieimg/'+detail_img2+'" alt="service thumb" style="width: 100%;">');
		$('#movieDetailModal-img3').html('<img src="/resources/movieimg/'+detail_img3+'" alt="service thumb" style="width: 100%;">');
		
	    modal2.style.display = "block";
	}
	
	
	
	//차트 그리기(득표순 5개 차트)
	function drawChart(){
// 		alert("drawChart 실행");
		var divs = [];
		divs = document.getElementsByClassName('chart_div');
		console.log("divs : " + divs);
		console.log('maxVote : ' + maxVote);
		for(var i in divs){ 
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
						maxValue: maxVote,
						textPosition: 'none'},
				    legend: { position: "none" },
				    backgroundColor: { fill: "#252525" }
			};
			var id = $(divs[i]).attr('id');
			var chart = new google.visualization.BarChart(document.getElementById(id));
			chart.draw(data, options);
		}
	}
	
	//차트 그리기2(영화 전체 히스토그램 차트)
	function drawChart2(){
// 		alert("drawChart2 실행");
		var divs2 = [];
		divs2 = document.getElementsByClassName('chart_div2');
		console.log("divs2 : " + divs2);
		console.log('maxVote : ' + maxVote);
		for(var i in divs2){ 
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
				    legend: { position: "none" },
				    backgroundColor: { fill: "#303030" }
			};
			
			var id = $(divs2[i]).attr('id');
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
		votedmovie = result.votedmovie;
		mListByVote = result.mListByVote;
		mList = result.mList;
		
		console.log("votedmovie : " + votedmovie);
		console.log("mListByVote : " + mListByVote);
		console.log("mList : " + mList);
		
		if(loginChk!=0){
			if(votedmovie.title!=null){
				//	내가 선택한 영화(votedmovie)******************************
				var str = '';
				str += '<div class="votedmovie-content" style="width:80%; height:auto; margin: 0 auto 10px; ';
				str += '	 padding:30px; border: 1px solid #252525; border-radius:10px; ';
				str += '	 min-width:780px; background-color: #252525; ">';
				str += '		<div class="row" style="margin:0;">';
				str += '			<h1 style="color:#f1f1f1; margin:0 auto;">내가 선택한 영화</h1>';
				str += '		</div>';
				str += '		<hr style="background-color: #ce2c3c; height: 3px;">';
				str += '		<div class="row" style="margin:0;">';
				str += '			<div class="col-3" style="height:200px; line-height:200px;">';
				str += '				<a onclick="movieDetailModalOn()" style="width: auto; margin:auto; display:inline;">';
				str += '				<img class="votedmovie_img" src="/resources/movieimg/'+ votedmovie.poster +'" alt="'+ votedmovie.poster +'"';
				str += '					style="height: 100%;">';
				str += '				</a>';
				str += '			</div>';
				str += '			<div class="col-5">';
				str += '				<a onclick="movieDetailModalOn()" >';
				str += '				<h4 class="votedmovie_title" style="display:inline; margin:auto;" >'+ votedmovie.title + '</h4>';
				str += '				<ul style="list-style:none; margin: 5px 0; padding:0 0 0 10px">';
				str += '				<li><h6 class="votedmovie_gnr">장르 : ' + votedmovie.gnr + '</h6></li>';
				str += '				<li><h6 class="votedmovie_director">감독 : ' + votedmovie.director + '</h6></li>';
				str += '				<li><h6 class="votedmovie_runningtime">상영시간 : ' + votedmovie.runningtime + '</h6></li>';
				str += '				<li><h6 class="votedmovie_restrict"> 제한상영가 : ' + votedmovie.restrict + '</h6></li>';
				str += '				</ul>';
				str += '				</a>';
				str += '			</div>';
				str += '			<div class="col-4"  style="height:200px; line-height:200px;">';
				str += '				<span class="votedmovie_vote" style="font-size:80px; margin: 0 auto 0 30px;">' + votedmovie.vote + '표</span>';
				str += '			</div>';
				str += '		</div>';
				str += '</div>';
				
				$('.votedmovie').html(str);
			}
		}
		
		//	득표수 높은 5개 영화(mListByVote)******************************
		var str = '';
		str += '<div class="mListByVote-content" style="width:80%; height:auto; margin: 0 auto 10px;';
		str += '	 padding:30px; border: 1px solid #252525; border-radius:10px;';
		str += '	 min-width:780px; background-color: #252525; ">';
		str += '	<div class="row" style="margin:0;">';
		str += '		<h1 style="color: #f1f1f1; margin:0 auto;">현재 득표수 높은 영화들</h1>';
		str += '	</div>';
		str += '	<hr style="background-color: #ce2c3c; height: 3px;">';
		for(var i in mListByVote){
		str += '	<div class="row" style="margin:0;">';
		str += '		<div class="row mListByVote-content-one" style="width: 100%; height:auto; margin:0 0 5px 0;">';
		str += '			<div class="col" style="height:100px; line-height:100px; padding:0;">';
		str += '				<a onclick="movieDetailModalOn2('+i+')" style=" margin:auto; ">';
		str += '				<img class="votedmovie_img" src="/resources/movieimg/' + mListByVote[i].poster + '" alt="이미지파일명.jpg"';
		str += '					style="height: 100px; margin:auto;">';
		str += '				</a>';
		str += '			</div>';
		str += '			<div class="col-3" style="height:100px; line-height:100px; padding:0; margin: 0;">';
		str += '				<a onclick="movieDetailModalOn2('+i+')" style=" margin:auto; ">';
		str += '				<h3 style="margin: auto;">' + mListByVote[i].title + '</h3>';
		str += '				</a>';
		str += '			</div>';
		str += '			<div class="col-7" style="height:100px; line-height:100px; padding:0;">';
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
		str += '		padding:30px; border: 1px solid #252525; border-radius:10px;';
		str += '		min-width:780px; background-color: #252525; ">';
		str += '	<div class="row" style="margin:0;">';
		str += '		<h1 style="color: #f1f1f1; margin:0 auto;">전체 영화 목록</h1>';
		str += '	</div>';
		str += '	<hr style="background-color: #ce2c3c; height: 3px;">';
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
		str += '		<div class="mList-content-one" style="width: auto; height:auto; margin:0 5px 5px 0; box-shadow: 5px 5px 3px #121212;">';
		str += '			<div class="col" style="width:130px; border:1px solid #303030; border-radius: 8px; background-color: #303030;">';
		} else {
// 		str += '		<a class="disabledMovie" style="color: currentColor; cursor: not-allowed; opacity: 0.5; text-decoration: none;">';
		str += '		<a class="disabledMovie" style="color: currentColor; opacity: 0.5; text-decoration: none;">';
		str += '		<div class="mList-content-one" style="width: auto; height:auto; margin:0 5px 5px 0;">';
		str += '			<div class="col" style="width:130px; border:1px solid #252525; border-radius: 8px; background-color: #303030;">';
		}
		str += '				<div class="row mList-content-one-vote"  style="margin:0; padding: 0">';
		str += '					<p style="margin:0 auto; font-size:0.8em">' + mList[i].vote + '</p>';
		str += '				</div>';
		str += '				<div class="row mList-content-one-chart"  style="margin:0; padding: 0">';
		str += '					<div class="chart_div2" id="chart2_'+mList[i].m_id+'" vote="'+mList[i].vote+'" style="width : 90px; height:50px; display:inline; margin:0 auto;"></div>';
		str += '				</div>';
		str += '				<div class="row mList-content-one-poster"  style="margin:0; padding: 0; height:auto; width:">';
		str += '					<img class="votedmovie_img" src="/resources/movieimg/'+ mList[i].poster +'" alt="이미지파일명.jpg"';
		str += '						style="height: 130px; margin:auto;">';
		str += '				</div>';
		str += '				<div class="row mList-content-one-title"  style="margin:0; padding: 0; height:50px;">';
		str += '					<h5 style="margin: 5px auto 0; font-size:0.8em; vertical-align:center;">'+ mList[i].title +'</h6>';
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