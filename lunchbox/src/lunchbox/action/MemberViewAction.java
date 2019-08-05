package lunchbox.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.model.member.MemberDAO;
import lunchbox.model.member.MemberVO;

public class MemberViewAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();
		MemberVO member = new MemberVO();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.do");
			return forward;
		} else if (!id.equals("admin") || !id.equals(id)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='./BoardList.do';");
			out.println("</script>");
			out.close();
			return null;
		} 
		String viewId = request.getParameter("id");
		member = memberdao.getDetailMember(viewId);
		if (member == null) {
			System.out.println("회원 정보 보기 실패");
			return null;
		}
		request.setAttribute("member", member);
		forward.setRedirect(false);
		forward.setPath("./member/member_info.jsp");
		return forward;
	}
}
