package com.kh.tripick.member.model.service;

import com.kh.tripick.common.email.CertVo;
import com.kh.tripick.member.model.vo.Member;

public interface MemberService {

	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
		
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	// 아이디 중복체크용 서비스(select)
	int idCheck(String checkId);
	
	// 닉네임 중복체크용 서비스(select)
	int NickNameCheck(String checkNickName);
	
	// 이메일 전송 서비스(select)
	String sendMail(String ip);
	
	// 인증번호 전송자 확인용
	boolean validate(CertVo build);
	
	// 아이디 찾기
	Member findId(Member m);
	
	// 비밀번호 찾기
	Member findPwd(Member m);

	int changePwd(Member m);


}
 