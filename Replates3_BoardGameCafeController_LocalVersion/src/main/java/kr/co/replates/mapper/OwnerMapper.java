package kr.co.replates.mapper;


import java.util.Date;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.DeskOrder;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.entity.TotalSell;


@Mapper
public interface OwnerMapper{
	
	public List<PlayDesk> emptyDeskCheck();//카운터 메인 테이블 조회
	
	//====================매장 관리 페이지====================
		public List<PlayDesk> getDeskInfo(int desk_idx);
		public List<DeskOrder> getDeskOrderList(int desk_idx);
		public List<TotalSell> getTotalSell(Date date);
		public List<PlayDesk> getPlayTime(int desk_idx);
		public List<DeskOrder> getFoodPrice(int desk_idx);
		public void roomClear(int desk_idx);
		public void orderClear(int desk_idx);
		public void addTotalSell(TotalSell totalSell);
		public void updateTotalSell(TotalSell totalSell);
		public List<Player> checkPlayer(String Player_ID);
		public void updatePlayer_Payment(Player givePl);
		public void updateDeskAlram(int desk_idx);
		public void paymentGameCountUp(String GameName);
		public List<Player> playerRating(String player_ID);
	
	//====================회원 관리 페이지====================
		public List<Player> playerGetList(Criteria cri);
		public int totalCount(Criteria cri);
		public Player selectPlayer(int player_idx);
		public void playerUpdate(Player pl);
		public void playerDelete(int player_idx);
		public Player playerDupCheck(String player_ID);
		
		
		//====================상품 관리 페이지====================
		//==========음식 테이블 관련 함수==========
		public List<FoodMenu> foodGetList(Criteria cri);
		public int totalCount2(Criteria cri);
		public FoodMenu selectFood(int food_idx);
		public void foodUpdate(FoodMenu fm);
		public void foodDelete(int food_idx);
		public void foodInsert(FoodMenu fm);
		public FoodMenu foodDupCheck(String food_Name);
		public void foodImageUpdate(FoodMenu foodMenu);
		
		//==========게임 테이블 관련 함수==========
		public List<GameMenu> gameGetList(Criteria cri);
		public int totalCount3(Criteria cri);
		public GameMenu selectGame(int game_idx);
		public void gameUpdate(GameMenu gm);
		public void gameDelete(int game_idx);
		public void gameInsert(GameMenu gm);
		public GameMenu gameDupCheck(String game_Name);
		public void gameImageUpdate(GameMenu gameMenu);
		
		
		//====================매출 관리 페이지====================
		public List<TotalSell> getSevenDaySales();
		public TotalSell selectDate(Date day_Data);
}
