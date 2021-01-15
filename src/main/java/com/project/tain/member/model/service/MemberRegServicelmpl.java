package com.project.tain.member.model.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.tain.member.model.dao.MemberRegDao;
import com.project.tain.member.model.vo.MemberRegVO;

@Service
public class MemberRegServicelmpl implements MemberRegService {
	@Autowired
	private MemberRegDao dao;

	// ���̵� �ߺ� �˻�(AJAX)
	@Override
	public int check_id(String m_id) throws Exception {
		return dao.check_id(m_id);
	}

	// �̸��� �ߺ� �˻�(AJAX)
	@Override
	public int check_email(String m_email) throws Exception {
		return dao.check_email(m_email);
	}


	// ȸ������
	@Override
	public int join(MemberRegVO vo) throws Exception {
		if (dao.check_id(vo.getM_id()) == 1) {
			return -1;
		} else if (dao.check_email(vo.getM_email()) == 1) {
			return -2;
		} else {
			dao.join(vo);
			return 1;
		}
	}

   
   // ȸ�� ����
   @Override
   @Transactional
   public int approval_member(MemberRegVO vo) {
      return dao.approval_member(vo);
   }

   // �α���
   @Override
   public MemberRegVO login(MemberRegVO vo, HttpServletResponse response) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      // ��ϵ� ���̵� ������
      if (dao.check_id(vo.getM_id()) == 0) {
         out.println("<script>");
         out.println("alert('��ϵ� ���̵� �����ϴ�.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         String m_pw = vo.getM_pw();
         vo = dao.login(vo.getM_id());
         // ��й�ȣ�� �ٸ� ���
         if (!vo.getM_pw().equals(m_pw)) {
            out.println("<script>");
            out.println("alert('��й�ȣ�� �ٸ��ϴ�.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
            // �̸��� ������ ���� ���� ���
         } else if (!vo.getApproval_status().equals("true ")) {
            out.println("<script>");
            out.println("alert('�̸��� ���� �� �α��� �ϼ���.');");
            out.println("history.go(-1);");
            out.println("</script>");
            out.close();
            return null;
            // �α��� ���� ������Ʈ �� ȸ������ ����
         } else {
            dao.update_log(vo.getM_id());
            return vo;
         }
      }
   }

   // ���̵� ã��
   @Override
   public String find_id(HttpServletResponse response, String m_email) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      String m_id = dao.find_id(m_email);

      if (m_id == null) {
         out.println("<script>");
         out.println("alert('���Ե� ���̵� �����ϴ�.');");
         out.println("history.go(-1);");
         out.println("</script>");
         out.close();
         return null;
      } else {
         return m_id;
      }
   }

   // ��й�ȣ ã��
   @Override
   public void find_pw(HttpServletResponse response, MemberRegVO vo) throws Exception {
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out = response.getWriter();
      // ���̵� ������
      if (dao.check_id(vo.getM_id()) == 0) {
         out.print("���̵� �����ϴ�.");
         out.close();
      }
      // ���Կ� ����� �̸����� �ƴϸ�
      else if (!vo.getM_email().equals(dao.login(vo.getM_id()).getM_email())) {
         out.print("�߸��� �̸��� �Դϴ�.");
         out.close();
      } else {
         // �ӽ� ��й�ȣ ����
         String m_pw = "";
         for (int i = 0; i < 12; i++) {
            m_pw += (char) ((Math.random() * 26) + 97);
         }
         vo.setM_pw(m_pw);
         // ��й�ȣ ����
         dao.update_pw(vo);
         // ��й�ȣ ���� ���� �߼�
//         send_mail(vo, "find_pw");

         out.print("�̸��Ϸ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
         out.close();
      }
   }


}
