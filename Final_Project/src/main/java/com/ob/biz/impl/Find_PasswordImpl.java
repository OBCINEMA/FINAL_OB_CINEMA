package com.ob.biz.impl;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.Find_PasswordDAO;
import com.ob.biz.service.Find_PasswordService;
import com.ob.biz.vo.UsersVO;

// @Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("find_PasswrodService")
public class Find_PasswordImpl implements Find_PasswordService {
	@Autowired
	private Find_PasswordDAO find_PasswordDAO;

	@Override
	public String send_mail(UsersVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "gukbongworld@gmail.com";
		String hostSMTPpwd = "bitcamp1!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "gukbongworld@gmail.com";
		String fromName = "Spring Homepage";
		String subject = "안녕하세요";
		String msg = "";

		if (div.equals("find_pw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPassword() + "</p></div>";
		}
		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		return "mailsendOk";
	}

}
