package com.kh.tripick.member.model.service;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tripick.common.email.CertVo;
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

@Override
public int idCheck(String checkId) {
	return memberDao.idCheck(sqlSession, checkId);
}

@Override
public int NickNameCheck(String checkNickName) {
	return memberDao.NickNameCheck(sqlSession, checkNickName);
}

@Override
public String sendMail(String ip) {
	
	String secret = this.generateSecret();
	
	CertVo certVo = CertVo.builder()
						  .who(ip)
						  .secret(secret)
						  .build();
	memberDao.insertSecret(sqlSession, certVo);
	
	return secret;
}

public String generateSecret() {
	
	Random d = new Random();
	int n = d.nextInt(100000);
	Format f = new DecimalFormat("000000");
	String secret = f.format(n);
	
	return secret;
}


@Override
public boolean validate(CertVo certVo) {
	
	return memberDao.validate(sqlSession, certVo);
	
}

@Override
public Member findId(Member m) {
	return memberDao.findId(sqlSession,m);
}

@Override
public Member findPwd(Member m) {
	return memberDao.findPwd(sqlSession, m);
}

@Override
public int changePwd(Member m) {
	return memberDao.changePwd(sqlSession,m);
} 









}
