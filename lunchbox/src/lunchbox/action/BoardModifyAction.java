package lunchbox.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardModifyAction implements Action { 
    public ActionForward execute(HttpServletRequest request,HttpServletResponse response)  
            throws Exception{ 
            request.setCharacterEncoding("utf-8"); 
            ActionForward forward = new ActionForward(); 
            boolean result = false; 
             
            int num=Integer.parseInt(request.getParameter("BOARD_NUM")); 
             
            BoardDAO boarddao=new BoardDAO(); 
            BoardVO boarddata=new BoardVO(); 
             
/*            boolean usercheck=boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS")); 
            if(usercheck==false){ 
                      response.setContentType("text/html;charset=euc-kr"); 
                      PrintWriter out=response.getWriter(); 
                      out.println("<script>"); 
                      out.println("alert('수정할 권한이 없습니다.');"); 
                      out.println("location.href='./BoardList.bo';"); 
                      out.println("</script>"); 
                      out.close(); 
                      return null; 
            } 
             */
            try{ 
                boarddata.setBOARD_NUM(num); 
                boarddata.setBOARD_TITLE(request.getParameter("BOARD_TITLE")); 
                boarddata.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT")); 
                 
                result = boarddao.boardModify(boarddata); 
                if(result==false){ 
                      System.out.println("게시판 수정 실패"); 
                      return null; 
                   } 
                   System.out.println("게시판 수정 완료"); 
                    
                   forward.setRedirect(true); 
                   forward.setPath("./BoardDetailAction.bo?num="+boarddata.getBOARD_NUM()); 
                   return forward; 
               }catch(Exception ex){ 
                      ex.printStackTrace();      
            } 
            return null; 
        } 
   }
