package lunchbox.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardDetailAction implements Action { 
	@Override
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{  
       request.setCharacterEncoding("utf-8"); 
           
       BoardDAO boarddao=new BoardDAO(); 
          BoardVO boarddata=new BoardVO(); 
           
       int num=Integer.parseInt(request.getParameter("num")); 
          boarddata=boarddao.getDetail(num); 
           
          if(boarddata==null){ 
              System.out.println("상세보기 실패"); 
              return null; 
          } 
          System.out.println("상세보기 성공"); 
           
          request.setAttribute("boarddata", boarddata); 
          ActionForward forward = new ActionForward(); 
          forward.setRedirect(false); 
          forward.setPath("./board/board_view.jsp"); 
          return forward; 
    } 
}
