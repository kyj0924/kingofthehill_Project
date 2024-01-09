package kr.co.replates.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Comment {
	
	private int comment_idx;
	private String comment_Content;
	private String comment_Writer;
	private Date comment_Indate;
	private int comment_Board_idx;
	
}
