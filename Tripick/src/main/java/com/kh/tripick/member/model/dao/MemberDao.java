package com.kh.tripick.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.tripick.common.email.CertVo;
import com.kh.tripick.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
		
		 
	}

	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int NickNameCheck(SqlSessionTemplate sqlSession, String checkNickName) {
		return sqlSession.selectOne("memberMapper.NickNameCheck", checkNickName);
		
	}
	
	public int emailCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("memberMapper.emailCheck", checkEmail);
	}

	public void insertSecret(SqlSessionTemplate sqlSession, CertVo certVo) {
		
		 sqlSession.insert("memberMapper.regist", certVo);
	}

	public boolean validate(SqlSessionTemplate sqlSession, CertVo certVo) {
	CertVo result = sqlSession.selectOne("memberMapper.validate",certVo);
		
		if(result != null) {
			
			sqlSession.delete("memberMapper.remove", certVo);
		}
		return result != null;
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findId", m);
		
		
	}

	public Member findPwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.findPwd", m);
		
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.changePwd", m);
	}



}
