<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/resources/modal/modal.css">
</head>
<body>
		<!-- The Modal -->
		<div id="myModal" class="myModal">
			<!-- Modal content -->
			<div class="myModal-content">
				<span id="myModal-close">&times;</span>
				<form class="myModal-content-content animate" method="post" name="chk">
					<div class="container" style="background-color: #f1f1f1">
						<label for="uname"><b>아이디</b></label>
						<input type="text" placeholder="Enter Username" name="id" required>
						<label for="psw"><b>비밀번호</b></label>
						<input type="password" placeholder="Enter Password" name="password" required>
						<button type="button" class="cr-btn cr-btn-sm" onclick="login(this.form)">Login</button>
						<div id="msg"></div>
						<div class="row">
						<a id="navergogo" href="/navergo.do" style="display:inline;">
							<img alt="네이버" src="/resources/img/네이버버튼.png">
						</a>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=2609b2266d44516fd921046db0f62d8d&redirect_uri=http://localhost:8080/kakaologin.do&response_type=code"
							style="display:inline;">
							<img alt="카카오" src="/resources/img/카카오버튼.png">
						</a>
						</div>
					</div>
					<div class="container" style="background-color: #f1f1f1">
						<button type="button" class="btn btn-success btn-sm"
							style="width: 100px; height: 40px;"  onclick="location.href='/joinUS.do'">
							회원가입
						</button>
						
						<span class="psw"><a href="#">비밀번호찾기</a></span> <span class="psw">
						<a href="#">아이디찾기</a>&nbsp;&nbsp;</span>
					</div>
					
				</form>
			</div>
		</div>
		<!--// The Modal -->


	<script src="/resources/modal/modal.js"></script>
	<script type="text/javascript">
	function login(frm){
		var commentData=$("form[name=chk]").serialize();
		alert("commentDate : " + commentData);
		$.ajax({
			url:"/loginchk.do",
			type:"post",
			data:commentData,
			dataType:"text",
			success: function(result){
				alert(result);
				if(result == "success"){
					alert("로그인 되었습니다.");
					window.location.reload();
	// 				frm.action = "/getVoteList.do";
	// 				frm.submit();
					return false;
				} else if (result == "fail") {
					alert("아이디비밀번호를 확인해 주세요");
					frm.id.value = "";
					frm.password.value = "";
					frm.id.focus();
					$("#msg").html("<div style='color: red;'><b>아이디 비밀번호를 확인해 주세요.</b></div>");
				}
			}
		});
	}
	</script>
</body>
</html>