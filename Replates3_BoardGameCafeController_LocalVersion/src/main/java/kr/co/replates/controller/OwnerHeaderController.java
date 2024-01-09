package kr.co.replates.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.FoodMenu;
import kr.co.replates.entity.GameMenu;
import kr.co.replates.entity.PageCre;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.entity.TotalSell;
import kr.co.replates.mapper.OwnerMapper;


@Controller
public class OwnerHeaderController {
	
	@Autowired
	OwnerMapper oM;
	
		//운영중인 테이블 조회 ajax
		@GetMapping("/callDeskList")
		public @ResponseBody List<Object> callDeskList() {
			List<PlayDesk> pd = oM.emptyDeskCheck();
			List<String> rt = new ArrayList<String>();
			
			for(int i = 0; i < pd.size(); i++) {
				String prt = null;
				String player_ID = pd.get(i).getPlayer_ID();
					List<Player> pl = oM.playerRating(player_ID);
					if(pl.isEmpty()) {
						prt = "빈방";
					}else {
					prt = pl.get(0).getPlayer_Rating();
					}

					rt.add(prt);

			}
			
			List<Object> all = new ArrayList<Object>();//여기서 합쳐서 all리스트로 화면단에 가져갑니다.
			
			all.add(rt);
			all.add(pd);
			return all;
		}
		
		//운영중인 테이블 조회
		@GetMapping("/shopForm")
		public String shopForm(Model m) {

			List<PlayDesk> li = oM.emptyDeskCheck();
			m.addAttribute("li",li);

			return "counter/counterBody/shopManagementForm";
		}
	
	@RequestMapping("/foodForm")
	public String foodGetList(Model m, Criteria cri) {
		//음식 테이블 GetList
		List<FoodMenu> li=oM.foodGetList(cri);
		m.addAttribute("li",li);
		PageCre pageCre=new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(oM.totalCount2(cri));
		m.addAttribute("pageCre",pageCre);
		
		return "counter/counterBody/foodManagementForm";
	}
	
	@RequestMapping("/gameForm")
	public String totalgetlist(Model m, Criteria cri) {
		//게임 테이블 GetList
		List<GameMenu> li=oM.gameGetList(cri);
		m.addAttribute("li",li);
		PageCre pageCre=new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(oM.totalCount3(cri));
		m.addAttribute("pageCre",pageCre);

		return "counter/counterBody/gameManagementForm";
	}
	
	@RequestMapping("/playerForm")
	public String playerGetList(Model m, Criteria cri){
		List<Player> li=oM.playerGetList(cri);
		m.addAttribute("li",li);
		
		PageCre pageCre=new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(oM.totalCount(cri));
		m.addAttribute("pageCre",pageCre);
		
		return "counter/counterBody/playerManagementForm";
	}
	
	@RequestMapping("/salesForm")
	public String getMonthlySales(Model m) {
		return "counter/counterBody/salesManagementForm";
	}
	
}
