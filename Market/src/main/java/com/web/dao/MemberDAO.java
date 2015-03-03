package com.web.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public MemberVO getMemberInfo(){
		MemberVO result = sqlSession.selectOne("memberMapper.getMemberInfo");
		return result;
	}

	public String idCheck(String usrId) {
		String result = "false";
		int isUsable = sqlSession.selectOne("memberMapper.idCheck", usrId);
		if(isUsable < 1){
			result = "true";
		}
		return result;
	}

	public boolean login(Map<String, String> param) {
		boolean result = false;
		int isUsable = sqlSession.selectOne("memberMapper.login", param);
		if(isUsable == 1){
			result = true;
		}
		return result;
	}

	public void join(MemberVO formVo) {
		sqlSession.insert("memberMapper.join", formVo);
	}

}
