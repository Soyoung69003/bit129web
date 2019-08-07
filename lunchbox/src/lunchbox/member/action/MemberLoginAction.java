package lunchbox.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberLoginAction implements Action { 

	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        ActionForward forward = new ActionForward(); 
        HttpSession session = request.getSession();
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
         
        int result=-1; // ?�는 ?�이??
        
        //로그?�폼?�서 ?�력?? 값을 MemberVO객체?? ?�?? 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        result=memberdao.isMember(member);
         
        //로그?? ?�패
        if(result==0){ //비�?번호 불일�?
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('비�?번호�? ?�인?�주?�요');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //?�이?? ?�음
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('?�이?��? 존재?��? ?�습?�다.');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //로그?? ?�공
        session.setAttribute("id", member.getMEMBER_ID());
        System.out.println("?�션 바인?? ?�료");
        forward.setRedirect(true);//?�속 reset
//        forward.setPath("./BoardList.do");//?�래 ?�루 가?? ?�는??
//        forward.setPath("boardList.jsp");//?�시?�스?�용
        forward.setPath("main.jsp");
        return forward; 
    } 
}


