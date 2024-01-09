package kr.co.replates.entity;

import java.util.Date;

import lombok.Data;

@Data
public class NeedFriend_Board {
	
	private int nf_idx;
	private String nf_Title;
	private String nf_Content;
	private String player_ID;
	private Date nf_Indate;
	private int nf_ViewCount;

}
