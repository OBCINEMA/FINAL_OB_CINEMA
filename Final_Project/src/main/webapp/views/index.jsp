<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<style>
.myForm{position: relative; width:calc(100% - 40px); margin: 20px; display: inline-block;}
.myForm input{display: none;}
.myForm label{float: left; line-height: 1.4}
.myForm label::before{
  width: 20px; 
  height: 20px; 
  border: 1px solid #2196F3;
  content: '';
  border-radius: 10px;
  float: left;
  margin:0 10px;
  cursor: pointer;
}
.myForm input[type=checkbox]:checked + label::after{display: block;}
.myForm label::after{
  display: none;
  top: 6px;
  left: 16px;
  content: '';
  color: #2196F3;
  position: absolute;
  width: 10px;
  height: 10px;
  background-color: #2196F3;
  border-radius: 5px;
  cursor: pointer;
}
.myForm1{position: relative; width:calc(100% - 40px); margin: 20px;}
.myForm1 input{display: none;}
.myForm1 label{float: left; line-height: 1.4}
.myForm1 label::before{
  width: 20px; 
  height: 20px; 
  border: 1px solid #F44336;
  background-color: #F44336;
  content: '';
  float: left;
  margin:0 10px;
  cursor: pointer;
}
.myForm1 input[type=checkbox]:checked + label::after{}
.myForm1 label::after{
  top: 1px;
  left: 15px;
  color: #fff;
  width: 10px;
  height: 10px;
  border-radius: 5px;
}




.myForm2{position: relative; width:calc(100% - 40px); margin: 20px; display: block;}
.myForm2 input{display: none;}
.myForm2 label{float: left; line-height: 1.4}
.myForm2 label::before{
  width: 20px; 
  height: 20px; 
  border: 1px solid #4CAF50;
  background-color: #4CAF50;
  border-radius: 2px;
  content: '';
  float: left;
  margin:0 10px;
  cursor: pointer;
}
.myForm2 input[type=checkbox]:checked + label::after{display: block;}
.myForm2 label::after{
  display: none;
  top: 0px;
  left: 17px;
  content: 'x';
  color: #fff;
  position: absolute;
  width: 10px;
  height: 10px;
  border-radius: 5px;
  cursor: pointer;
}


.myForm3{position: relative; width:calc(100% - 40px); margin: 20px; display: inline-block;}
.myForm3 input{display: none;}
.myForm3 label{float: left; line-height: 1.4}
.myForm3 label::before{
  width: 20px; 
  height: 20px; 
  border: 1px solid #9C27B0;
  background-color: #9C27B0;
  border-radius: 10px;
  content: '';
  float: left;
  margin:0 10px;
  cursor: pointer;
}
.myForm3 input[type=checkbox]:checked + label::after{display: block;}
.myForm3 label::after{
  display: none;
  top: 0px;
  left: 15px;
  content: '✔';
  color: #fff;
  position: absolute;
  width: 10px;
  height: 10px;
  border-radius: 5px;
  cursor: pointer;
}


</style>
<head>
<meta charset="UTF-8">
<title>시작페이지</title>
<script>
	function openWin(){  
	    window.open("http://www.naver.net", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	}  
</script>
</head>
<body>

<div id="container">
	<h1>게시판 프로그램</h1>
	<hr>
	<p><a href="../login.do">로그인</a></p>
	<p><a href="../getBoardList.do">글 목록 보러가기</a></p>
	<p><a href="welcome.jsp">단순 index페이지에서 페이지전환 welcome.jsp 열어보기</a></p>
	
	<p><a href="/movieDetail.do?m_id=1">영화 정보</a></p>
	
	<input type=button onclick="openWin();">
	
	<p><a href="../payTest.do">결제테스트</a></p>
	
<!-- 	<form class="myForm" action="#">
	<input type="checkbox" name="myCheckBox" id="checkbox">
	<label for="checkbox">My checkbox</label>
	</form>
	<form class="myForm1" action="#">
	<input type="checkbox" name="myCheckBox" id="checkbox">
	<label for="checkbox">My checkbox</label>
	</form> -->
	
	<label class="myForm2">
	<input type="checkbox myForm2" name="sadassa" id="111">
	<label for="111">My checkbox</label>
	</label>
		<label class="myForm2">
	<input type="checkbox" name="sadassa" id="11">
	<label for="11">My checkbox</label>
	</label>
		<label class="myForm2">
	<input type="checkbox" name="sadassa" id="1">
	<label for="1">My checkbox</label>
	</label>
	
	
<!-- 	<form class="myForm3" action="#">
	<input type="checkbox" name="myCheckBox" id="checkbox">
	<label for="checkbox">My checkbox</label>
	</form> -->
</div>

</body>
</html>