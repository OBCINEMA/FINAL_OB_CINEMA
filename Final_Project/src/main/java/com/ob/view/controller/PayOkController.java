package com.ob.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.Pay_infoService;
import com.ob.biz.service.ReservationService;
import com.ob.biz.vo.Pay_infoVO;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.UsersVO;
@Controller
public class PayOkController {
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private Pay_infoService pay_infoService;
	
	@RequestMapping("payOk.do")
	@ResponseBody
	public String payOk(HttpSession session, Pay_infoVO vo) {
		session.getAttribute("reservationList");
		System.out.println("session.getAttribute(\"reservationList\")" + session.getAttribute("reservationList"));
		
		List<ReservationVO> list = (List) session.getAttribute("reservationList");
		System.out.println("list " + list);
		
		vo = (Pay_infoVO) session.getAttribute("pay_info");
		
		int totPrice = (int) session.getAttribute("totPrice");
		vo.setPay_price(totPrice);
		
		UsersVO usersVO = (UsersVO) session.getAttribute("usersVO");
		vo.setU_id(usersVO.getU_id());
		
		pay_infoService.insertPay_info(vo);
		
		for (ReservationVO reservationOne : list) {
			reservationService.insertReservation(reservationOne);
		};
		
//		imp_uid = imp_uid; //post ajax request로부터 imp_uid확인
//		System.out.println("imp_uid : " + imp_uid);

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
		
		return "pass";
	}

}
