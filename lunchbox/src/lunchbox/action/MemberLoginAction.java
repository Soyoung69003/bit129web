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
        HttpSession session = request.getSession();
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
         
        int result=-1; // 없는 아이디
        
        //로그인폼에서 입력한 값을 MemberVO객체에 저장 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME")); 
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL")); 
        result=memberdao.isMember(member);
         
        //로그인 실패
        if(result==0){ //비밀번호 불일치
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('비밀번호를 확인해주세요');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //아이디 없음
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('아이디가 존재하지 않습니다.');"); 
            out.println("location.href='./MemberLogin.me';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //로그인 성공
        session.setAttribute("id", member.getMEMBER_ID());
        System.out.println("세션 바인딩 완료");
        forward.setRedirect(true);//접속 reset
//        forward.setPath("./BoardList.do");//원래 일루 가야 되는데
//        forward.setPath("boardList.jsp");//임시테스트용
        forward.setPath("main.jsp");
        return forward; 
    } 
}


