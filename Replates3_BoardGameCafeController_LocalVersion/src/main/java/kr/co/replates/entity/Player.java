package kr.co.replates.entity;

import lombok.Data;

@Data
public class Player {
	
	private int player_idx;
	private String player_ID;
	private String player_PW;
	private String player_PW2;
	private String player_Name;
	private String player_Tel;
	private String player_Email;
	private String player_Rating; // 등급
	private int ownerTag;
	private int player_Payment; // 월 누적 결제액
	
}
