package kr.co.replates.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.service.DeskService;
import kr.co.replates.service.PlayerService;

@Controller
@RequestMapping("/player")
public class PlayerController {
	
	@Autowired
	PlayerService playerService;
	
	
	@RequestMapping("/innerLogin")
	public String innerLogin(String login_check, HttpSession session, PlayDesk desk, Model model) {

		if(session.getAttribute("desk") == null) {
			session.setAttribute("desk", desk);
		}

		if(session.getAttribute("login_check") == null) {
			session.setAttribute("login_check", login_check);
		}

		return "player/innerLogin";
	}
	
	@RequestMapping("/loginPro")
	public String loginPro(Player player, HttpSession session) {
		Player dbPlayer = playerService.loginCheck(player.getPlayer_ID());
		String login_check = (String) session.getAttribute("login_check");
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		
		// DB에서 불러온 값이 null이면 로그인 실패
		if(dbPlayer == null) {
			return "redirect:/player/innerLogin";
		}
		
		// 입력받은 값과 DB에 저장된 값이 id와 pw가 모두 일치하고
		// 해당 id가 다른 테이블에 로그인 되어 있지 않고, 해당 테이블이 결제가 완료되었다면 로그인 성공
		else if(dbPlayer.getPlayer_ID().equals(player.getPlayer_ID()) && dbPlayer.getPlayer_PW().equals(player.getPlayer_PW()) && playerService.isLogined(player)==0 && playerService.payCheck(desk).equals("")) {
			
			if(dbPlayer.getOwnerTag()==0) {
				// redirect로 보내니까 foodMenu 리스트를 불러오는 sql문을 사용하지 않아도 값이 뜬다.
				session.setAttribute("login_check", login_check);
				session.setAttribute("login_Player", dbPlayer);
				
				// PlayDesk의 객체에 테이블 번호, 로그인한 사람의 아이디, 이름을 세팅
				PlayDesk logined_Desk = (PlayDesk) session.getAttribute("desk");
				logined_Desk.setPlayer_ID(dbPlayer.getPlayer_ID());
				logined_Desk.setPlayer_Name(dbPlayer.getPlayer_Name());
				// 세팅한 정보로 DB 정보 update
				playerService.update_PlayDesk_Info(logined_Desk);
				// session에 담을 자바빈 객체의 정보도 update하기 위해 DB정보 불러와서 세팅
				// db와 서로 달랐던 값이 start_Time만 있으므로 이것만 세팅
				PlayDesk db_desk = playerService.readOneDesk(logined_Desk.getDesk_idx());
				logined_Desk.setStart_Time(db_desk.getStart_Time());
				session.setAttribute("desk", logined_Desk);
				
				return "redirect:/inner/desk/foodOrder";
			}
			else if(dbPlayer.getOwnerTag()==1) {
				session.setAttribute("login_check", login_check);
				session.setAttribute("login_Player", dbPlayer);
				
				// PlayDesk의 객체에 테이블 번호, 로그인한 사람의 아이디, 이름을 세팅
				PlayDesk logined_Desk = (PlayDesk) session.getAttribute("desk");
				logined_Desk.setPlayer_ID(dbPlayer.getPlayer_ID());
				logined_Desk.setPlayer_Name(dbPlayer.getPlayer_Name());
				// 세팅한 정보로 DB 정보 update
				playerService.update_PlayDesk_Info(logined_Desk);
				// session에 담을 자바빈 객체의 정보도 update하기 위해 DB정보 불러와서 세팅
				// db와 서로 달랐던 값이 start_Time만 있으므로 이것만 세팅
				PlayDesk db_desk = playerService.readOneDesk(logined_Desk.getDesk_idx());
				logined_Desk.setStart_Time(db_desk.getStart_Time());
				session.setAttribute("desk", logined_Desk);
				
				return "redirect:/select/ownerLoginSelect";
			}
			else {
				return "redirect:/player/innerLogin";
			}
			
		}
		else {
			return "redirect:/player/innerLogin";
		}
	}
	
