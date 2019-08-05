package lunchbox.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberLoginAction implements Action { 

	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        ActionForward forward = new ActionForward(); 
        HttpSession session = request.getSession(); //ȸ�� ���� ������ ���̵� ���ǿ� ����ؾ� �� 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
         
        int result=-1; // default -1(���̵� �������� ����) 
        
        //�α��������� �Է��� ���� MemberVO��ü�� ���� 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        result=memberdao.isMember(member); //ȸ������ �ƴ��� Ȯ�����ִ� �޼ҵ�
         
        //�α��� ����
        if(result==0){ //��й�ȣ ����ġ
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('��й�ȣ�� Ȯ�����ּ���');"); 
            out.println("location.href='./MemberLogin.do';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //���̵� ����
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('���̵� �������� �ʽ��ϴ�.');"); 
            out.println("location.href='./MemberLogin.do';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //�α��� ����
        session.setAttribute("id", member.getMEMBER_ID()); //���ǿ� id ���� ������ 
        forward.setRedirect(true);//���Ӳ����ٰ� �ٽÿ����ϸ鼭 ���ο� ������ �����ش�. 
        forward.setPath("./BoardList.do"); //�Խ��� ��� ���� ��û. 
        return forward; 
    } 
}

