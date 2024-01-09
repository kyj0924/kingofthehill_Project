package kr.co.replates.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.DeskOrder;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PageCre;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.service.DeskService;

@Controller
@RequestMapping("/inner/desk")
public class DeskController {
	
	@Autowired
	DeskService deskService;
	
	@RequestMapping(value="/desk/foodList", method= {RequestMethod.GET})
	@ResponseBody
	public List<FoodMenu> foodList() {
		List<FoodMenu> food_li = deskService.foodInfo();
		return food_li;
	}
	
	@RequestMapping(value="/desk/oneFoodInfo/{food_idx}", method= {RequestMethod.POST})
	@ResponseBody
	public List<FoodMenu> oneFoodInfo(int food_idx) {
		List<FoodMenu> oneFood_li = deskService.oneFoodInfo(food_idx);
		return oneFood_li;
	}
	
	
	@RequestMapping("/foodOrder")
	public String foodOrder(Player player, HttpSession session, PlayDesk desk) {
		if(session.getAttribute("desk") == null) {
			session.setAttribute("desk", desk);
		}
		return "inner/desk/foodOrder";
	}	
	
	@RequestMapping("/foodOrderPro")
	public String foodOrderPro(FoodMenu foodMenu, HttpSession session, Model model) {

		PlayDesk db_desk = (PlayDesk) session.getAttribute("desk");
		int desk_idx = db_desk.getDesk_idx();
		
		String[] food_Name_Arr = foodMenu.getFood_Name().split(" ");
		String[] food_Count_Arr = foodMenu.getTemp_food_Count().split(" ");
		String[] food_Price_Arr = foodMenu.getTemp_food_Price().split(" ");
		for(int i=0; i<food_Name_Arr.length; i++) {
			DeskOrder deskOrder = new DeskOrder();
			if(food_Name_Arr[i].equals("")) {
				continue;
			}
			deskOrder.setFood_Name(food_Name_Arr[i]);
			deskOrder.setFood_Count(Integer.parseInt(food_Count_Arr[i]));
			deskOrder.setFood_Price(Integer.parseInt(food_Price_Arr[i]));
			deskOrder.setDesk_idx(desk_idx);
			
			// food_Name을 기준으로 food_Count만큼 빼기
			// 만약 뺐을 때 값이 0보다 작으면 그 항목은 주문되지 않게 함
			int food_Count = deskService.oneFoodCount(deskOrder);
			int temp_Count = food_Count - deskOrder.getFood_Count();
			if(temp_Count < 0) {
				continue;
			}
			else {
				deskService.insertOrder(deskOrder);
				deskService.updateByFoodOrder(deskOrder);
				
				// desk_idx를 기준으로 desk_Alarm을 true로 만들기
				db_desk.setDesk_Alarm("true");
				deskService.sendAlarm(db_desk);
			}
		}

		return "redirect:/inner/desk/foodOrder";
		
	}
	
	@RequestMapping("/innerHome")
	public String innerHome(Model m, HttpSession session) {
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		int userIdx = desk.getDesk_idx();

		// 이너홈리스트불러오기
		List<PlayDesk> PlayDeskli = deskService.getStartTime(userIdx);
		String pt = PlayDeskli.get(0).getStart_Time();
		pt = pt.substring(0, 16);
		m.addAttribute("pt", pt);
		List<DeskOrder> DeskOrderli = deskService.getOrder(userIdx);
		m.addAttribute("DeskOrderli", DeskOrderli);

		return "inner/desk/innerHome";
	}
	
	@RequestMapping("/innerHomepro")
	public String innerHomepro(Model m, HttpSession session, PlayDesk playDesk) {
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		int userIdx = desk.getDesk_idx();
		
		desk.setCall_Alarm("true");
		deskService.sendCallAlarm(desk);
		
		List<PlayDesk> PlayDeskli = deskService.getStartTime(userIdx);
		String pt = PlayDeskli.get(0).getStart_Time();
		pt = pt.substring(0, 16);
		m.addAttribute("pt", pt);
		List<DeskOrder> DeskOrderli = deskService.getOrder(userIdx);
		m.addAttribute("DeskOrderli", DeskOrderli);
		
		return "inner/desk/innerHome";
	}
	
	
	@RequestMapping("/boardGameSearch")
	public String boardGameSearch(Model m, Criteria cri) {
		List<GameMenu> GameMenuli = deskService.bgsgetList(cri);
		m.addAttribute("GameMenuli", GameMenuli);
		// 보드게임목록 리스트불러오기
		PageCre pageCre = new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(deskService.bgstotalCount(cri));
		m.addAttribute("pageCre", pageCre); // 페이징 처리하기 위해 list.jsp로 넘겨야한다

		return "inner/desk/boardGameSearch";
	}
	
	
	@RequestMapping("/boardGameSearchPro")
	public String boardGameSearchPro(Model m, GameMenu gameMenu,RedirectAttributes rttr, HttpSession session, PlayDesk playDesk) {
		PlayDesk desk = (PlayDesk) session.getAttribute("desk");
		
		int userIdx = desk.getDesk_idx();
		String gamename = gameMenu.getGame_Name();
		
		List<PlayDesk> PlayDeskli = deskService.selectgms(userIdx);
		
		playDesk.setDesk_idx(userIdx);
		
		
		if (PlayDeskli.get(0) != null && (PlayDeskli.get(0).getGame_Name() == null || PlayDeskli.get(0).getGame_Name().equals("")))  {
					//게임 예약하기
			deskService.selectgms(userIdx);
			deskService.upDateGameName(playDesk); //게임이름 넣기
			deskService.minusGame(gamename); 
			
			desk.setDesk_Alarm("true");
			deskService.sendAlarm(desk);
			
		}else {

			deskService.plusGame(PlayDeskli.get(0).getGame_Name());
			deskService.upDateGameName(playDesk); 
			deskService.minusGame(gamename); 
			
			desk.setDesk_Alarm("true");
			deskService.sendAlarm(desk);
			
		}

		return "redirect:/inner/desk/innerHome";
		
		}
	
	@RequestMapping("/counterMessage")
	public String counterMessage() {
		return "inner/desk/counterMessage";
	}
	
	@RequestMapping("/innerMyPage")
	public String innerMyPage() {
		return "inner/desk/innerMyPage";
	}
	

}
