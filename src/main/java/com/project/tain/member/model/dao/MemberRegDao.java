package com.project.tain.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.vo.MemberRegVO;

@Repository
public class MemberRegDao {
	@Autowired
	SqlSession sqlSession;
	private static final String NameSpace = "MemberRegMapper";

	// ȸ������
	@Transactional
	public int join(MemberRegVO vo) throws Exception {
		return sqlSession.insert(NameSpace + ".join", vo);
	}

	// ���̵� �ߺ� �˻�
	public int check_id(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".check_id", m_id);
	}

	// �̸��� �ߺ� �˻�
	public int check_email(String m_email) throws Exception {
		System.out.println("dao check_email: "+m_email );
		return sqlSession.selectOne(NameSpace + ".check_email", m_email);
	}

	// �̸��� ����
	@Transactional
	public int approval_member(MemberRegVO vo) throws Exception {
		return sqlSession.update(NameSpace + ".approval_member", vo);
	}

	// �α��� �˻�
	public MemberRegVO login(String m_id) throws Exception {
		return sqlSession.selectOne(NameSpace + ".login", m_id);
	}

	// �α��� �������� ����
	@Transactional
	public int update_log(String m_id) throws Exception {
		return sqlSession.update(NameSpace + ".update_log", m_id);
	}

	// ���̵� ã��
	public String find_id(String m_email) throws Exception {
		return sqlSession.selectOne(NameSpace + ".find_id", m_email);
	}

	// ��й�ȣ ����
	@Transactional
	public int update_pw(MemberRegVO vo) throws Exception {
		return sqlSession.update(NameSpace +".update_pw", vo);
	}
}
