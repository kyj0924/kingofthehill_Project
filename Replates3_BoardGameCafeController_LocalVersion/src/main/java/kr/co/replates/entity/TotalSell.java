package kr.co.replates.entity;

import java.util.Date;

import lombok.Data;

@Data
public class TotalSell {
	
	private Date day_Data;
	private int total_Price;
	private int food_Price;
	private int playTime_Price;

}
