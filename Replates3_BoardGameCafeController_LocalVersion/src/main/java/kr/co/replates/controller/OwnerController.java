package kr.co.replates.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.replates.entity.DeskOrder;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.entity.TotalSell;
import kr.co.replates.mapper.OwnerMapper;

@Controller
public class OwnerController {
	
	@Autowired
	OwnerMapper oM;
	
	//====================매장 관리 페이지====================
		@PostMapping("/getDeskList/{desk_idx}")//데스크 리스트를 가져옴
		public @ResponseBody List<Object> getDeskList(int desk_idx){
			List<PlayDesk> pd = oM.getDeskInfo(desk_idx);//플레이 데스크를 조회
			List<DeskOrder> Do = oM.getDeskOrderList(desk_idx);//데스크 오더를 조회
			List<Object> all = new ArrayList<Object>();//여기서 pd랑 Do랑 합쳐서 all리스트로 화면단에 가져갑니다.
			all.add(pd);//pd를 all에 삽입합니다.
			all.add(Do);//Do를 all에 삽입합니다.
			
			oM.updateDeskAlram(desk_idx);
			
			return all;
		}
		
		@GetMapping("/payment")//결제 확인 페이지 이동
		public String payment( @RequestParam("desk_idx") String desk_idx, Model m) {
			m.addAttribute("desk_idx", desk_idx);
			return"counter/counterBody/payment";
		}
		
		@GetMapping("/roomClear")//결제 최종 컨트롤
		public String roomClear(@RequestParam("desk_idx") int desk_idx, String day_Data, String Player_ID, TotalSell totalSell, Player givePl) throws ParseException {
			int TotalPrice = 0, TotalFoodPrice = 0, TotalPlayTime = 0;
			List<PlayDesk> Pl = oM.getPlayTime(desk_idx);//플레이 타임을 가지고 온다
			List<DeskOrder> Do = oM.getFoodPrice(desk_idx);//음식 값을 가지고 온다 리스트 조회하는 것 까지 해놨다 이거 조회해서 누적시켜서 업데이트하면 된다.
			Player_ID =Pl.get(0).getPlayer_ID();
			List<Player> player = oM.checkPlayer(Player_ID);//플레이어 누적금액을 위해서 플레이어 데이터 호출
			
			
			for(int i = 0; i < Do.size(); i++) {//음식금액 총합
				TotalFoodPrice += Do.get(i).getFood_Price();
			}
			
			TotalPlayTime = 3000 * (int) Math.ceil(Pl.get(0).getPlayTime() / 60.0);//금액 총 합
			
			TotalPrice = TotalFoodPrice + (TotalPlayTime);
			
			LocalDate now = LocalDate.now();//현재날짜 구하기
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			day_Data = now.format(formatter);
			
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date date = format.parse(day_Data);
			List<TotalSell> ts = oM.getTotalSell(date);//현재날짜 기준으로 토탈셀 리스트 조회한다.

			if(ts.isEmpty()) {//당일 최초 누적금액 삽입
				totalSell.setDay_Data(date);
				totalSell.setFood_Price(TotalFoodPrice);
				totalSell.setPlayTime_Price(TotalPlayTime);
				totalSell.setTotal_Price(TotalPrice);
				oM.addTotalSell(totalSell);
			}
			else {//차후 누적금액 업데이트
				
				totalSell.setDay_Data(ts.get(0).getDay_Data());
				totalSell.setTotal_Price(TotalPrice + ts.get(0).getTotal_Price());
				totalSell.setFood_Price(TotalFoodPrice + ts.get(0).getFood_Price());
				totalSell.setPlayTime_Price(TotalPlayTime + ts.get(0).getPlayTime_Price());
				oM.updateTotalSell(totalSell);
			}
			
			if(!player.isEmpty()) {//회원 개인 누적금액 업데이트

				givePl.setPlayer_ID(player.get(0).getPlayer_ID());
				givePl.setPlayer_Payment(player.get(0).getPlayer_Payment());
				givePl.setPlayer_Payment(givePl.getPlayer_Payment()+TotalPrice);
				oM.updatePlayer_Payment(givePl);
				
			}
			
			if(!Pl.get(0).getGame_Name().isEmpty()) {//사용가능 게임 카운트 업
				String GameName = Pl.get(0).getGame_Name();
				oM.paymentGameCountUp(GameName);
			}
			
			oM.orderClear(desk_idx);//데스크 오더 클리어
			oM.roomClear(desk_idx);//플레이 데스크 클리어
			
			return"counter/counterBody/shopManagementForm";
		}
	
