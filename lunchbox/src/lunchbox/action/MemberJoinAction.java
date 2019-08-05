package lunchbox.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberJoinAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        request.setCharacterEncoding("utf-8"); //�ѱ�ó�� 
        ActionForward forward = new ActionForward(); 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
        boolean result = false; 
         
        /*�Է� ������ MemberVO��ü�� ����*/ 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME")); 
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL")); 
        result=memberdao.addMember(member); // dao�� joinmember�޼��带 �����ؼ� ȸ������ó��         

        //ȸ������ ���н� null��ȯ 
        if(result == false){ 
            System.out.println("ȸ������ ����"); 
            return null; 
        }     
        //ȸ������ ���� 
        forward.setRedirect(true); 
        forward.setPath("./MemberLogin.do");         
        return forward; 
    }
}