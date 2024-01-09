package kr.co.replates.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Notice_Board {
	
	private int notice_idx;
	private String notice_Title;
	private String notice_Content;
	private String notice_Writer;
	private Date notice_Indate;
	private int notice_ViewCount;

}
