package lunchbox.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		boolean result = false;

		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO boarddao = new BoardDAO();
		BoardVO boardvo = new BoardVO();

		try {
			
			boardvo.setBOARD_NUM(num);
			boardvo.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
			boardvo.setBOARD_MAXPRESENT(Integer.parseInt(request.getParameter("BOARD_MAXPRESENT")));

			result = boarddao.boardModify(boardvo);
			if (result == false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");

			forward.setRedirect(true);
			forward.setPath("./BoardDetailAction.do?num=" + boardvo.getBOARD_NUM());
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}
