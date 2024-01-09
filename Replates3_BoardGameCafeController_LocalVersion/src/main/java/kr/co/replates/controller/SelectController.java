package kr.co.replates.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.mapper.OwnerMapper;
import kr.co.replates.service.PlayerService;

@Controller
@RequestMapping("/select")
public class SelectController {
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	OwnerMapper ownerMapper;
	
	@RequestMapping("/inout_Select")
	public String inout_Select(HttpSession session) {
		session.invalidate();
		return "select/inout_Select";
	}
	
	@RequestMapping("/ownerLogout")
	public String ownerLogout(HttpSession session) {
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		int desk_idx = desk.getDesk_idx();
		ownerMapper.roomClear(desk_idx);//플레이 데스크 클리어
		return "redirect:/select/inout_Select";
	}
	
	@RequestMapping("/player_Owner_Select")
	public String player_Owner_Select() {
		
		return "select/player_Owner_Select";
	}
	
	@RequestMapping("/selectLogin")
	public String selectLogin(HttpSession session, Model model, PlayDesk desk, Player player) {
		String player_ID = player.getPlayer_ID();
		String player_PW = player.getPlayer_PW();
		
		if((PlayDesk)session.getAttribute("desk") != null) {
			desk = (PlayDesk) session.getAttribute("desk");
		}
		
		Player dbPlayer = playerService.loginCheck(player_ID);
		
		
		String loginFail_check = (String) session.getAttribute("loginFail");
		String logout_check = (String) session.getAttribute("logout");
		
		// 이전 페이지가 notMemberLogin일때 비회원 로그인을 막고 DB에서 불러온 값이 null된다.
		// 그래서 상위 조건으로 loginFail 되었는지 확인
		if(loginFail_check != null) {
			if(loginFail_check.equals("loginFail")) {
				return "select/selectLogin";
			}
			else {
				return "redirect:/select/player_Owner_Select";
			}
		}
		
		// 사용 종료 버튼 눌러서 로그아웃 시 DB에서 불러온 값이 null이 된다.
		// 그래서 상위 조건으로 logout 되었는지 확인
		else if(logout_check != null) {
			if(logout_check.equals("logout")) {
				return "select/selectLogin";
			}
			else {
				return "redirect:/select/player_Owner_Select";
			}
		}
		
		// DB에서 불러온 값이 null이면 로그인 실패
		else if(dbPlayer == null) {
			System.out.println("예상은 이쪽");
			return "redirect:/select/player_Owner_Select";
		}
		
		// 입력받은 값과 DB에 저장된 값이 id와 pw가 모두 일치하면 로그인 성공
		else if(dbPlayer.getPlayer_ID().equals(player_ID) && dbPlayer.getPlayer_PW().equals(player_PW)) {
			
			// 유저이면 로그인을 막는다.
			if(dbPlayer.getOwnerTag()==0) {
				session.setAttribute("login_Player", dbPlayer);
				return "redirect:/select/player_Owner_Select";
			}
			// 점주이면 다음 페이지로 이동
			else if(dbPlayer.getOwnerTag()==1) {
				session.setAttribute("login_Owner", dbPlayer);
				model.addAttribute("desk", desk);
				session.removeAttribute("desk");
				session.setAttribute("desk", desk);
				return "select/selectLogin";
			}
			else {
				return "redirect:/select/player_Owner_Select";
			}
		}
		else {
			return "redirect:/select/player_Owner_Select";
		}
	}
	
	@RequestMapping("/ownerLoginSelect")
	public String ownerLoginSelect() {
		return "select/ownerLoginSelect";
	}
	
	@RequestMapping("/shopFormLoginPro")
	public String shopFormLoginPro(HttpSession session, Player player) {
		
		String player_ID = player.getPlayer_ID();
		String player_PW = player.getPlayer_PW();
		Player dbPlayer = playerService.loginCheck(player_ID);
		
		// DB에서 불러온 값이 null이면 로그인 실패
		if(dbPlayer == null) {
			return "redirect:/select/player_Owner_Select";
		}
		
		// 입력받은 값과 DB에 저장된 값이 id와 pw가 모두 일치하면 로그인 성공
		else if(dbPlayer.getPlayer_ID().equals(player_ID) && dbPlayer.getPlayer_PW().equals(player_PW)) {
			
			// 유저이면 로그인을 막는다.
			if(dbPlayer.getOwnerTag()==0) {
				session.setAttribute("login_Player", dbPlayer);
				return "redirect:/select/player_Owner_Select";
			}
			// 점포운영 접속 시 점주이면 01인지 확인하고 01일이면 유저들의 등급을 업데이트 하고 다음 페이지로 이동
			else if(dbPlayer.getOwnerTag()==1) {
				session.setAttribute("login_Owner", dbPlayer);
				
				Date now = new Date();
				if(now.getDate()==1 || now.getDate()==01) {
					List<Player> player_li = playerService.all_Player_Info();
					for(int i=0; i<player_li.size(); i++) {
						int pay = player_li.get(i).getPlayer_Payment();
						if(pay>=0 && pay<50000) {
							player_li.get(i).setPlayer_Rating("폰");
						}
						else if(pay>=50000 && pay<100000) {
							player_li.get(i).setPlayer_Rating("나이트");
						}
						else if(pay>=100000 && pay<150000) {
							player_li.get(i).setPlayer_Rating("비숍");
						}
						else if(pay>=150000 && pay<200000) {
							player_li.get(i).setPlayer_Rating("퀸");
						}
						else {
							player_li.get(i).setPlayer_Rating("킹");
						}
						playerService.update_Rating(player_li.get(i));
					}
					playerService.update_Payment_Zero();
				}
				
				return "redirect:/shopForm";
			}
			else {
				return "redirect:/select/player_Owner_Select";
			}
		}
		else {
			return "redirect:/select/player_Owner_Select";
		}
	}
	
}
