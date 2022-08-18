package com.kh.tripick.member.model.service;

import com.kh.tripick.member.model.vo.Member;

public interface MemberService {

	
	// 로그인 서비스 (select)
	Member loginMember(Member m);
		
	// 회원가입 서비스(insert)
	int insertMember(Member m);
	
	// 아이디 중복체크용 서비스(select)
	int idCheck(String checkId);
}
 