<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/assets";
	String MovieIMGPath = contextPath + "/resources/movieimg";
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 이미지 css -->
<style>
* {
	box-sizing: border-box;
}

.column {
	float: left;
	width: 33.33%;
	padding: 3px;
}

/* Clearfix (clear floats) */
.row::after {
	content: "";
	clear: both;
	display: table;
}
</style>

<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>
<body>

	<h2>극장별</h2>
	<div>확인 할 극장을 클릭하세요</div>


	<div class="tab">

		<c:forEach items="${theaterList }" var="theater">
			<button class="tablinks"
				onclick="openTheater(event, '${theater.t_id}')">${theater.name }</button>
		</c:forEach>




	</div>
	<c:forEach var="theater" items="${theaterList }">
		<div id="${theater.t_id }" class="tabcontent">
			<div>${theater.name } 전체 상영 스케쥴</div>
			<div class="row"></div>
			<div class="addPoster"></div>

		</div>
	</c:forEach>


	<script>
		function openTheater(evt, t_id) {
			var i, tabcontent, tablinks;
			//alert(t_id);

			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(t_id).style.display = "block";
			evt.currentTarget.className += " active";
			/*  */
			$.ajax({
				url : '/getPlusTitlebyt_id.do',
				type : 'post',
				data : {
					't_id' : t_id
				},
				dataType : 'json',
				success : function(result) {
					console.log(result);

					
					var str = "";
					var a = "";
					str += "<div class='row'>";
					for (var i = 0; i < result.length; i++) {
						var onairStatus = '';
						if (result[i].onair == 1) {
							onairStatus = "상영중";
						} else if (result[i].onair == 0) {
							onairStatus = "상영종료";
						} else if (result[i].onair == -1){
							onairStatus = "상영예정작";
						}
						str += "<div class='column'>";
						str += "<a href=admin_modifyShedule.do?sch_id="+result[i].sch_id+">";
						str += "<img src='resources/movieimg/"
								+ result[i].poster + "' alt='"
								+ result[i].poster + "' style='width: 45%'></a>";
						str += "<div>" + result[i].time
								+ "시</div><div>상영정보 : " + onairStatus
								+ "</div>" + "<div>상영관 : " + result[i].scr_name
								+ "</div>"
						str += "</div>";
					}
				
					str += "</div>";
					$(".addPoster").html(str);
					console.log(result);
					console.log(str);
				}

			});

			/*  */
		}
	</script>

</body>
</html>
