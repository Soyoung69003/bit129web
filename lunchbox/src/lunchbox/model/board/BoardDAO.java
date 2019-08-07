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
            System.out.println("DB ?∞Í≤∞ ?§Ìå® : " + e); 
            return; 
        } 
    } 
     
    //Í∏Ä?? Í∞úÏàò Íµ¨ÌïòÍ∏?. 
    public int getListCount() { 
        int x= 0; 
         
        try{ 
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM LUNCHBOX_BOARD"); 
            rs = pstmt.executeQuery(); 
             
            if(rs.next()){ 
                x=rs.getInt(1); 
            } 
        }catch(Exception e){ 
            System.out.println("getListCount ?êÎü¨: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return x; // Íµ¨Ìïú Í∏Ä?òÎ? Î¶¨ÌÑ¥?úÎã§. 
    } 
     
    //Í∏Ä Î™©Î°ù Î≥¥Í∏∞.     
    public List getBoardList(int page, int limit){ 
        String board_list_sql=
        		"SELECT ROWNUM, BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT, BOARD_PRESENT, MAXPRESENT, BOARD_DATE" +  
                "FROM (SELECT * FROM LUNCHBOX_BOARD ORDER BY BOARD_NUM DESC)" 
        		+ "WHERE ROWNUM>=0 AND ROWNUM<=10";
        List list = new ArrayList(); 
         
        /*?úÏûë?âÏùò Î≤àÌò∏?Ä ?ùÌñâ?? Î≤àÌò∏Î•? Í≥ÑÏÇ∞?úÎã§. 
         * Í≥ÑÏÇ∞?? Í∞íÏúºÎ°? Í∞? ?òÏù¥ÏßÄ ÎßàÎã§ Ï∂úÎ†•?? ?àÏΩî?úÎ? ?ïÌïú??.*/ 
        int startrow=(page-1)*10+1; //?ΩÍ∏∞ ?úÏûë?? row Î≤àÌò∏. 
        int endrow=startrow+limit-1; //?ΩÏùÑ ÎßàÏ?Îß? row Î≤àÌò∏.         
        try{ 
            pstmt = con.prepareStatement(board_list_sql); 
            pstmt.setInt(1, startrow); 
            pstmt.setInt(2, endrow); 
            rs = pstmt.executeQuery(); //Í∞Ä?∏Ïò® ?àÏΩî?? Í∞íÏùÑ rs?? ?¥Í≥†.. ?¥Ï? Í∞ùÏ≤¥?§ÏùÑ ?òÎÇò?òÎÇò ÎøåÎ†§Ï§Ä??. 
             
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
            System.out.println("getBoardList ?êÎü¨ : " + e); 
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //Í∏Ä ?¥Ïö© Î≥¥Í∏∞. 
    public BoardVO getDetail(int num) throws Exception{ 
        BoardVO board = null; 
        try{ 
            pstmt = con.prepareStatement("SELECT * FROM LUNCHBOX_BOARD WHERE BOARD_NUM=?"); //?∏ÏàòÎ°? ?òÍ≤®Ï§Ä Î≤àÌò∏?? ?¥Îãπ?òÎäî Í∏Ä?? ?ªÏñ¥?®Îã§. 
            pstmt.setInt(1, num); 
            rs= pstmt.executeQuery(); 
             
            /*Î∞õÏïÑ?? ?àÏΩî?? Í∞íÏùÑ ÎπàÍ∞ùÏ≤¥Ïóê ?†Îãπ. Î¶¨ÌÑ¥?? Í∞ùÏ≤¥?? view?òÏù¥ÏßÄ?êÏÑú Í∞ÅÍ∞Å Ï∂úÎ†•?úÎã§.*/ 
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
            System.out.println("getDetail ?êÎü¨ : " + e); 
        }finally{ 
            if(rs!=null)try{rs.close();}catch(SQLException e){} 
            if(pstmt !=null)try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //Í∏Ä ?±Î°ù. 
    public boolean boardInsert(BoardVO board){ 
        int num =0; 
        String sql="";         
        int result=0; 
         
		}

	}

	// Í∏Ä Í∞úÏàò
	public int getListCount() {
		int x = 0;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from lunchbox_board");
				x = rs.getInt(1);
				num = rs.getInt(1) + 1; // ?? Í∏Ä?? Î≤àÌò∏ = [ÎßàÏ?Îß? Í∏ÄÎ≤àÌò∏ + 1]
			} else {
				num = 1;
			}
		} catch (Exception ex) {
			System.out.println("getListCount ?êÎü¨: " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	public List<BoardVO> getBoardList(int page, int limit) {
		String SQL = "select board_num, board_titlem, board_id, board_present, "
				+ "board_date from lunchbox_board where board_num >= ? and board_num <= ?"; // ?

		List<BoardVO> list = new ArrayList<BoardVO>();

		int startrow = (page - 1) * 10 + 1; // ?ΩÍ∏∞ ?úÏûë?? row Î≤àÌò∏.
		int endrow = startrow + limit - 1; // ?ΩÏùÑ ÎßàÏ?Îß? row Î≤àÌò∏.

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO board = new BoardVO();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				board.setBOARD_ID(rs.getString("BOARD_ID"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_PRESENT(rs.getInt("BOARD_PRESENT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}

			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList ?êÎü¨ : " + ex);
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

	public int insertBoard(BoardVO boardvo) {
		int boardNum = 0;
		String SQL = "";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select max(board_num) from lunchbox_board");
			rs = pstmt.executeQuery();

			if (rs.next())
				boardNum = rs.getInt(1) + 1;
			else
				boardNum = 1;

			SQL = "insert into lunchbox_board (BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT,"
					+ "BOARD_PRESENT, BOARD_MAXPRESENT, BOARD_DATE) values (?, ?, ?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			// pstmt.setString(2, board.getTile());
			pstmt.setString(3, boardvo.getBOARD_ID());
			pstmt.setString(4, boardvo.getBOARD_CONTENT());
			pstmt.setInt(5, 1);
			pstmt.setInt(6, boardvo.getBOARD_MAXPRESENT());

			result = pstmt.executeUpdate();
			if (result == 0)
				return 0;

			return 1;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return -1;
	}

	public boolean deleteBoard(int num) {

		String SQL = "delete from lunchbox_board where board_num = ?";

		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL);
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
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardDelete ?êÎü¨ : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			if (result != 0) {
				return true;
			}

		}

		return false;
	}

	public BoardVO getDetail(int num) {
		BoardVO boardvo = null;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select * from lunchbox_board where BOARD_NUM = ?");
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				BoardVO board = new BoardVO();
				board.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				board.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				board.setBOARD_ID(rs.getString("BOARD_ID"));
				board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				board.setBOARD_PRESENT(rs.getInt("BOARD_PRESENT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
			return boardvo;
		} catch (Exception ex) {
			System.out.println("getDetail ?êÎü¨ : " + ex);
		} catch (Exception e) {
			System.out.println("boardInsert ?êÎü¨ : " + e);
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
    
    //Í∏Ä ?òÏ†ï - Í∏Ä ?úÎ™©Í≥? ?¥Ïö©, ÏµúÎ??∏Ïõê?òÏö©Îß? ?òÏ†ï Í∞Ä?? 
    public boolean boardModify(BoardVO modifyboard) throws Exception{ 
        String sql="UPDATE LUNCHBOX_BOARD SET BOARD_TITLE=?, BOARD_CONTENT=? WHERE BOARD_NUM=?"; 
         
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, modifyboard.getBOARD_TITLE());
			pstmt.setString(2, modifyboard.getBOARD_CONTENT());
			pstmt.setInt(3, modifyboard.getMAXPRESENT());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("boardModify ?êÎü¨ : " + e);
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
			if (con != null)
				try {
					con.close();
				} catch (SQLException ex) {
				}
		}
		return false;
	}
     
    /*Í∏Ä ??†ú. 
     * ?°ÏÖò ?¥Îûò?§Ïóê?? ÎπÑÎ?Î≤àÌò∏ ?ºÏπò?¨Î?Î•? ?ïÏù∏?? ?? Í∏Ä ??†úÎ•? ÏßÑÌñâ?úÎã§.*/ 
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
            System.out.println("boardDelete ?êÎü¨ : "+e); 
        }finally{ 
            try{ 
                if(pstmt!=null)pstmt.close(); 
            }catch(Exception e) {} 
        }         
        return false; 
    } 

    //?? Í∏ÄÎß? ??†ú Í∞Ä?•ÌïòÍ≤? ÎßåÎìú?? Î©îÏÜå?? - ÎØ∏ÏôÑ??........ ?¥ÎñªÍ≤? ?òÏ???
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
//            System.out.println("isBoardWriter ?êÎü¨ : "+e); 
//        } 
//        return false; 
//    } 
}
