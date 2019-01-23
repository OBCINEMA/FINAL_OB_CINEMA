<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<style>
#myBtn {
	width: 300px;
	padding: 10px;
	font-size: 20px;
	position: absolute;
	margin: 0 auto;
	right: 0;
	left: 0;
	bottom: 50px;
	z-index: 9999;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	  $("#sendemailgo").click(function(){
	    var email = $('#email').val();
		if (email == '') {
			alert('이메일을 입력하세요');
			$("#email").focus();
			return false;
		} else {
			var emailRegex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if (!emailRegex.test(email)) {
				alert('이메일 주소가 유효하지 않습니다. ex)abc@gmail.com');
				$("#email").focus();
				return false;
			}
		}
		$.ajax({
			url:"<%=contextPath%>/addEmail.do",
			type:"post",
			   data : {"u_id":"${Logininformation.u_id}",email:$("#email").val()} ,
			dataType:"text",
			success: function(result){
			 	//alert(result);
				if(result == "success"){
					alert("정상처리 되었습니다.");
					location
					.replace("<%=contextPath%>/mainGO.do");
								return false;
							}

						}
					});
	  });
	});
			
</script>

</head>
<body onload="myFunction()">
<body>

	<div class="container">

		<!-- Modal -->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">필수 입력사항</h4>
					</div>
					<div class="modal-body">
						이메일 <input type="email" name="email" placeholder="입력해주세요"
							id="email">
						<button class="cr-btn" type="button" id="sendemailgo">
							<span>가입신청</span>
						</button>
					</div>
				</div>

			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$("#myModal").modal("show");

			$("#myModal").on('hide.bs.modal', function() {
				alert('The modal is about to be hidden.');
				
			});
		});
	</script>




<script>
	function myFunction() {
		alert("이메일은 필수로 입력해야합니다.");
	}
</script>

</body>
</html>