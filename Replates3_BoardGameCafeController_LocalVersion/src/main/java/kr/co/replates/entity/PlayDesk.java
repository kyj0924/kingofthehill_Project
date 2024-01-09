package kr.co.replates.entity;

import java.util.Date;

import lombok.Data;

@Data
public class PlayDesk {
	
	private int desk_idx;
	private String player_ID;
	private String player_Name;
	private String start_Time;
	private String game_Name;
	private int playTime;
	private String desk_Alarm;
	private String call_Alarm;
	
}