	//====================회원 관리 페이지====================
	@GetMapping("/selectPlayer")
	public String selectPlayer(@RequestParam("player_idx") int player_idx, Model m) {
		Player pl=oM.selectPlayer(player_idx);
		m.addAttribute("pl",pl);
		return "counter/counterBody/selectPlayerForm";
	}
	
	@PostMapping("/playerUpdate")
	public String playerUpdate(Player pl, String player_ID, RedirectAttributes rttr,
							HttpSession session, @RequestParam("player_PW") String player_PW,
							@RequestParam("player_PW2") String player_PW2, @RequestParam("player_idx") int player_idx) {
		
		if(player_PW.equals(player_PW2)) {
			rttr.addFlashAttribute("warning","성공");
			rttr.addFlashAttribute("warningMessage","비밀번호가 변경되었습니다.");
			oM.playerUpdate(pl);
			session.setAttribute("pl", pl);
			return "redirect:/playerForm";
		}else {
			rttr.addAttribute("player_idx", player_idx);
			rttr.addFlashAttribute("warning","실패");
			rttr.addFlashAttribute("warningMessage","비밀번호가 일치하지 않습니다.");
			return "redirect:/selectPlayer";
		}
	}
	
	@GetMapping("/playerDelete")
	public String playerDelete(@RequestParam("player_idx") int player_idx, RedirectAttributes rttr) {
		oM.playerDelete(player_idx);
		rttr.addFlashAttribute("warning","성공");
		rttr.addFlashAttribute("warningMessage","회원이 삭제되었습니다.");
		return "redirect:/playerForm";
	}
	
	
	//====================상품 관리 페이지====================
	//==========음식 관리==========
	@GetMapping("/selectFood")
	public String selectFood(@RequestParam("food_idx") int food_idx, Model m) {
		FoodMenu fm=oM.selectFood(food_idx);
		m.addAttribute("fm",fm);
		return "counter/counterBody/selectFoodForm";
	}
	
	@PostMapping("/foodUpdate")
	public String foodUpdate(FoodMenu fm, Model m, @RequestParam("food_Name") String food_Name,
							@RequestParam("food_idx") int food_idx, RedirectAttributes rttr)  {
	FoodMenu dbFoodMenu = oM.foodDupCheck(food_Name);
		if(dbFoodMenu != null && dbFoodMenu.getFood_idx() != food_idx) {
			rttr.addAttribute("food_idx",food_idx);
			rttr.addFlashAttribute("warning","실패");
			rttr.addFlashAttribute("warningMessage","음식 이름이 중복됩니다.");
			return "redirect:/selectFood";
		}else {
			
			rttr.addFlashAttribute("warning","성공");
			rttr.addFlashAttribute("warningMessage","수정되었습니다.");
			oM.foodUpdate(fm);
			return "redirect:/foodForm";
		}
	}
	
