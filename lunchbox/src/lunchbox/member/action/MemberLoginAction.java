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
         
        int result=-1; // ?†ëŠ” ?„ì´??
        
        //ë¡œê·¸?¸í¼?ì„œ ?…ë ¥?? ê°’ì„ MemberVOê°ì²´?? ?€?? 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        result=memberdao.isMember(member);
         
        //ë¡œê·¸?? ?¤íŒ¨
        if(result==0){ //ë¹„ë?ë²ˆí˜¸ ë¶ˆì¼ì¹?
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('ë¹„ë?ë²ˆí˜¸ë¥? ?•ì¸?´ì£¼?¸ìš”');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //?„ì´?? ?†ìŒ
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('?„ì´?”ê? ì¡´ì¬?˜ì? ?ŠìŠµ?ˆë‹¤.');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //ë¡œê·¸?? ?±ê³µ
        session.setAttribute("id", member.getMEMBER_ID());
        System.out.println("?¸ì…˜ ë°”ì¸?? ?„ë£Œ");
        forward.setRedirect(true);//?‘ì† reset
//        forward.setPath("./BoardList.do");//?ë˜ ?¼ë£¨ ê°€?? ?˜ëŠ”??
//        forward.setPath("boardList.jsp");//?„ì‹œ?ŒìŠ¤?¸ìš©
        forward.setPath("main.jsp");
        return forward; 
    } 
}


