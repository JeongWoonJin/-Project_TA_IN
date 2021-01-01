package com.project.tain.member.model.service;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.tain.member.model.dao.MemberRegDao;
import com.project.tain.member.model.vo.MemberRegVO;

@Service
public class MemberRegServicelmpl implements MemberRegService{
	@Autowired
	private MemberRegDao dao;
	
	@Autowired
	private static Hashtable<String, String> loginmember = new Hashtable<String, String>();
	@Override
	public boolean login(MemberRegVO vo, HttpSession session) throws Exception {
		boolean isLogin = isLogin(vo.getM_id()); 
		if (!isLogin) { 
			boolean result = dao.login(vo); 
			if (result) { setSession(session, vo); 
			} 
			return result; 
			} 
		return !isLogin;

	}

	private void setSession(HttpSession session, MemberRegVO vo) {	
		loginmember.put(session.getId(), vo.getM_id());
		session.setAttribute("id", vo.getM_id());
	}

	private boolean isLogin(String m_id) {
		boolean isLogin = false;
		Enumeration<String> e = loginmember.keys();
		String key = "";
		
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if(m_id.equals(loginmember.get(key)))
				isLogin = true;
		}
		
		return false;
	}

	@Override
	public void join(MemberRegVO vo) throws Exception {
		vo.setM_id(vo.getM_id());
		vo.setM_pw(vo.getM_pw());
		vo.setM_name(vo.getM_name());
		vo.setM_birth(vo.getM_birth());
		vo.setM_phone(vo.getM_phone());
		vo.setM_email(vo.getM_email());
		vo.setM_language(vo.getM_language());
		vo.setM_usage(vo.getM_usage());
		vo.setM_addr1(vo.getM_addr1());
		vo.setM_addr2(vo.getM_addr2());
		vo.setM_addr3(vo.getM_addr3());
	
	}

	@Override
	public List<MemberRegVO> memberFindId(MemberRegVO vo) throws Exception {
		return dao.memberFindId(vo);
	}

	@Override
	public String memberFindPw(MemberRegVO vo) throws Exception {
		return dao.memberFindPw(vo);
	}

	@Override
	public int idcheck(String id) throws Exception {
		return dao.idcheck(id);
	}
	@Override 
	public void memberLogout(HttpSession session) throws Exception { 
		loginmember.remove(session.getId()); 
		session.invalidate(); }



}
