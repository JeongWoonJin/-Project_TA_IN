package com.project.tain.member.model.service;

import com.project.tain.member.model.vo.BusinessMemberVO;
import com.project.tain.member.model.vo.MemberRegVO;

public interface MemberRegService {
	public int check_id(String m_id) throws Exception;

	public int check_email(String m_email) throws Exception;

	int join(MemberRegVO vo) throws Exception;
	int businessJoin(BusinessMemberVO vo) throws Exception;

//	String create_key() throws Exception;

	int approval_member(MemberRegVO vo);

	MemberRegVO login(MemberRegVO vo) throws Exception;

	String find_id(String email) throws Exception;

//	void send_mail(MemberRegVO vo, String div) throws Exception;

	void find_pw(MemberRegVO vo)  throws Exception;

//	int join(MemberRegVO vo) throws Exception;

	// �α��� ���� �ð� ������Ʈ
	int update_log(MemberRegVO vo)  throws Exception;
	
	// �н����� ã��-�н����� ������Ʈ
	int update_pw(MemberRegVO vo) throws Exception;
}
