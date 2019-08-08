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
		RestoVO restovo = new RestoVO();
		ArrayList<RestoVO> list = restodao.getList();
		
		
			
		

		String id = (String) session.getAttribute("id");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		} else {
			for(int i=0; i<list.size(); i++) {
				
				request.setAttribute("NUMBER"+i, list.get(i).getRESTO_NUMBER());
				request.setAttribute("TITLE"+i, list.get(i).getRESTO_TITLE());
				request.setAttribute("CONTENT"+i, list.get(i).getRESTO_CONTENT());
				request.setAttribute("PRICE"+i, list.get(i).getRESTO_PRICE());
				request.setAttribute("MENU"+i, list.get(i).getRESTO_MENU());
			}
			System.out.println("랜덤바인딩완료");
			forward.setRedirect(false);
			forward.setPath("./result.jsp");
			return forward;
		}
	}
}
