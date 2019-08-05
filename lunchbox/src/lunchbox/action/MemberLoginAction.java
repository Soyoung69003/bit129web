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
        HttpSession session = request.getSession(); //회원 인증 성공시 아이디를 세션에 등록해야 함 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
         
        int result=-1; // default -1(아이디가 존재하지 않음) 
        
        //로그인폼에서 입력한 값을 MemberVO객체에 저장 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PWD")); 
        result=memberdao.isMember(member); //회원인지 아닌지 확인해주는 메소드
         
        //로그인 실패
        if(result==0){ //비밀번호 불일치
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('비밀번호를 확인해주세요');"); 
            out.println("location.href='./MemberLogin.do';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }else if(result==-1){ //아이디 없음
            response.setContentType("text/html;charset=utf-8"); 
            PrintWriter out = response.getWriter(); 
            out.println("<script>"); 
            out.println("alert('아이디가 존재하지 않습니다.');"); 
            out.println("location.href='./MemberLogin.do';"); 
            out.println("</script>"); 
            out.close(); 
            return null; 
        }         
         
        //로그인 성공
        session.setAttribute("id", member.getMEMBER_ID()); //세션에 id 정보 묶어줌 
        forward.setRedirect(true);//접속끊었다가 다시연결하면서 새로운 정보를 보여준다. 
        forward.setPath("./BoardList.do"); //게시판 목록 보기 요청. 
        return forward; 
    } 
}


