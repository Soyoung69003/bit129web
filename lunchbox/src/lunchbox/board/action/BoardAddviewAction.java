package lunchbox.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.member.MemberDAO;
import lunchbox.model.resto.RestoDAO;
import lunchbox.model.resto.RestoVO;

public class BoardAddviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		MemberDAO memberdao = new MemberDAO();
		RestoDAO restodao = new RestoDAO();
		RestoVO restovo = new RestoVO();
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String sessionid = (String)session.getAttribute("id"); // 세션이름
		int restoNum = Integer.parseInt(request.getParameter("num")); // 음식 num get으로 받기
		String userName = "";
		
		try {
			restovo = restodao.getMenu(restoNum);
			userName = memberdao.getUserName(sessionid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println(userName);
		System.out.println(restovo.getRESTO_MENU());
		
		request.setAttribute("userName", userName);
		request.setAttribute("restovo", restovo);
		
		forward.setRedirect(false);
		forward.setPath("./write.jsp");
		return forward;

	}

}
