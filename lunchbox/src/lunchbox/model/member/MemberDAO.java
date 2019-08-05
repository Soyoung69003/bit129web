package lunchbox.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public int isMember(MemberVO member){ 
        String sql ="select member_pwd from boardmember where member_id=?"; 
        int result=-1; 
         
        try{ 
            pstmt=con.prepareStatement(sql); 
            pstmt.setString(1, member.getMEMBER_ID()); 
            rs = pstmt.executeQuery(); 
             
            if(rs.next()){ 
                if(rs.getString("MEMBER_PW").equals( 
                                    member.getMEMBER_PWD())){ 
                    result=1;//��ġ. 
                }else{ 
                    result=0;//����ġ. 
                } 
            }else{ 
                result=-1;//���̵� �������� ����. 
            } 
        }catch(Exception ex){ 
            System.out.println("isMember ����: " + ex);             
        }finally{ 
            if(rs!=null) try{rs.close();}catch(SQLException ex){} 
            if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){} 
        } 
        return result; 
    }
}