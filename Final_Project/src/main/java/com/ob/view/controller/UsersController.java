package com.ob.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

@Controller
public class UsersController {
   @Autowired
   private UsersService usersService;

   @RequestMapping(value = "idchk.do", method = RequestMethod.POST)
   public @ResponseBody String idCHK(UsersVO vo, HttpSession session) {
      System.out.println("넘어온 데이터" + vo.getId());
      int getID = usersService.idcheck(vo);
      System.out.println(getID);

      // 입력된 아이디가 있을 경우
      if (getID == 1) {
         // jsp 전달용
         return "1";

         // 입력된 아이디가 없고 사용할 수 있을때.
      } else if (getID == 0) {
         return "0";

      } else
         // 다른 오류 일떄
         return "2";

   }
   
   @RequestMapping(value = "/signUP.do", method = RequestMethod.POST)
   public @ResponseBody String signUP(UsersVO vo, HttpSession session) {
      System.out.println("입력받은 vo" + vo);
      System.out.println("회원가입 받은 아이디: " + vo.getId());
      System.out.println("회원가입 받은 비밀번호: " + vo.getPassword());
      System.out.println("회원가입 받은 이름: " + vo.getName());
      System.out.println("회원가입 받은 생일: " + vo.getBirth());
      System.out.println("회원가입 받은 전화번호: " + vo.getPhone());
      System.out.println("회원가입 받은 이메일: " + vo.getEmail());
      vo.setGrade(1);
      System.out.println("다시확인" + vo);

      usersService.insertUsers(vo);

      return "success";
   }
   
   //추가 EMAIL
   @RequestMapping(value = "/addEmail.do", method = RequestMethod.POST)
   public @ResponseBody String addEmail(UsersVO vo, HttpSession session) {
      System.out.println("입력받은 vo" + vo);   
      
      System.out.println("회원가입 받은 인덱스: " + vo.getU_id());
      System.out.println("회원가입 받은 이메일: " + vo.getEmail());
      int result = usersService.updateUsersEmail(vo);
      System.out.println(result +" 건 처리됨");

      return "success";
   }

}