package lunchbox.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

	@Override
        request.setCharacterEncoding("utf-8"); //?œê?ì²˜ë¦¬ 
        ActionForward forward = new ActionForward(); 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
        boolean result=false; 
         
        /*?…ë ¥ ?•ë³´ë¥? memberVOê°ì²´?? ?€??*/ 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PW")); 
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME")); 
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL")); 
        result=memberdao.joinMember(member); // dao?? joinmemberë©”ì„œ?œë? ?¤í–‰?´ì„œ ?Œì›ê°€?…ì²˜ë¦?         

        //?Œì›ê°€?? ?¤íŒ¨?? nullë°˜í™˜ 
        if(result==false){ 
            System.out.println("?Œì›ê°€?? ?¤íŒ¨"); 
            return null; 
        }     
        //?Œì›ê°€?? ?±ê³µ 
        forward.setRedirect(true); 
        System.out.println("?Œì›ê°€?? ?±ê³µ!");
        forward.setPath("./MemberLogin.me");         
        return forward; 
    } 
}
