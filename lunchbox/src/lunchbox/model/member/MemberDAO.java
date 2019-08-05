package lunchbox.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public MemberDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}

	// 로그인 검사
	public int isMember(MemberVO membervo) {
		String sql = "SELECT MEMBER_PWD FROM LUNCHBOX_MEMBER WHERE MEMBER_ID=?";
		int result = -1;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, membervo.getMEMBER_ID());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("MEMBER_PW").equals(membervo.getMEMBER_PWD())) {
					result = 1;// 일치.
				} else {
					result = 0;// 불일치.
				}
			} else {
				result = -1;// 아이디 존재하지 않음.
			}
		} catch (Exception ex) {
			System.out.println("isMember 에러: " + ex);
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
		}
		return result;
	}

	// 회원 가입
	public int insertMember(MemberVO membervo) {
		String SQL = "insert into lunchbox_member valuse(?, ?, ?, ?, ?)";
		int result = 0;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, membervo.getMEMBER_ID());
			pstmt.setString(2, membervo.getMEMBER_PWD());
			pstmt.setString(3, membervo.getMEMBER_NAME());
			pstmt.setString(4, membervo.getMEMBER_EMAIL());

			result = pstmt.executeUpdate();
			if (result == 0)
				return -1;

			return result;
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
		return 1;
	}

}
