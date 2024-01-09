package kr.co.replates.service;

import java.util.List;

import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;

public interface PlayerService {
	
	// 로그인 유효성 검사
	public Player loginCheck(String player_ID);
	
	// 회원가입 시 입력한 정보 DB에 저장하고 저장이 잘 되면 1을, 아니라면 0을 반환
	public int insert_Player_Info(Player pvo);
	
	// 아이디 중복체크
	boolean isIdDuplicated(String Player_ID);
	
	// 유저 로그인 시 playDesk에 update 하기
	public void update_PlayDesk_Info(PlayDesk pvo);
		
	// playDesk에 있는 한 행의 DB 정보 가져오기
	public PlayDesk readOneDesk(int desk_idx);
	
	// 유저 로그아웃 시 playDesk에 playTime 정보 update 하기
	public void update_PlayTime(PlayDesk pvo);
	
	// 유저 등급 변경
	public void update_Rating(Player pvo);
	
	// 모든 유저 정보 가져오기
	public List<Player> all_Player_Info();
	
	// 모든 유저 월 누적 결제액 0으로 만들기
	public void update_Payment_Zero();
	
	// 해당 아이디가 현재 로그인 되어 있는 테이블이 있는지 확인
	// (다른 테이블에 동시에 하나의 아이디로 로그인하는 것을 막기 위함)
	public int isLogined(Player pvo);
	
	// 해당 테이블이 결제되지 않았다면 그 테이블의 새로운 로그인을 막기 위해
	// playDesk 테이블의 특정 테이블에 로그인된 id 정보가 남아있는지 확인
	public String payCheck(PlayDesk pvo);
}
