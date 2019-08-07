package lunchbox.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.member.MemberDAO;

public class MemberDeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();

		boolean result = false;
		String id = (String) session.getAttribute("id");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		} else if (!id.equals("admin")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			out.close();
			return null;
		}
		result = memberdao.deleteMember(request.getParameter("id"));
		if (result == false) {
			System.out.println("회원 삭제 실패");
			return null;
		}
//		실제 삭제 하기 전에 confirm 메시지를 띄워주면 좋겠음... 어떻게 하더라?
		System.out.println("회원 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./MemberListAction.me");
		return forward;
	}

}
