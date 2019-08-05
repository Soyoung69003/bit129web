package lunchbox.model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class MemberDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
}