	@RequestMapping("/notMemberLogin")
	public String notMemberLogin(@RequestParam("login_check") String login_check, HttpSession session, PlayDesk desk) {
		
		if(playerService.payCheck(desk).equals("")) {
			session.setAttribute("login_check", login_check);
			session.setAttribute("desk", desk);
			// PlayDesk의 객체에 테이블 번호, 비회원 로그인한 사람의 공용 아이디, 이름을 세팅
			PlayDesk notMember_Desk = (PlayDesk) session.getAttribute("desk");
			notMember_Desk.setPlayer_ID("비회원아이디"+desk.getDesk_idx());
			notMember_Desk.setPlayer_Name("비회원이름"+desk.getDesk_idx());
			// 세팅한 정보로 DB 정보 update
			playerService.update_PlayDesk_Info(notMember_Desk);
			// session에 담을 자바빈 객체의 정보도 update하기 위해 DB정보 불러와서 세팅
			// db와 서로 달랐던 값이 start_Time만 있으므로 이것만 세팅
			PlayDesk db_desk = playerService.readOneDesk(notMember_Desk.getDesk_idx());
			notMember_Desk.setStart_Time(db_desk.getStart_Time());
			session.setAttribute("desk", notMember_Desk);
			
			return "redirect:/inner/desk/foodOrder";
		}
		else {
			session.setAttribute("loginFail", "loginFail");
			return "redirect:/select/selectLogin";
		}
	}
	
	@RequestMapping("/endGamePro")
	public String endGamePro(HttpSession session, Model model) {
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		model.addAttribute("desk", desk);
		session.removeAttribute("login_check");
		
		// 로그아웃 할 때의 시간에서 로그인 했을 때의 시간을 빼서 playTime을 구하고 DB에 저장한다.
		PlayDesk logouted_desk = playerService.readOneDesk(desk.getDesk_idx());
		String startTime_str = logouted_desk.getStart_Time();
		Date startTime=null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			startTime = format.parse(startTime_str);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		Date endTime = new Date();
		
		long min = (endTime.getTime() - startTime.getTime()) / 60000;
		int playTime = (int) min;
		if(playTime==0) {
			playTime=1;
		}
		logouted_desk.setPlayTime(playTime);
		playerService.update_PlayTime(logouted_desk);
		String logout = "logout";
		session.setAttribute("logout", logout);
		return "redirect:/select/selectLogin"; // 회원, 비회원 선택 창으로 이동
	}
	
	@RequestMapping("/innerJoin")
	public String innerJoin() {
		return "player/innerJoin";
	}
	
	@RequestMapping("/innerMyPage")
	public String innerMyPage() {
		return "player/innerMyPage";
	}
	
	@RequestMapping("/joinPro")
	public String joinPro(Player player) {
		String input_ID = player.getPlayer_ID();
		String input_PW = player.getPlayer_PW();
		String input_Name = player.getPlayer_Name();
		String input_Tel = player.getPlayer_Tel();
		String input_Email = player.getPlayer_Email();
		
		// 회원가입 시 입력란에 입력하지 않았을 경우 가입 막기
		if(input_ID==null || input_ID.equals("") || input_PW==null || input_PW.equals("") || input_Name==null || input_Name.equals("") || input_Tel==null || input_Tel.equals("") || input_Email == null || input_Email.equals("")) {
			return "redirect:/player/innerJoin";
		}
		// 모든 입력란에 입력을 했을 경우
		else {
			int result = playerService.insert_Player_Info(player);
			if(result==1) {
				// insert문 실행 성공으로 회원가입 성공 메시지를 모달창에 전달할 예정
				// 현재는 조건이 잘 작동하는지 확인하기 위해 출력문만 작성
				System.out.println("회원가입 성공");
				return "redirect:/player/innerLogin";
			}
			else {
				// insert문 실행 실패로 회원가입 실패 메시지를 모달창에 전달할 예정
				// 현재는 조건이 잘 작동하는지 확인하기 위해 출력문만 작성
				System.out.println("회원가입 실패");
				return "redirect:/player/innerJoin";
			}
			
		}
	}
	
	@PostMapping("/checkDuplicateId")
	@ResponseBody
	public String checkDuplicateId(@RequestParam("player_ID") String player_ID) {
		boolean isDuplicate = playerService.isIdDuplicated(player_ID);
	    return isDuplicate ? "duplicate" : "available";
	}
	
	
	
}
