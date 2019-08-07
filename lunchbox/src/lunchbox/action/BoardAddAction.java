package lunchbox.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lunchbox.model.board.BoardDAO;
import lunchbox.model.board.BoardVO;

public class BoardAddAction implements Action { 
	@Override
     public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
        BoardDAO boarddao=new BoardDAO(); 
           BoardVO boarddata=new BoardVO(); 
           ActionForward forward=new ActionForward(); 
            
        String realFolder=""; 
           String saveFolder="/boardupload"; 
            
           int fileSize=5*1024*1024; 
            
           //realFolder=request.getRealPath(saveFolder); 
           realFolder ="D:/bitnajava/QnABoard_Test1/WebContent/boardupload"; 
           boolean result=false; 
            
           try{                
               MultipartRequest multi=null;                
               multi=new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());                
               boarddata.setBOARD_TITLE(multi.getParameter("BOARD_NAME")); 
               boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT")); 
                
               result=boarddao.boardInsert(boarddata); 
                
               if(result==false){ 
                   System.out.println("게시판 등록 실패"); 
                   return null; 
               } 
               System.out.println("게시판 등록 완료"); 
                
               forward.setRedirect(true); 
               forward.setPath("./BoardList.bo"); 
               return forward; 
                
          }catch(Exception ex){ 
               ex.printStackTrace(); 
           } 
          return null; 
    }       
}
