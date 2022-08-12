package com.kh.tripick.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tripick.member.model.service.MemberService;
import com.kh.tripick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		 
		return "member/loginForm";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		
		// /WEB-INF/views/member/memberenrollForm.jsp
		return "member/enrollForm";
		
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
									HttpSession session,
									ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
			if(loginUser == null) {
				
				mv.addObject("errorMsg", "로그인 실패! ");
				mv.setViewName("common/errorPage");
			} else {
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");			
			}
			
			return mv;		
	  }
	
	
	
	@RequestMapping("logout.me") 
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		int result = memberService.insertMember(m);
		
			if(result > 0) { // 성공 -> 메인페이지 url 재요청
				session.setAttribute("alertMsg",  "성공적으로 회원가입이 되었습니다.");
			
				
				return "redirect:/";
			} else {  // 실패 => 에러문구를 담아서 에러페이지로 포워딩
				
				model.addAttribute("errorMsg", "회원가입 실패");
				return "common/errorPage";
				
			}
		
	}
	
	@RequestMapping("find.id-pwd")
	public String findForm() {
		
		return "member/findForm";
	}
	
	
	
	
	
	
	

}
