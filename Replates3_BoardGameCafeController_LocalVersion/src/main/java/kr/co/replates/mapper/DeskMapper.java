package kr.co.replates.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.DeskOrder;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;

@Mapper
public interface DeskMapper {
	
	// 음식 메뉴 정보 가져오기
	public List<FoodMenu> foodInfo();
	
	// 주문 목록 DB에 저장하기
	public void insertOrder(DeskOrder vo);
		
	// 한가지 음식 메뉴 정보 가져오기
	public List<FoodMenu> oneFoodInfo(int food_idx);
	
	// 음식 주문 시 foodMenu 테이블의 food_Count 감소(재고 감소) 
	public void updateByFoodOrder(DeskOrder vo);
		
	// 음식 재고량과 주문량의 비교를 위해 foodMenu 테이블의 food_Count 가져오기
	public int oneFoodCount(DeskOrder vo);
		
	// 음식 주문 시 playDesk 테이블의 deskAlarm을 true로 만든다.(알림 작업)
	public void sendAlarm(PlayDesk vo);	
	
	//보드게임목록 리스트불러오기
	public List<GameMenu> bgsgetList(Criteria cri);
	public int bgstotalCount(Criteria cri);
	
	//이너홈리스트불러오기
	public List<PlayDesk> getStartTime(int userIdx);
	public List<DeskOrder> getOrder(int userIdx);
	
	//게임예약하기
	public List<PlayDesk> selectgms(int userIdx);
	public void upDateGameName(PlayDesk gamename);
	public void plusGame(String gamename);
	public void minusGame(String gamename);
	
	//이너홈직원호출
	public void sendCallAlarm(PlayDesk vo);	
	
}
