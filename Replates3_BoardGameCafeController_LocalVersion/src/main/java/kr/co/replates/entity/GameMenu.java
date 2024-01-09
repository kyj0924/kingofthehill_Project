package kr.co.replates.entity;

import lombok.Data;

@Data
public class GameMenu {
	
	private int game_idx;
	private String game_Name;
	private int game_Count;
	private int game_TotalCount;
	private int game_Price;
	private String game_info;
	private String game_PlayerNum;
	private String game_Image;

}