	@PostMapping("/foodImageUpdate")
	public String foodImageUpdate(FoodMenu fm, Model m, @RequestParam("food_idx") int food_idx,
				RedirectAttributes rttr, HttpServletRequest request) throws IOException{
		
			MultipartRequest multi = null;
	      int fileSize = 40 * 1024 * 1024; // 10MB
	      String sPath = request.getRealPath("resources/upload"); //파일의 경로를 sPath에 선언
	      
	      	//DefaultfileRenamePolicy-> 파일명이 중복될 경우 자동으로 새로운 파일명을 생성해 준다. 중복된 파일명 뒤에 일련번호를 붙이는 방식
	         multi = new MultipartRequest(request, sPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
	      
	         
	         // 데이터베이스 테이블에 회원이미지를 업데이트
	         int foodidx=Integer.parseInt(request.getParameter("food_idx")); //파라미터값을 변수에 담는다
	         String newPro="";
	         File file=multi.getFile("food_Image"); //파라미터값을 변수에 담는 작업은 동일하나 방식이 다르다. 이미지파일은 File클래스로 접근, getFile작성
	         if(file !=null) {
	        	//파일 이름의 마지막 점 부분 뒤의 내용, 즉 확장자 명을 가리킨다.
	            String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
	            ext=ext.toUpperCase(); //대문자로 변환하는 함수
	            if(ext.equals("PNG") || ext.equals("GIF") || ext.equals("JPG")){
	               //데이터가 파라미터의 값이 동일할 경우 정보를 띄우는 sql->getMember에서 프로필 내용을 old 변수에 선언
	               String old=oM.selectFood(food_idx).getFood_Image();
	               
	               //경로를 찾기 위해 sPath와 old를 붙여준다
	               File oldFile=new File(sPath+"/"+old);
	               if(oldFile.exists()) { //이전의 파일이 존재하는 지 여부를 확인하여 있으면
	                  oldFile.delete(); //삭제시킨다
	               }
	               newPro=file.getName();
	            }else {
	               if(file.exists()) { //이전의 파일이 존재하지 않고 이미지 파일이 존재한다면
	                  file.delete(); //해당 파일을 삭제
	               }
	               return "redirect:/foodForm";
	              // return "redirect:/selectFood";
	            }
	         }
	         //이미지를 db에 업데이트
	         FoodMenu foodm=new FoodMenu();
	         foodm.setFood_idx(foodidx);
	         foodm.setFood_Image(newPro);
	         oM.foodImageUpdate(foodm);
	         rttr.addAttribute("food_idx",food_idx);
	         //return "redirect:/foodForm";
	         return "redirect:/selectFood";
	}
		
	
	@GetMapping("/foodDelete")
	public String foodDelete(@RequestParam("food_idx") int food_idx, RedirectAttributes rttr) {
		oM.foodDelete(food_idx);
		rttr.addFlashAttribute("warning","성공");
		rttr.addFlashAttribute("warningMessage","음식이 삭제되었습니다.");
		return "redirect:/foodForm";
	}
	
	@GetMapping("/foodInsertForm")
	public String foodInsertForm() {
		return "counter/counterBody/foodInsertForm";
	}
	
	@PostMapping("/foodInsert")
	public String foodInsert(FoodMenu fm, @RequestParam("food_Name") String food_Name, RedirectAttributes rttr, Model m) {
		FoodMenu dbFoodMenu=oM.foodDupCheck(food_Name);
		if(dbFoodMenu != null && dbFoodMenu.getFood_Name().equals(food_Name)) {
			rttr.addFlashAttribute("warning","실패");
			rttr.addFlashAttribute("warningMessage","음식이 중복됩니다.");
			
			m.addAttribute("fm",fm);
			
			return "redirect:/foodInsertForm";
		}else {
			fm.setFood_Image("");
			rttr.addFlashAttribute("warning","성공");
			rttr.addFlashAttribute("warningMessage","음식이 추가되었습니다.");
			oM.foodInsert(fm);
			return "redirect:/foodForm";
		}
	}
	
	
	//==========게임 관리==========
	@GetMapping("/selectGame")
	public String selectGame(@RequestParam("game_idx") int game_idx, Model m) {
		GameMenu gm=oM.selectGame(game_idx);
		m.addAttribute("gm",gm);
		return "counter/counterBody/selectGameForm";
	}
	
	@PostMapping("/gameUpdate")
	public String gameUpdate(GameMenu gm, Model m, @RequestParam("game_Name") String game_Name,
			@RequestParam("game_idx") int game_idx, RedirectAttributes rttr) {
		
		GameMenu dbGameMenu=oM.gameDupCheck(game_Name);
		
		if(dbGameMenu != null && dbGameMenu.getGame_idx() != game_idx) {
			rttr.addAttribute("game_idx",game_idx);
			rttr.addFlashAttribute("warning","실패");
			rttr.addFlashAttribute("warningMessage","게임 이름이 중복됩니다.");
			return "redirect:/selectGame";
		}else {
			rttr.addFlashAttribute("warning","성공");
			rttr.addFlashAttribute("warningMessage","수정되었습니다.");
			oM.gameUpdate(gm);
			return "redirect:/gameForm";
		}
	}
	
	@PostMapping("/gameImageUpdate")
	public String gameImageUpdate(GameMenu gm, Model m, @RequestParam("game_idx") int game_idx,
							RedirectAttributes rttr, HttpServletRequest request) throws IOException{
		
		MultipartRequest multi = null;
		int fileSize = 40 * 1024 * 1024;
		String sPath = request.getRealPath("resources/upload");
		
		multi = new MultipartRequest(request, sPath, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		int gameidx=Integer.parseInt(request.getParameter("game_idx"));
		String newPro="";
		File file=multi.getFile("game_Image");
		if(file != null) {
			String ext=file.getName().substring(file.getName().lastIndexOf(".")+1);
			ext=ext.toUpperCase();
			if(ext.equals("PNG") || ext.equals("GIF") || ext.equals("JPG")){
				String old=oM.selectGame(game_idx).getGame_Image();
				
				File oldFile=new File(sPath+"/"+old);
				if(oldFile.exists()) {
					oldFile.delete();
				}
				newPro=file.getName();
			}else {
				if(file.exists()) {
					file.delete();
				}
				return "redirect:/gameForm";
			}
		}
		GameMenu gamem=new GameMenu();
		gamem.setGame_idx(gameidx);
		gamem.setGame_Image(newPro);
		oM.gameImageUpdate(gamem);
		rttr.addAttribute("game_idx",game_idx);
		return "redirect:/selectGame";
	}
	
	@GetMapping("/gameDelete")
	public String gameDelete(@RequestParam("game_idx") int game_idx, RedirectAttributes rttr) {
		oM.gameDelete(game_idx);
		rttr.addFlashAttribute("warning","성공");
		rttr.addFlashAttribute("warningMessage","게임이 삭제되었습니다.");
		return "redirect:/gameForm";
	}
	
	@GetMapping("/gameInsertForm")
	public String gameinsertForm() {
		return "counter/counterBody/gameInsertForm";
	}
	
	@PostMapping("/gameInsert")
	public String gameInsert(GameMenu gm, @RequestParam("game_Name") String game_Name, RedirectAttributes rttr, Model m) {
		GameMenu dbGameMenu = oM.gameDupCheck(game_Name);
		if(dbGameMenu != null && dbGameMenu.getGame_Name().equals(game_Name)) {
			rttr.addFlashAttribute("warning","실패");
			rttr.addFlashAttribute("warningMessage","게임이 중복됩니다.");
			
			m.addAttribute("gm",gm);
			
			return "redirect:/gameInsertForm";
		}else {
			gm.setGame_Image("");
			rttr.addFlashAttribute("warning","성공");
			rttr.addFlashAttribute("warningMessage","게임이 추가되었습니다.");
			oM.gameInsert(gm);
			return "redirect:/gameForm";
		}
	}
	
	
	//====================매출 관리 페이지====================
    @RequestMapping("/getSevenDaySales")
    public @ResponseBody List<TotalSell> getMonthlySales() {
        List<TotalSell> lt = oM.getSevenDaySales();
        return lt;
    }
    
    @GetMapping("/selectDate")
    public @ResponseBody TotalSell selectDate(@RequestParam("selectedDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date selectedDate) {
        TotalSell totalSell = oM.selectDate(selectedDate);
        return totalSell;
    }

}
