package lunchbox.model.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lunchbox.model.board.BoardVO;

public class CommentDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public CommentDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	public int insert(int boardNum, String sessionid, String userContent) {
		int commentNum = 0;
		String userName = "";
		String SQL = "";
		int result = 0;
		try {
			con = ds.getConnection();
			SQL = "select max(comment_number) from lunchbox_comment";
			pstmt = con.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next())
				commentNum = rs.getInt(1) + 1;
			else
				commentNum = 1;

			con = ds.getConnection();
			SQL = "select member_name from lunchbox_member where member_id = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, sessionid);
			rs = pstmt.executeQuery();
			if (rs.next())
				userName = rs.getString(1);
			else
				userName = "이름";

			SQL = "insert into lunchbox_comment (COMMENT_NUMBER, COMMENT_BOARD_NUMBER, COMMENT_NAME, COMMENT_CONTENT"
					+ ") values (?, ?, ?, ?)";

			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, commentNum);
			pstmt.setInt(2, boardNum);
			pstmt.setString(3, userName);
			pstmt.setString(4, userContent);

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

	public ArrayList<CommentVO> select(int boardNum) {
		String SQL = "select * from LUNCHBOX_COMMENT where COMMENT_BOARD_NUMBER = ? order by COMMENT_NUMBER desc"; // ?
		ArrayList<CommentVO> commentList = new ArrayList<CommentVO>();
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, boardNum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CommentVO commentvo = new CommentVO(); 
				commentvo.setCOMMENT_NUMBER(rs.getInt("COMMENT_NUMBER"));
				commentvo.setCOMMENT_BOARD_NUMBER(rs.getInt("COMMENT_BOARD_NUMBER"));
				commentvo.setCOMMENT_NAME(rs.getString("COMMENT_NAME"));
				commentvo.setCOMMENT_CONTENT(rs.getString("COMMENT_CONTENT"));
			
				
				commentList.add(commentvo);
			}
			return commentList;
		} catch (Exception ex) {
			System.out.println("search 에러 : " + ex);
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
}
