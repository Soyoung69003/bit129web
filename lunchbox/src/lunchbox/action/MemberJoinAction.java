package lunchbox.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

	@Override
        request.setCharacterEncoding("utf-8"); //?��?처리 
        ActionForward forward = new ActionForward(); 
        MemberDAO memberdao = new MemberDAO(); 
        MemberVO member = new MemberVO(); 
        boolean result=false; 
         
        /*?�력 ?�보�? memberVO객체?? ?�??*/ 
        member.setMEMBER_ID(request.getParameter("MEMBER_ID")); 
        member.setMEMBER_PWD(request.getParameter("MEMBER_PW")); 
        member.setMEMBER_NAME(request.getParameter("MEMBER_NAME")); 
        member.setMEMBER_EMAIL(request.getParameter("MEMBER_EMAIL")); 
        result=memberdao.joinMember(member); // dao?? joinmember메서?��? ?�행?�서 ?�원가?�처�?         

        //?�원가?? ?�패?? null반환 
        if(result==false){ 
            System.out.println("?�원가?? ?�패"); 
            return null; 
        }     
        //?�원가?? ?�공 
        forward.setRedirect(true); 
        System.out.println("?�원가?? ?�공!");
        forward.setPath("./MemberLogin.me");         
        return forward; 
    } 
}
