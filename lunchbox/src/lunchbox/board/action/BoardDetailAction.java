package lunchbox.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.action.Action;
import lunchbox.action.ActionForward;
import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;
import lunchbox.model.resto.RestoDAO;
import lunchbox.model.resto.RestoVO;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		BoardDAO boarddao = new BoardDAO();
		RestoDAO restodao = new RestoDAO();
		int imageNum = 0;
		
		
		int num = Integer.parseInt(request.getParameter("boardNum"));
		BoardVO boardvo = boarddao.getDetail(num);
		imageNum = restodao.getImage(boardvo.getBOARD_TITLE());
		
		System.out.println(boardvo.getBOARD_TITLE());
		System.out.println(imageNum);
		
		request.setAttribute("boardvo", boardvo);
		request.setAttribute("imageNum", imageNum);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./content.jsp"); // 상세보기 보내기
		return forward;
	}

}
