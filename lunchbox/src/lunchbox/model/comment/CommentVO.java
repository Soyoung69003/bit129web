package lunchbox.model.comment;

public class CommentVO {
	private int COMMENT_NUMBER;
	private int COMMENT_BOARD_NUMBER;
	private String COMMENT_NAME;
	private String COMMENT_CONTENT;
	
	public int getCOMMENT_NUMBER() {
		return COMMENT_NUMBER;
	}
	public void setCOMMENT_NUMBER(int cOMMENT_NUMBER) {
		COMMENT_NUMBER = cOMMENT_NUMBER;
	}
	public int getCOMMENT_BOARD_NUMBER() {
		return COMMENT_BOARD_NUMBER;
	}
	public void setCOMMENT_BOARD_NUMBER(int cOMMENT_BOARD_NUMBER) {
		COMMENT_BOARD_NUMBER = cOMMENT_BOARD_NUMBER;
	}
	public String getCOMMENT_NAME() {
		return COMMENT_NAME;
	}
	public void setCOMMENT_NAME(String cOMMENT_NAME) {
		COMMENT_NAME = cOMMENT_NAME;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
	
}
