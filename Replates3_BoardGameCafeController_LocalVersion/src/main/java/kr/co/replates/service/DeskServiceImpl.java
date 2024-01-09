package kr.co.replates.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.DeskOrder;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.mapper.DeskMapper;

@Service
public class DeskServiceImpl implements DeskService{
	
	@Autowired
	DeskMapper deskMapper;
	
	@Override
	public List<FoodMenu> foodInfo() {
		// 음식 메뉴 정보 가져오기
		List<FoodMenu> foodList = deskMapper.foodInfo();
		return foodList;
	}

	@Override
	public void insertOrder(DeskOrder vo) {
		deskMapper.insertOrder(vo);
		
	}

	@Override
	public List<GameMenu> bgsgetList(Criteria cri) {
		List<GameMenu> GameMenuli = deskMapper.bgsgetList(cri);
		return GameMenuli;
	}

	@Override
	public int bgstotalCount(Criteria cri) {
		return deskMapper.bgstotalCount(cri);
		
	}
	
	@Override
	public List<FoodMenu> oneFoodInfo(int food_idx) {
		return deskMapper.oneFoodInfo(food_idx);
	}
	
	@Override
	public void updateByFoodOrder(DeskOrder vo) {
		deskMapper.updateByFoodOrder(vo);
		
	}

	@Override
	public int oneFoodCount(DeskOrder vo) {
		return deskMapper.oneFoodCount(vo);
	}

	@Override
	public void sendAlarm(PlayDesk vo) {
		deskMapper.sendAlarm(vo);
		
	}


	@Override
	public List<PlayDesk> getStartTime(int userIdx) {
		List<PlayDesk> PlayDeskli = deskMapper.getStartTime(userIdx); 
		
		return PlayDeskli;
	}

	@Override
	public List<DeskOrder> getOrder(int userIdx) {
		List<DeskOrder> DeskOrderli = deskMapper.getOrder(userIdx);
		return DeskOrderli;
	}


	@Override
	public void plusGame(String gamename) {
		deskMapper.plusGame(gamename);
		
	}

	@Override
	public void minusGame(String gamename) {
		deskMapper.minusGame(gamename);
		
	}
	
	@Override
	public List<PlayDesk> selectgms(int userIdx) {
		List<PlayDesk> PlayDeskli =deskMapper.selectgms(userIdx);
		return PlayDeskli;
		
	}

	@Override
	public void upDateGameName(PlayDesk gamename) {
		deskMapper.upDateGameName(gamename);
		
	}

	@Override
	public void sendCallAlarm(PlayDesk vo) {
		deskMapper.sendCallAlarm(vo);
		
	}
	

}
