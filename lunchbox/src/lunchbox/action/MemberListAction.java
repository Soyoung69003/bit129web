package lunchbox.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.model.member.MemberDAO;

public class MemberListAction implements Action{ 
	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        ActionForward forward = new ActionForward(); 
        HttpSession session = request.getSession(); 
        MemberDAO memberdao = new MemberDAO(); 
        List memberlist = new ArrayList(); 
         
        String id=(String)session.getAttribute("id"); 
        if(id==null){ //���̵� ������ �α��� â�� ��� 
            forward.setRedirect(true); 
            forward.setPath("./MemberLogin.do"); 
            return forward; 
        }else if(!id.equals("admin")){ //�����ڰ� �ƴϸ� �׳� �Խ��� ����Ʈ�� �̵� 
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('�����ڰ� �ƴմϴ�.')"); 
            out.println("location.href='./BoardList.bo'"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        } 
        //daoŬ�������� getmemberlist�޼ҵ带 �̿� �������Ʈ�� �޾ƿ�. 
        memberlist=memberdao.getMemberList();  
        if(memberlist==null){ //�������Ʈ�� null�̸� 
            System.out.println("ȸ�� ��� �б� ����");             
            return null; 
        } 
        request.setAttribute("memberlist", memberlist); 
        forward.setRedirect(false); 
        forward.setPath("./member/member_list.jsp"); 
        return forward; 
    } 
}