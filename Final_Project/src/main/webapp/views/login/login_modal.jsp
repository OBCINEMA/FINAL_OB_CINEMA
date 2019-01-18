<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
	String BPath = contextPath + "/resources/img";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 로그인 메인 css -->
<link rel="stylesheet"
	href="<%=contextPath%>/resources/addcss/login_main.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function login(frm){
	var commentData=$("form[name=chk]").serialize();
	$.ajax({
		url:"<%=contextPath%>/loginchk.do",
		type:"post",
		data:commentData,
		dataType:"text",
		success: function(result){
			alert(result);
			if(result == "success"){
				alert("로그인 되었습니다.");
				frm.action = "<%=contextPath%>/mainGO.do?pageType=main";
<%-- 				frm.action = "<%=contextPath%>/mainGO.do?pageType=${pageType}"; --%>
<%-- 				frm.action = "<%=contextPath%>/mainGO.do?pageType=${pageType}"; --%>
/* frm.action = "/mainGO.do"; */
				window.location.reload();
				//			frm.submit();
				//			return false;
						} else if (result == "fail") {
							alert("아이디비밀번호를 확인해 주세요");
							frm.id.value = "";
							frm.password.value = "";
							frm.id.focus();

							$("#msg")
									.html(
											"<div style='color: red;'><b>아이디 비밀번호를 확인해 주세요.</b></div>");
						}

					}
				});
	}
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="myModal" class="myModal">

		<form class="myModal-content animate" method="post" name="chk">
			<div class="imgcontainer">
				<span onclick="document.getElementById('myModal').style.display='none'"
					class="close" title="Close Modal">&times;</span>
			</div>

			<div class="container">
				<label for="uname"><b>아이디</b></label> <input type="text"
					placeholder="Enter Username" name="id" required> <label
					for="psw"><b>비밀번호</b></label> <input type="password"
					placeholder="Enter Password" name="password" required>

				<button type="button" class="cr-btn cr-btn-sm"
					onclick="login(this.form)">Login</button>
				<div id="msg"></div>


			</div>
			<div class="container">

				<br> <a id="navergogo" href="/navergo.do"><img alt="네이버"
					src="<%=BPath%>/네이버버튼.png"></a> <a
					href="https://kauth.kakao.com/oauth/authorize?client_id=2609b2266d44516fd921046db0f62d8d&redirect_uri=http://localhost:8080/kakaologin.do&response_type=code">
					<img alt="카카오" src="<%=BPath%>/카카오버튼.png">
				</a>



			</div>
			<div class="container" style="background-color: #f1f1f1">
				<button type="button" class="btn btn-success btn-sm"
					style="width: 100px; height: 40px;"
					onclick="location.href='<%=contextPath%>/joinUS.do'">회원가입</button>

				<span class="psw"><a href="/findIDPW.do">아이디/비밀번호찾기</a></span> 
			</div>
		</form>
	</div>

</body>
</html>