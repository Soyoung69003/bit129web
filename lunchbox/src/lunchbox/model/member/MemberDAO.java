package lunchbox.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO { 
    Connection con; 
    PreparedStatement pstmt; 
    ResultSet rs; 
     
    public MemberDAO() { 
        try{
            Context init = new InitialContext(); 
              DataSource ds =  
                  (DataSource) init.lookup("java:comp/env/jdbc/OracleDB"); 
              con = ds.getConnection(); 
              System.out.println("connected...");
        }catch(Exception e){ 
            System.out.println("DB ?�결 ?�패 : " + e); 
            return; 
        } 
    } 
    
    //로그?? ?�도
    public int isMember(MemberVO member){ 
        String sql ="SELECT MEMBER_PWD FROM LUNCHBOX_MEMBER WHERE MEMBER_ID=?"; 
        int result=-1; 
         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setString(1, member.getMEMBER_ID()); 
            rs = pstmt.executeQuery(); 
             
            if(rs.next()){ //쿼리 결과가 ?�으�?
                if(rs.getString("MEMBER_PWD").equals(member.getMEMBER_PWD())){ 
                    result=1;
                }else{ 
                    result=0;
                } 
            }else{ 
                result=-1;//?�는 ?�이??
            } 
        }catch(Exception e){ 
            System.out.println("isMember ?�러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return result; 
    } 
     
    //?�원 가?? 메소??
    public boolean joinMember(MemberVO member) { 
        String sql="INSERT INTO LUNCHBOX_MEMBER VALUES (?,?,?,?)"; 
        int result=0; 
         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setString(1, member.getMEMBER_ID()); 
            pstmt.setString(2, member.getMEMBER_PWD()); 
            pstmt.setString(3, member.getMEMBER_NAME()); 
            pstmt.setString(4, member.getMEMBER_EMAIL()); 
            result=pstmt.executeUpdate(); 
             
            if(result!=0){ 
                return true; 
            } 
        }catch(Exception e){ 
            System.out.println("joinMember ?�러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
        return false; 
    } 
     
    
	  //관리자 기능 - ?�원 목록 조회
	public List getMemberList() {
		String sql = "SELECT * FROM LUNCHBOX_MEMBER";
		List memberlist = new ArrayList();

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberVO member = new MemberVO();
				member.setMEMBER_ID(rs.getString("MEMBER_ID"));
				member.setMEMBER_PWD(rs.getString("MEMBER_PWD"));
				member.setMEMBER_NAME(rs.getString("MEMBER_NAME"));
				member.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL"));
				memberlist.add(member);
			}
			return memberlist;
			
		} catch (Exception e) {
			System.out.println("getDeatilMember ?�러: " + e);
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
		}	//try end
		return null;
	}
	 
    
    
    //?�당 ?�원 ?�보 보기 
    public MemberVO getDetailMember(String id){ 
        String sql="SELECT * FROM lunchbox_member WHERE MEMBER_ID=?"; 
         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setString(1, id); 
            rs=pstmt.executeQuery(); 
            rs.next(); 
             
            MemberVO mb=new MemberVO(); 
            mb.setMEMBER_ID(rs.getString("MEMBER_ID")); 
            mb.setMEMBER_PWD(rs.getString("MEMBER_PWD")); 
            mb.setMEMBER_NAME(rs.getString("MEMBER_NAME")); 
            mb.setMEMBER_EMAIL(rs.getString("MEMBER_EMAIL")); 
             
            return mb; 
        }catch(Exception e){ 
            System.out.println("getDeatilMember ?�러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
         
        return null; 
    } 
     
    //?�원 ??�� 
    public boolean deleteMember(String id){ 
        String sql="DELETE FROM lunchbox_member WHERE MEMBER_ID=?"; 
        int result=0; 
         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setString(1, id); 
             
            result=pstmt.executeUpdate(); 
             
            if(result!=0){ 
                return true; 
            } 
        }catch(Exception e){ 
            System.out.println("deleteMember ?�러: " + e);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException e){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException e){} 
        } 
         
        return false; 
    } 
}
