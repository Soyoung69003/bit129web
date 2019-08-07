package lunchbox.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO { 
    Connection con; 
    PreparedStatement pstmt; 
    ResultSet rs; 
     
    public BoardDAO() { 
        try{ 
            Context init = new InitialContext(); 
              DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
              con = ds.getConnection(); 
        }catch(Exception e){ 
            System.out.println("DB 연결 실패 : " + e); 
            return; 
        } 
    } 
     
    //글의 개수 구하기. 
    public int getListCount() { 
        int x= 0; 
         
        try{ 
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM LUNCHBOX_BOARD"); 
            rs = pstmt.executeQuery(); 
             
            if(rs.next()){ 
                x=rs.getInt(1); 
            } 
        }catch(Exception e){ 
            System.out.println("getListCount 에러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return x; // 구한 글수를 리턴한다. 
    } 
     
    //글 목록 보기.     
    public List getBoardList(int page, int limit){ 
        String board_list_sql=
        		"SELECT ROWNUM, BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT, BOARD_PRESENT, MAXPRESENT, BOARD_DATE" +  
                "FROM (SELECT * FROM LUNCHBOX_BOARD ORDER BY BOARD_NUM DESC)" 
        		+ "WHERE ROWNUM>=0 AND ROWNUM<=10";

        List list = new ArrayList(); 
         
        /*시작행의 번호와 끝행의 번호를 계산한다. 
         * 계산된 값으로 각 페이지 마다 출력될 레코드를 정한다.*/ 
        int startrow=(page-1)*10+1; //읽기 시작할 row 번호. 
        int endrow=startrow+limit-1; //읽을 마지막 row 번호.         
        try{ 
            pstmt = con.prepareStatement(board_list_sql); 
            pstmt.setInt(1, startrow); 
            pstmt.setInt(2, endrow); 
            rs = pstmt.executeQuery(); //가져온 레코드 값을 rs에 담고.. 담은 객체들을 하나하나 뿌려준다. 
             
            while(rs.next()){ 
                BoardVO board = new BoardVO(); 
                board.setBOARD_NUM(rs.getInt("BOARD_NUM")); 
                board.setBOARD_TITLE(rs.getString("BOARD_TITLE")); 
                board.setBOARD_ID(rs.getString("BOARD_ID")); 
                board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT")); 
                board.setBOARD_PRESENT(rs.getInt("BOARD_PRESENT")); 
                board.setBOARD_PRESENT(rs.getInt("MAXPRESENT")); 
                board.setBOARD_DATE(rs.getDate("BOARD_DATE")); 
                list.add(board); 
            }             
            return list; 
        }catch(Exception e){ 
            System.out.println("getBoardList 에러 : " + e); 
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //글 내용 보기. 
    public BoardVO getDetail(int num) throws Exception{ 
        BoardVO board = null; 
        try{ 
            pstmt = con.prepareStatement("SELECT * FROM LUNCHBOX_BOARD WHERE BOARD_NUM=?"); //인수로 넘겨준 번호에 해당하는 글을 얻어온다. 
            pstmt.setInt(1, num); 
            rs= pstmt.executeQuery(); 
             
            /*받아온 레코드 값을 빈객체에 할당. 리턴된 객체는 view페이지에서 각각 출력된다.*/ 
            if(rs.next()){ 
                board = new BoardVO(); 
                board.setBOARD_NUM(rs.getInt("BOARD_NUM")); 
                board.setBOARD_TITLE(rs.getString("BOARD_TITLE")); 
                board.setBOARD_ID(rs.getString("BOARD_ID")); 
                board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT")); 
                board.setBOARD_PRESENT(rs.getInt("BOARD_PRESENT")); 
                board.setBOARD_PRESENT(rs.getInt("MAXPRESENT")); 
                board.setBOARD_DATE(rs.getDate("BOARD_DATE")); 
            } 
            return board; 
        }catch(Exception e){ 
            System.out.println("getDetail 에러 : " + e); 
        }finally{ 
            if(rs!=null)try{rs.close();}catch(SQLException e){} 
            if(pstmt !=null)try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //글 등록. 
    public boolean boardInsert(BoardVO board){ 
        int num =0; 
        String sql="";         
        int result=0; 
         
		try {
			pstmt = con.prepareStatement("SELECT MAX(BOARD_NUM) FROM LUNCHBOX_BOARD");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt(1) + 1; // 새 글의 번호 = [마지막 글번호 + 1]
			} else {
				num = 1;
			}
			sql = "INSERT INTO LUNCHBOX_BOARD "
					+ "(BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT, BOARD_PRESENT, MAXPRESENT, BOARD_DATE) "
					+ "VALUES(?, ?, ?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBOARD_TITLE());
			pstmt.setString(3, board.getBOARD_ID());
			pstmt.setString(4, board.getBOARD_CONTENT());
			pstmt.setInt(5, board.getBOARD_PRESENT());
			pstmt.setInt(6, board.getMAXPRESENT());
			result = pstmt.executeUpdate();
			if (result != 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println("boardInsert 에러 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return false;
	}
    
    //글 수정 - 글 제목과 내용, 최대인원수용만 수정 가능 
    public boolean boardModify(BoardVO modifyboard) throws Exception{ 
        String sql="UPDATE LUNCHBOX_BOARD SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_NUM=?"; 
         
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getBOARD_TITLE());
			pstmt.setString(2, modifyboard.getBOARD_CONTENT());
			pstmt.setInt(3, modifyboard.getMAXPRESENT());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("boardModify 에러 : " + e);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
		}
		return false;
	}
     
    /*글 삭제. 
     * 액션 클래스에서 비밀번호 일치여부를 확인한 후 글 삭제를 진행한다.*/ 
    public boolean boardDelete(int num){ 
        String sql="DELETE FROM LUNCHBOX_BOARD WHERE BOARD_NUM=?";         
        int result=0;         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setInt(1, num); 
            result=pstmt.executeUpdate(); 
            if(result==0)return false;             
            return true; 
        }catch(Exception e){ 
            System.out.println("boardDelete 에러 : "+e); 
        }finally{ 
            try{ 
                if(pstmt!=null)pstmt.close(); 
            }catch(Exception e) {} 
        }         
        return false; 
    } 

    //내 글만 삭제 가능하게 만드는 메소드 - 미완성........ 어떻게 하지??
//    public boolean isBoardWriter(int num, String pass) { 
//        String board_sql="SELECT * FROM BOARD WHERE BOARD_NUM=?"; 
//         
//        try{ 
//            pstmt=con.prepareStatement(board_sql); 
//            pstmt.setInt(1, num); 
//            rs=pstmt.executeQuery(); 
//            rs.next(); 
//             
//            if(pass.equals(rs.getString("BOARD_PASS"))){ 
//                return true; 
//            } 
//        }catch(SQLException e){ 
//            System.out.println("isBoardWriter 에러 : "+e); 
//        } 
//        return false; 
//    } 
}
