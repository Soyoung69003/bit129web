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
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public BoardDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}

	}

	// 글 개수
	public int getListCount() {
		int x = 0;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement("select count(*) from lunchbox_board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			System.out.println("getListCount 에러: " + ex);
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

	public List<BoardVO> getBoardList(int page, int listcount) {
		String SQL = "select board_num, board_title, board_id, board_content, board_present, board_date, board_maxpresent from \r\n" + 
				"(select rownum as r, board_num, board_title, board_id, board_content, board_present, board_date, board_maxpresent from lunchbox_board) \r\n" + 
				"            where r>=? and r<=? order by board_num desc"; // ?
		List<BoardVO> list = new ArrayList<BoardVO>();
		System.out.println(listcount);
		int startrow = (listcount - 10) - (page - 1)*10; // 읽기 시작할 row 번호.
		int endrow = startrow + 10; // 읽을 마지막 row 번호.

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
				board.setBOARD_MAXPRESENT(rs.getInt("BOARD_MAXPRESENT"));
				board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(board);
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
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

	public int insertBoard(BoardVO boardvo, int restonum, String sessionID) {
		int boardNum = 0;
		String userName = "";
		String SQL = "";
		int result = 0;
		String title = ""; // 음식점 이름 타이틀로 가져오기

		try {
			con = ds.getConnection();
			SQL = "select max(board_num) from lunchbox_board";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				boardNum = rs.getInt(1) + 1;
			else
				boardNum = 1;

			con = ds.getConnection();
			SQL = "select member_name from lunchbox_member where member_id = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, sessionID);
			rs = pstmt.executeQuery();
			if (rs.next())
				userName = rs.getString(1);
			else
				userName = "이름";
			
			SQL = "select resto_title from lunchbox_resto where resto_number = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, restonum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				title = rs.getString(1);
			} else
				title = "";

			SQL = "insert into lunchbox_board (BOARD_NUM, BOARD_TITLE, BOARD_ID, BOARD_CONTENT,"
					+ "BOARD_PRESENT, BOARD_MAXPRESENT, BOARD_DATE) values (?, ?, ?, ?, ?, ?, sysdate)";

			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			pstmt.setString(2, title);
			pstmt.setString(3, userName);
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
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardDelete 에러 : " + ex);
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
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
				System.out.println("test");
				boardvo = new BoardVO();
				boardvo.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardvo.setBOARD_TITLE(rs.getString("BOARD_TITLE"));
				boardvo.setBOARD_ID(rs.getString("BOARD_ID"));
				boardvo.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardvo.setBOARD_PRESENT(rs.getInt("BOARD_PRESENT"));
				boardvo.setBOARD_MAXPRESENT(rs.getInt("BOARD_MAXPRESENT"));
				boardvo.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
			return boardvo;
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
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

	public boolean modifyBoard(BoardVO boardvo) {
		String sql = "update lunchbox_board set BOARD_CONTENT=? where BOARD_NUM=?";

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardvo.getBOARD_CONTENT());
			pstmt.setInt(1, boardvo.getBOARD_NUM());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
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
		return false;
	}

	public boolean boardModify(BoardVO boardvo) {
		String SQL = "";

		try {
			con = ds.getConnection();
			SQL = "update lunchbox_board set board_content = ?, board_maxpresent = ? where board_num = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, boardvo.getBOARD_CONTENT());
			pstmt.setInt(2, boardvo.getBOARD_MAXPRESENT());
			pstmt.setInt(3, boardvo.getBOARD_NUM());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
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
		return false;
	}

}
