package lunchbox.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BoardDAO boarddao = new BoardDAO();
		BoardVO boardvo = new BoardVO();

		int num = Integer.parseInt(request.getParameter("num"));
		boardvo = boarddao.getDetail(num);

		if (boardvo == null) {
			System.out.println("상세보기 실패");
			return null;
		}
		System.out.println("상세보기 성공");

		request.setAttribute("boardvo", boardvo);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./~~~.jsp");
		return forward;
	}

}
