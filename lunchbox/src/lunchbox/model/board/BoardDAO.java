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
            System.out.println("DB ?�결 ?�패 : " + e); 
            return; 
        } 
    } 
     
    //글?? 개수 구하�?. 
    public int getListCount() { 
        int x= 0; 
         
        try{ 
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM LUNCHBOX_BOARD"); 
            rs = pstmt.executeQuery(); 
             
            if(rs.next()){ 
                x=rs.getInt(1); 
            } 
        }catch(Exception e){ 
            System.out.println("getListCount ?�러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return x; // 구한 글?��? 리턴?�다. 
    } 
     
    //글 목록 보기.     
    public List getBoardList(int page, int limit){ 
        String board_list_sql=
        		"SELECT ROWNUM, BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT, BOARD_PRESENT, MAXPRESENT, BOARD_DATE" +  
                "FROM (SELECT * FROM LUNCHBOX_BOARD ORDER BY BOARD_NUM DESC)" 
        		+ "WHERE ROWNUM>=0 AND ROWNUM<=10";
        List list = new ArrayList(); 
         
        /*?�작?�의 번호?� ?�행?? 번호�? 계산?�다. 
         * 계산?? 값으�? �? ?�이지 마다 출력?? ?�코?��? ?�한??.*/ 
        int startrow=(page-1)*10+1; //?�기 ?�작?? row 번호. 
        int endrow=startrow+limit-1; //?�을 마�?�? row 번호.         
        try{ 
            pstmt = con.prepareStatement(board_list_sql); 
            pstmt.setInt(1, startrow); 
            pstmt.setInt(2, endrow); 
            rs = pstmt.executeQuery(); //가?�온 ?�코?? 값을 rs?? ?�고.. ?��? 객체?�을 ?�나?�나 뿌려준??. 
             
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
            System.out.println("getBoardList ?�러 : " + e); 
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //글 ?�용 보기. 
    public BoardVO getDetail(int num) throws Exception{ 
        BoardVO board = null; 
        try{ 
            pstmt = con.prepareStatement("SELECT * FROM LUNCHBOX_BOARD WHERE BOARD_NUM=?"); //?�수�? ?�겨준 번호?? ?�당?�는 글?? ?�어?�다. 
            pstmt.setInt(1, num); 
            rs= pstmt.executeQuery(); 
             
            /*받아?? ?�코?? 값을 빈객체에 ?�당. 리턴?? 객체?? view?�이지?�서 각각 출력?�다.*/ 
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
            System.out.println("getDetail ?�러 : " + e); 
        }finally{ 
            if(rs!=null)try{rs.close();}catch(SQLException e){} 
            if(pstmt !=null)try{pstmt.close();}catch(SQLException e){} 
        } 
        return null; 
    } 
     
    //글 ?�록. 
    public boolean boardInsert(BoardVO board){ 
        int num =0; 
        String sql="";         
        int result=0; 
         
		}

	}

	// 글 개수
	public int getListCount() {
		int x = 0;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from lunchbox_board");
				x = rs.getInt(1);
				num = rs.getInt(1) + 1; // ?? 글?? 번호 = [마�?�? 글번호 + 1]
			} else {
				num = 1;
			}
		} catch (Exception ex) {
			System.out.println("getListCount ?�러: " + ex);
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

		int startrow = (page - 1) * 10 + 1; // ?�기 ?�작?? row 번호.
		int endrow = startrow + limit - 1; // ?�을 마�?�? row 번호.

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
			System.out.println("getBoardList ?�러 : " + ex);
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
			System.out.println("boardDelete ?�러 : " + ex);
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
			System.out.println("getDetail ?�러 : " + ex);
		} catch (Exception e) {
			System.out.println("boardInsert ?�러 : " + e);
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
    
    //글 ?�정 - 글 ?�목�? ?�용, 최�??�원?�용�? ?�정 가?? 
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
			System.out.println("boardModify ?�러 : " + e);
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
     
    /*글 ??��. 
     * ?�션 ?�래?�에?? 비�?번호 ?�치?��?�? ?�인?? ?? 글 ??���? 진행?�다.*/ 
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
            System.out.println("boardDelete ?�러 : "+e); 
        }finally{ 
            try{ 
                if(pstmt!=null)pstmt.close(); 
            }catch(Exception e) {} 
        }         
        return false; 
    } 

    //?? 글�? ??�� 가?�하�? 만드?? 메소?? - 미완??........ ?�떻�? ?��???
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
//            System.out.println("isBoardWriter ?�러 : "+e); 
//        } 
//        return false; 
//    } 
}
