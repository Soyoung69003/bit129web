package lunchbox.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberLogoutAction implements Action{ 
	@Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception { 
        request.setCharacterEncoding("utf-8"); //한글처리 
        ActionForward forward = new ActionForward(); 
        HttpSession session = request.getSession();
        
			session.invalidate();
			response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('로그아웃 되었습니다.');"); 
            out.println("location.href='./main.jsp';"); 
            out.println("</script>"); 
            out.close(); 
            System.out.println("로그아웃 성공");
		return forward;
	}
}
