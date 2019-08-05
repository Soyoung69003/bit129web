package lunchbox.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

public class BoardDAO {
	DataSource ds;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
}
