<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

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
<!-- 헤더 로그인 버튼 색상 -->
<link rel="stylesheet" href="<%=KPath%>/css/color-variations.css">

<!-- Cusom css -->
<%-- <link rel="stylesheet" href="<%=KPath%>/css/custom.css"> --%>

<!-- Modernizer js -->
<%-- <script src="<%=KPath%>/js/vendor/modernizr-3.5.0.min.js"></script> --%>
<style>
	
	#bg1 {
		background-color: #ece6cc;
	}
	#dogimg{
		width: 300px;
		height: 200px;
	}
	#attach1{
		display: inline-block;
		width: 300px;
		height: 150px;
		margin: 1em;
		margin-top: -30px;
	}
	#attach2{
		display: inline-block;
		width: 400px;
		height: 250px;
		margin: 1em;
		margin-top: -30px;
	}
	#bold{
		font-weight: bold;
	}
	#subject{
		display: inline;
		font-size: 30px;
	}
	#icon1{
		width: 60px;
	}
	#nav{
		background-color: #8f784b;
	}
	#abc a{
		color: white;
	}
	#paw{
		width: 30px;
		height: 30px;
	}
	.list-group-item{
		color:#8f784b;
		font-weight: bold;
	}
	#fontweight{
		font-size: 2rem;
	}
	
</style>
<script>
    function sendPay(form) {
    	form.action = "payTest.do";
    	form.submit();
    }
    
    $(document).ready(function() {
    var money = ${totPrice}; //2,312,000원
    money = money.toLocaleString();
    $("#totPrice").append(money);
    });

</script>
</head>
<body>
	<!-- Header 시작 -->
	<jsp:include page="../main/main-header.jsp"></jsp:include>
	<!-- //Header 끝 -->
	<div class="container" style="margin-top: 180px;">	
		<div class="row">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">	
	<thead>
		<tr>
			<th style="background-color: #fafafa; text-align: center;">사진</th>
			<th style="background-color: #fafafa; text-align: center;">제목</th>
			<th style="background-color: #fafafa; text-align: center;">극장</th>
			<th style="background-color: #fafafa; text-align: center;">상영관</th>
			<th style="background-color: #fafafa; text-align: center;">일자</th>
			<th style="background-color: #fafafa; text-align: center;">시간</th>
			<th style="background-color: #fafafa; text-align: center;">좌석</th>
			<th style="background-color: #fafafa; text-align: center;">가격</th>
		</tr>
	</thead>
	<tbody>	
		<tr>
			<td  style="text-align: center"><img src="resources/movieimg/${movieVO.poster }" width="100"></td>
			<td style="text-align: center">${movieVO.title }</td>
			<td style="text-align: center">${theaterVO.name }</td>
			<td style="text-align: center">${screenVO.scr_name }</td>			
			<td style="text-align: center">${reservationList[0].r_date }</td>
			<td style="text-align: center">${time}</td>
			<td style="text-align: center"> 
				<c:forEach var="reservationOne" items="${reservationList}" >
					${reservationOne.seat_row }
					/
					${reservationOne.seat_col }
					&nbsp
					
				</c:forEach>
			</td>
			<td style="text-align: center" id="totPrice">&#8361;</td>
		</tr>	
	</tbody>
	</table>
	</div>
    </div>
	<br><br>
	
	<form>
		<div class="container"  style="margin-bottom: 30px">	
		<div class="row">
		<table class="table table-bordered bordertable th120" >
		<tr><th style="background-color: #fafafa">결제수단</th></tr>
		<tr><td>결제수단선택</td></tr>
		<tr><td>
		신용카드&nbsp<input type="radio" name="pay_type" value="card" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		핸드폰&nbsp<input type="radio" name="pay_type" value="phone" style="display: inline-block; width: 15px; margin-top: 0px;">&nbsp&nbsp&nbsp
		계좌입금&nbsp<input type="radio" name="pay_type" value="Transfer" style="display: inline-block; width: 15px; margin-top: 0px;">
		</td></tr>
		<tr><td colspan="2" style="text-align: center;">
			<input type="button" value="결제하기" onclick="sendPay(this.form)" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px">
			<input type="reset" value="취소하기" class="cr-btn cr-btn-sm" style="margin-top: 30px;background-color: #ce2c3c;height: 58px; display: inline-block; width: 120px;">
		</td></tr>
		</table>
		</div>
		</div>
	</form>
	<!-- Footer Area -->
	<jsp:include page="../main/main-footer.jsp"></jsp:include>
	<!-- //Footer Area -->
</body>
</html>