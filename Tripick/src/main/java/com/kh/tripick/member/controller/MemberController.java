package com.kh.tripick.member.controller;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tripick.common.email.CertVo;
import com.kh.tripick.member.model.service.MemberService;
import com.kh.tripick.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	public JavaMailSenderImpl sender;
	
	
	// 로그인 폼으로 이동
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		 
		return "member/loginForm";
	}
	
	// 회원가입 폼으로 이동
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		
		// /WEB-INF/views/member/memberenrollForm.jsp
		return "member/enrollForm";
		
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m,
									HttpSession session,
									ModelAndView mv) {
		
		Member loginUser = memberService.loginMember(m);
		
			if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				session.setAttribute("loginUser", loginUser);
				mv.setViewName("redirect:/");			
				
			} else {
				
				session.setAttribute("alertMsg", "로그인실패");
				mv.setViewName("redirect:loginForm.me");
			}
			
			return mv;		
	  }
	
	
	// 로그아웃
	@RequestMapping("logout.me") 
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		m.setUserPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
			if(result > 0) { // 성공 -> 메인페이지 url 재요청
				session.setAttribute("alertMsg",  "성공적으로 회원가입이 되었습니다.");
			
				
				return "redirect:/";
			} else {  // 실패 => 에러문구를 담아서 에러페이지로 포워딩
				
				model.addAttribute("errorMsg", "회원가입 실패");
				return "common/errorPage";
				
			}
		
	}
	
	// 아이디, 비밀번호 찾기 폼으로 이동
	@RequestMapping("find.id-pwd")
	public String findForm() {
		
		return "member/findForm";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("idCheck.me") 
	public String idCheck(String checkId) {

		return memberService.idCheck(checkId) > 0 ? "NNNNN" : "NNNNY";
	   }
	
	// 닉네임 중복체크
	@ResponseBody
	@RequestMapping("NickNameCheck.me")
	public String NickNameCheck(String checkNickName) {
		
		
		return memberService.NickNameCheck(checkNickName) > 0 ? "NNNNN" : "NNNNY";
	}
	
	// 이메일 전송
	@ResponseBody
	@RequestMapping("input")
	public String input(String email, HttpServletRequest request) throws MessagingException {
		
		String ip = request.getRemoteAddr();
		
		
		String secret = memberService.sendMail(ip);
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setTo(email);
		helper.setFrom("Tripick@trip.co.kr");
		helper.setSubject("Tripick 인증번호 입니다!");
		helper.setText("<h1>인증번호 : " + secret + "</h1>" , true);
		
		sender.send(message);
		
		System.out.println(message);
		
		if(secret != null ) {
			
			return "Y";
		}else {
			
			return "N";
		}

	}	
	
	// 이메일 인증번호 확인
	@ResponseBody
	@RequestMapping("check")
	public String check(String secret, HttpServletRequest request) {
		
		boolean result = memberService.validate(CertVo.builder()
													  .who(request.getRemoteAddr())
													  .secret(secret)
													  .build());
		
		
		if(result != false) {
			
			return "Y";
		}else {
			
			return "N";
		}
	}
	
	// 아이디 찾기
	@ResponseBody
	@RequestMapping("findId")
	public String findId(String userName , String email) {
		
		Member m = new Member();
		m.setUserName(userName);
		m.setEmail(email);
		
		Member userId = memberService.findId(m);
		
		System.out.println(userId);
		
		if(userId == null) {
			
			return "noId";
			
		}else {
			
		
			return userId.getUserId();
		}
		
	}
	
	// 비밀번호 조회
	
	@ResponseBody
	@RequestMapping("findPwd")
	public String findPwd(String userId, String email) {
		
		Member m = new Member();
		m.setUserId(userId);
		m.setEmail(email);
		
		Member userPwd = memberService.findPwd(m);
		
		if(userPwd == null) {
			
			return "noPwd";
		}else {
			
			return userPwd.getUserPwd();
		}
				
	}
	
	// 비밀번호 변경 폼으로 이동
	@RequestMapping("changePwdForm")
	public String changePwdForm(String userId, String email, HttpSession session) {
		
		session.setAttribute("userId", userId);
		session.setAttribute("email", email);
		
		
		return "member/changePwdForm";
	}
	
	
	// 새 비밀번호 변경
	
	@RequestMapping("changePwd.me")
	public String changePwd(String newPwd, String userId, HttpSession session, Model model) {
		
		Member m = new Member();
		
		m.setUserPwd(newPwd);
		m.setUserId(userId);
		
		int result = memberService.changePwd(m);
		
		if(result > 0) {
			
			session.setAttribute("loginUser", memberService.loginMember(m));
			session.setAttribute("alertMsg", "비밀번호 변경 성공!");
				
		return "redirect:/";
		}else {
			
			model.addAttribute("errorMsg", "비밀번호 변경 실패!");
			return "redirect:changePwd.me";
		}
	}
	
	
}
