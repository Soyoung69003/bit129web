package lunchbox.model.board;

import java.sql.Date;

public class BoardVO {
	private int BOARD_NUM;
	private String BOARD_TITLE;
	private String BOARD_ID;
	private String BOARD_CONTENT;
	private int BOARD_PRESENT;
	private int BOARD_MAXPRESENT;
	private Date BOARD_DATE;
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public int getBOARD_MAXPRESENT() {
		return BOARD_MAXPRESENT;
	}
	public void setBOARD_MAXPRESENT(int bOARD_MAXPRESENT) {
		BOARD_MAXPRESENT = bOARD_MAXPRESENT;
	}
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(String bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public int getBOARD_PRESENT() {
		return BOARD_PRESENT;
	}
	public void setBOARD_PRESENT(int bOARD_PRESENT) {
		BOARD_PRESENT = bOARD_PRESENT;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
}
