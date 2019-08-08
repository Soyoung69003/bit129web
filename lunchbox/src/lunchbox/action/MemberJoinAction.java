package lunchbox.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberJoinAction implements Action{ 
	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        request.setCharacterEncoding("utf-8"); //한글처리 
        ActionForward forward = new ActionForward(); 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
        boolean result=false; 
         
        /*입력 정보를 memberVO객체에 저장*/ 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME")); 
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL")); 
        result=memberdao.joinMember(member); // dao에 joinmember메서드를 실행해서 회원가입처리         

        //회원가입 실패시 null반환 
        if(result==false){ 
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('아이디 중복');"); 
            out.println("location.href='./joinForm.jsp'"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }     
        //회원가입 성공 
        forward.setRedirect(false); 
        response.setContentType("text/html;charset=utf-8"); 
        PrintWriter out = response.getWriter(); 
        out.println("<script>"); 
        out.println("alert('회원가입 성공');"); 
        out.println("location.href='./MemberLogin.me'"); 
        out.println("</script>"); 
        out.close();
        return forward; 
    } 
}
