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
         
        int result=-1; // ?๋ ?์ด??
        
        //๋ก๊ทธ?ธํผ?์ ?๋ ฅ?? ๊ฐ์ MemberVO๊ฐ์ฒด?? ??? 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        result=memberdao.isMember(member);
         
        //๋ก๊ทธ?? ?คํจ
        if(result==0){ //๋น๋?๋ฒํธ ๋ถ์ผ์น?
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('๋น๋?๋ฒํธ๋ฅ? ?์ธ?ด์ฃผ?ธ์');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //?์ด?? ?์
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('?์ด?๊? ์กด์ฌ?์? ?์ต?๋ค.');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //๋ก๊ทธ?? ?ฑ๊ณต
        session.setAttribute("id", member.getMEMBER_ID());
        System.out.println("?ธ์ ๋ฐ์ธ?? ?๋ฃ");
        forward.setRedirect(true);//?์ reset
//        forward.setPath("./BoardList.do");//?๋ ?ผ๋ฃจ ๊ฐ?? ?๋??
//        forward.setPath("boardList.jsp");//?์?์ค?ธ์ฉ
        forward.setPath("main.jsp");
        return forward; 
    } 
}


