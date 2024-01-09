package kr.co.replates.entity;

import java.sql.Date;

import lombok.Data;

@Data
public class Nf_Comment {
	
	private int nf_comment_idx;
	private String nf_comment_Content;
	private String nf_comment_Writer;
	private Date nf_comment_Indate;
	private int nf_comment_Board_idx;
}
