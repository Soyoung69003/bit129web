package lunchbox.model.resto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import lunchbox.model.board.BoardVO;
import lunchbox.model.resto.RestoVO;

public class RestoDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public RestoDAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");

		} catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
			return;
		}
	}
	
	//랜덤값 추출
	public int[] getRand() {
//		ArrayList<Integer>rand = new ArrayList<Integer>();
		int rand[] = new int[4];
		String sql = "select count (*) from lunchbox_resto";
		int size=0;
		try {
			con=ds.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				size = Integer.parseInt(rs.getString(1));	//query 결과
			}
			System.out.println("size: " + size);
			for(int i=0; i <4 ; i++) {
				rand[i]=(int)(Math.random()*(size+1));
				
				for(int j=0; j<i; j++) {
					if(rand[i] == rand[j]) {
						i--;
						break;
					}
				}
			}
			//콘솔 결과 테스트용
			System.out.print("랜덤 추출 결과: ");
			for(int i=0; i<rand.length; i++) {
				System.out.print(rand[i]+" ");
			}System.out.println();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return rand;
	}
	
	public ArrayList<RestoVO> getList() {
		ArrayList<RestoVO> list = new ArrayList<RestoVO>();
		String sql = "SELECT RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT FROM LUNCHBOX_RESTO"
				+ " WHERE RESTO_NUMBER IN (?, ?, ?, ?) ";
		int[] randSet = new int[4];
		randSet = getRand();
		try {
			pstmt = con.prepareStatement(sql);
			for(int i=0; i<randSet.length; i++) {
			pstmt.setInt(i+1, randSet[i]);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RestoVO resto = new RestoVO();
				resto.setRESTO_NUMBER(rs.getInt("RESTO_NUMBER"));
				resto.setRESTO_TITLE(rs.getString("RESTO_TITLE"));
				resto.setRESTO_MENU(rs.getString("RESTO_MENU"));
				resto.setRESTO_PRICE(rs.getInt("RESTO_PRICE"));
				resto.setRESTO_CONTENT(rs.getString("RESTO_CONTENT"));
				list.add(resto);
			}
			System.out.println("객체 추가 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return list;
	}// list end

	public int getImage(String board_TITLE) {
		int restoNumber = 0;
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select resto_number from lunchbox_resto where resto_title = ?");
			pstmt.setString(1, board_TITLE);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				restoNumber = rs.getInt(1);
			}
			return restoNumber;
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
		return -1;
	}

	public RestoVO getMenu(int restoNum) {
		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement("select RESTO_NUMBER, RESTO_TITLE, RESTO_MENU, RESTO_PRICE, RESTO_CONTENT from "
					+ "lunchbox_resto where resto_number = ?");
			pstmt.setInt(1, restoNum);
			RestoVO restovo = new RestoVO();
			rs = pstmt.executeQuery();

			if (rs.next()) {
				restovo.setRESTO_NUMBER(rs.getInt("RESTO_NUMBER"));
				restovo.setRESTO_TITLE(rs.getString("RESTO_TITLE"));
				restovo.setRESTO_MENU(rs.getString("RESTO_MENU"));
				restovo.setRESTO_PRICE(rs.getInt("RESTO_PRICE"));
				restovo.setRESTO_CONTENT(rs.getString("RESTO_CONTENT"));
			}
			return restovo;
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

}
