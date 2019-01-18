<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>


<!-- Bootstrap core CSS -->
<link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- weclome.css -->
<link href="../resources/bootstrap/css/welcome.css" rel="stylesheet">

<style type="text/css">

</style>


<meta charset="UTF-8">
<title>시작페이지</title>
</head>
<body>
<!-- ----------------------------------------------------------------------------------- -->
<div id="header">
<div>
  <a href="#default" id="logo">CompanyLogo</a>
</div>
  <div id="navbar-right">
    <!-- <a class="active" href="#home">로그인</a> -->
    <a href="login.jsp">로그인</a>
    <a href="#contact">회원가입</a>
    <a href="#about">고객센터</a>
  </div>

</div>
  



<div style="margin-top:210px;padding:15px 15px 2500px;font-size:30px">
  <p><b>This example demonstrates how to shrink a navigation bar when the user starts to scroll the page.</b></p>
  <p>Scroll down this frame to see the effect!</p>
  <p>Scroll to the top to remove the effect.</p>
  <p><b>Note:</b> We have also made the navbar responsive, resize the browser window to see the effect.</p>
  <p>Lorem ipsum dolor dummy text to enable scrolling, sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
</div>


<div class="footer">
  <h2>Footer</h2>
</div>



<!-- =--------------------------------------- -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/js/bootstrap.js"></script>
		
<script>
// When the user scrolls down 80px from the top of the document, resize the navbar's padding and the logo's font size
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 80 || document.documentElement.scrollTop > 80) {
    document.getElementById("header").style.padding = "10px 10px";
    document.getElementById("logo").style.fontSize = "25px";
  } else {
    document.getElementById("header").style.padding = "40px 10px";
    document.getElementById("logo").style.fontSize = "35px";
  }
}
</script>


</body>
</html>