package kr.co.replates.entity;

import java.util.Date;

import lombok.Data;

@Data
public class DeskOrder {
	
	private int order_idx;
	private int desk_idx;
	private String food_Name;
	private int food_Price;
	private int food_Count;
	private String order_Time;

}
