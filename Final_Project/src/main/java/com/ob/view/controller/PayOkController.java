package com.ob.view.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

public class PayOkController {
	@RequestMapping("payOk.do")
	@ResponseBody
	public void payOk(String imp_uid) {
		imp_uid = imp_uid; //post ajax request로부터 imp_uid확인

//		payment_result = rest_api_to_find_payment(imp_uid) //imp_uid로 아임포트로부터 결제정보 조회
//		amount_to_be_paid = query_amount_to_be_paid(payment_result.merchant_uid) //결제되었어야 하는 금액 조회. 가맹점에서는 merchant_uid기준으로 관리
//
//		if (payment_result.status == 'paid' and payment_result.amount == amount_to_be_paid) {
//			success_post_process(payment_result) //결제까지 성공적으로 완료}
//		}
//		else if (payment_result.status == 'ready' and payment.pay_method == 'vbank') {
//			vbank_number_assigned(payment_result) //가상계좌 발급성공
//		}
//		else 
//			fail_post_process(payment_result) //결제실패 처리
	}

}
