package lunchbox.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		BoardDAO boarddao = new BoardDAO();
		BoardVO boardvo = new BoardVO();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String sessionid = (String)session.getAttribute("id"); // 세션이름
		System.out.println(request.getParameter("num"));
		int restoNum = Integer.parseInt(request.getParameter("num")); // 음식 num get으로 받기
	
		

		try {
			boardvo.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
			boardvo.setBOARD_MAXPRESENT(Integer.parseInt(request.getParameter("BOARD_MAXPRESENT")));
			
			boarddao.insertBoard(boardvo, restoNum, sessionid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		forward.setRedirect(true);
		forward.setPath("./BoardListAction.bo");
		return forward;

	}

}
