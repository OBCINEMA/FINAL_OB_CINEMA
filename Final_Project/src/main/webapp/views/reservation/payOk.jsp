<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 경로 /biz 부터 시작  [http://localhost:8080/biz/ @@.do 요청 하기 위해]
	String contextPath = request.getContextPath();
	// theme 까지 들어온 경로 
	String KPath = contextPath + "/resources/theme";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<%=KPath%>/js/vendor/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
var IMP = window.IMP; // 생략가능
IMP.init('imp78918944'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

IMP.request_pay({
    pg : 'inicis',
    pay_method : '${pay_info.pay_type}',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : "${totPrice}",
    buyer_email : "${usersVO.email}",
    buyer_name : "${usersVO.name}",
    buyer_tel : "${usersVO.phone}",
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	$.ajax({
    		type: 'POST',
    		dataType: 'text',
    		url: "payOk.do", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    		success : function(data) {
    			var datachk = data;
    			alert("데이터 : " + datachk);
    			$("#okok").html("데이터성공 " + datachk);
    		},
    		error : function(jqXHR, textStatus, errorThrown) {
		        alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		        $("#okok").html("데이터실패 " + jqXHR, textStatus, errorThrown);
		    }
    	})
    	/* .done(function(data) {
    		alert("data : " + data);
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	}); */
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    }
});
</script>
</head>
<body>
결제내역 : <div id="okok"></div>

</body>
</html>