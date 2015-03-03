package com.web.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MemberDAO;
import com.web.vo.MemberVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	public MemberVO getMemberInfo() {
		return memberDAO.getMemberInfo();
	}

	public String idCheck(String usrId) {
		return memberDAO.idCheck(usrId);
	}

	public boolean login(Map<String, String> param) {
		return memberDAO.login(param);
	}

	public void join(MemberVO formVo) {
		memberDAO.join(formVo);
	}

}
