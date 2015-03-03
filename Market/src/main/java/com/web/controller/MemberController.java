package com.web.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.MemberService;
import com.web.vo.MemberVO;

@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/member/joinPage.do")
	public String joinPage() {
		return "joinPage";
	}
	

	@RequestMapping(value = "/member/idCheck.do")
	@ResponseBody
	public String idCheck(@RequestParam Map<String, String> param) {
		String usrId = param.get("usrId");
		String result = "test";
		result = memberService.idCheck(usrId);
		return result;
	}
	
	@RequestMapping(value = "/member/login.do")
	@ResponseBody
	public String login(@RequestParam Map<String, String> param) {
		boolean	result = memberService.login(param);
		
		return (result == true) ? "1" : "0";
	}
	
	@RequestMapping(value = "/member/join.do")
	public ModelAndView join(@ModelAttribute("userInfo") MemberVO formVo, @RequestParam Map<String, String> param) {
		ModelAndView mv = new ModelAndView("main");
		memberService.join(formVo);
		
		mv.addObject("id", formVo.getUsr_id());
		mv.addObject("pw", formVo.getPw());
		return mv;
	}
	
}
