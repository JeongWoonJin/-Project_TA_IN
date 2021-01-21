package com.project.tain.member.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.dao.MemberRegDao;
import com.project.tain.member.model.vo.BusinessMemberVO;
import com.project.tain.member.model.vo.MemberRegVO;

@Service
public class MemberRegServicelmpl implements MemberRegService {
	@Autowired
	private MemberRegDao dao;

	// ���̵� �ߺ� �˻�(AJAX) //1: �����ϴ� id, 0: ���� id
	@Override
	public int check_id(String m_id) throws Exception {
		return dao.check_id(m_id);
	}

	// �̸��� �ߺ� �˻�(AJAX) //1: �����ϴ� id, 0: ���� id
	@Override
	public int check_email(String m_email) throws Exception {
		return dao.check_email(m_email);
	}

	// �Ϲ� ȸ�� ����
	@Override
	public int join(MemberRegVO vo) throws Exception {
		if (dao.check_id(vo.getM_id()) == 1) {
			return -1;   // �Ϲ�ȸ�� �� ���� id�� ����ϴ� ȸ���� ����.
		} else if (dao.check_email(vo.getM_email()) == 1) {
			return -2;	// �Ϲ�ȸ�� �� ���� �̸����� ����ϴ� ȸ���� ����.
		} else {
			return dao.join(vo);   // 0: ȸ�����Խ���, 1:gȸ�����Լ���
		}
	}

	// �Ϲ� ȸ�� ����
	@Override
	@Transactional
	public int approval_member(MemberRegVO vo) {
		return dao.approval_member(vo);
	}

	// ����Ͻ� ȸ�� ����
	@Override
	@Transactional
	public int businessJoin(BusinessMemberVO vo) throws Exception {
		if (dao.check_id(vo.getM_id()) == 0) {
			return -1;   // �Ϲ�ȸ�� �ƴ�
		} else if (!dao.login(vo.getM_id()).getApproval_status().equals("true ")) {
			return -2;   // �Ϲ�ȸ�� �������� ���� ���� ����
		} else {
			String result = dao.check_businessId(vo);
			System.out.println("result:"+ result);
			if (result == null) {
				return dao.businessJoin(vo);   
			} else if(result.equals("N")) {
				return -4;  
			} else if(result.equals("Y")) {
				return -3;   
			}
			return 0;
		}		
	}
	
	// ����Ͻ� ȸ�� ����
//	@Override
	@Transactional
	public int approval_businessMember(BusinessMemberVO vo) {
//		int result1= dao.approval_member1(vo);
//		int result2= dao.approval_member2(vo);
		return 0;  // result1&result2;
	}
	
	// �α���
	@Override
	public MemberRegVO login(MemberRegVO vo) throws Exception {
		vo = dao.login(vo.getM_id());
		// dao.update_log(vo.getM_id());
		return vo;
	}

	// ���̵� ã��
	@Override
	public String find_id(HashMap<String, Object> voMap) throws Exception {
		return dao.find_id(voMap);
	}

	// ��й�ȣ ã��
	@Override
	public void find_pw(MemberRegVO vo) throws Exception {
		return;
	}

	// �α��� ���� �ð� ������Ʈ
	@Override
	public int update_log(MemberRegVO vo) throws Exception {
		return dao.update_log(vo.getM_id());
	}

	// �н����� ã��-�н����� ������Ʈ
	@Override
	public int update_pw(MemberRegVO vo) throws Exception {
		return dao.update_pw(vo);
	}

}