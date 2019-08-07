package lunchbox.board.action;

import java.io.PrintWriter;

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

		int num = Integer.parseInt(request.getParameter("BOARD_NUM"));

		BoardDAO boarddao = new BoardDAO();
		BoardVO boarddata = new BoardVO();

		try {
			
			boarddata.setBOARD_NUM(num);
			boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));

			result = boarddao.boardModify(boarddata);
			if (result == false) {
				System.out.println("게시판 수정 실패");
				return null;
			}
			System.out.println("게시판 수정 완료");

			forward.setRedirect(true);
			forward.setPath("./BoardDetailAction.do?num=" + boarddata.getBOARD_NUM());
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return null;
	}

}
