package kr.co.replates.entity;

import lombok.Data;

@Data
public class FoodMenu {
	
	private int food_idx;
	private String food_Name;
	private int food_Count;
	private int food_Price;
	private String food_Type;
	private String food_Image;
	
	// 주문 시 배열로 만들 문자열을 불러올 때 임시로 활용되는 변수
	private String temp_food_Count;
	private String temp_food_Price;

}
