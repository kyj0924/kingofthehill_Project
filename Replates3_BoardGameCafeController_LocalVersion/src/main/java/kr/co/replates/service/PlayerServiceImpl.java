package kr.co.replates.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.mapper.PlayerMapper;

@Service
public class PlayerServiceImpl implements PlayerService {
	
	@Autowired
	PlayerMapper playerMapper;
	
	@Override
	public Player loginCheck(String player_ID) {
		Player db_Player = playerMapper.loginCheck(player_ID);
		return db_Player;
	}
	
	@Override
	public int insert_Player_Info(Player pvo) {
		int result = playerMapper.insert_Player_Info(pvo);
		return result;
	}
	
	// 아이디 중복체크(입력한 id에 해당하는 컬럼 개수가 0보다 크면 true를 리턴, 0이면 false를 리턴한다.
	// Controller에서는 삼항연산자로 true이면 duplicate, false이면 available을 리턴한다.
	// jsp에서 리턴된 값을 ajax를 통해 받아서 duplicate인지 available인지에 따라 아이디 중복 체크를 한다.
	@Override
	public boolean isIdDuplicated(String player_ID) {
		int count = playerMapper.countById(player_ID);
	    return count > 0;
	}
	
	// 유저 로그인 시 playDesk에 update 하기
	@Override
	public void update_PlayDesk_Info(PlayDesk pvo) {
		playerMapper.update_PlayDesk_Info(pvo);
		
	}
		
	// playDesk에 있는 한 행의 DB 정보 가져오기
	@Override
	public PlayDesk readOneDesk(int desk_idx) {
		PlayDesk desk =  playerMapper.readOneDesk(desk_idx);
		return desk;
			
	}
	
	// 유저 로그아웃 시 playDesk에 playTime 정보 update 하기
	@Override
	public void update_PlayTime(PlayDesk pvo) {
		playerMapper.update_PlayTime(pvo);
	}
	
	// 유저 등급 변경
	@Override
	public void update_Rating(Player pvo) {
		playerMapper.update_Rating(pvo);
			
	}
	
	// 모든 유저 정보 가져오기
	@Override
	public List<Player> all_Player_Info() {
		List<Player> player_li = playerMapper.all_Player_Info();
		return player_li;
	}
	
	// 모든 유저 월 누적 결제액 0으로 만들기
	@Override
	public void update_Payment_Zero() {
		playerMapper.update_Payment_Zero();
			
	}
	
	// 해당 아이디가 현재 로그인 되어 있는 테이블이 있는지 확인
	// (다른 테이블에 동시에 하나의 아이디로 로그인하는 것을 막기 위함)
	@Override
	public int isLogined(Player pvo) {
		return playerMapper.isLogined(pvo);
	}
	
	// 해당 테이블이 결제되지 않았다면 그 테이블의 새로운 로그인을 막기 위해
	// playDesk 테이블의 특정 테이블에 로그인된 id 정보가 남아있는지 확인
	@Override
	public String payCheck(PlayDesk pvo) {
		return playerMapper.payCheck(pvo);
	}

}
