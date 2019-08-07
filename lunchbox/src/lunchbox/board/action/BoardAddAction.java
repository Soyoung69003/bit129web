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
		BoardDAO boarddao = new BoardDAO();
		BoardVO boardvo = new BoardVO();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String sessionName = (String)session.getAttribute("userName");
	
		int result = 0;

		try {
			//boardvo.setBOARD_TITLE();
			boardvo.setBOARD_ID(sessionName);
			boardvo.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
			boardvo.setBOARD_MAXPRESENT(Integer.parseInt(request.getParameter("BOARD_MAXPRESENT")));

			result = boarddao.insertBoard(boardvo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
