package lunchbox.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.board.BoardDAO;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		boolean result = false;
		int num = Integer.parseInt(request.getParameter("num")); // get 게시판 num
		
		BoardDAO boarddao = new BoardDAO();

		result = boarddao.deleteBoard(num);
		if (result == false) {
			System.out.println("게시판 삭제 실패");
			return null;
		}

		System.out.println("게시판 삭제 성공");
		forward.setRedirect(true);
		forward.setPath("./lunchboxBoard.bo");
		return forward;
	}

}
