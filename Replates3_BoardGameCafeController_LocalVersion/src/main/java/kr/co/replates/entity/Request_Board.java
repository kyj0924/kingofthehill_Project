package kr.co.replates.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Request_Board {
	
	private int request_idx;
	private String request_Title;
	private String request_Content;
	private String request_Writer;
	private Date request_Indate;
	private int request_ViewCount;

}
