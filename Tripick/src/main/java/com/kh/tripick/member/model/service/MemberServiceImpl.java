package com.kh.tripick.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.member.model.dao.MemberDao;
import com.kh.tripick.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	
@Autowired
private MemberDao memberDao;

@Autowired
private SqlSessionTemplate sqlSession;

@Override
public Member loginMember(Member m) {
	Member loginUser = memberDao.loginMember(sqlSession, m);
	System.out.println(loginUser);
	return memberDao.loginMember(sqlSession, m);
}

@Override
public int insertMember(Member m) {
	return memberDao.insertMember(sqlSession, m);
	}









}
