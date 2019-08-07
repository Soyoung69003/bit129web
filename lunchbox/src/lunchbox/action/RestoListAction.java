package lunchbox.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.model.resto.RestoDAO;
import lunchbox.model.resto.RestoVO;

public class RestoListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		RestoDAO restodao = new RestoDAO();
		ArrayList list = new ArrayList();
		list=restodao.getList();

		String id = (String) session.getAttribute("id");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		} else {
			request.setAttribute("restolist", list);
			System.out.println("랜덤바인딩완료");
			forward.setRedirect(false);
			forward.setPath("./result.jsp");
			return forward;
		}
	}
}
