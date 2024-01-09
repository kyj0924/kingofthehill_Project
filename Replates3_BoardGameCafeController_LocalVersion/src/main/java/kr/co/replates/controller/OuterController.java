package kr.co.replates.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.replates.entity.Comment;
import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.NeedFriend_Board;
import kr.co.replates.entity.Nf_Comment;
import kr.co.replates.entity.Notice_Board;
import kr.co.replates.entity.PageCre;
import kr.co.replates.entity.PlayDesk;
import kr.co.replates.entity.Player;
import kr.co.replates.mapper.OwnerMapper;
import kr.co.replates.entity.Request_Board;
import kr.co.replates.service.OuterService;
import kr.co.replates.service.PlayerService;

@Controller
@RequestMapping("/outer")
public class OuterController {
	
	@Autowired
	PlayerService playerService;
	
	@Autowired
	OuterService outerService;
	
	@Autowired
	OwnerMapper oM;
	
	// 공지사항 페이지
	@RequestMapping("/outerNotice")
	public String outerNotice(HttpSession session, String outer_login_check, Criteria cri, Model m) {
		
		// 세션에 저장된 로그인 여부 확인 변수를 가져온다
		outer_login_check = (String) session.getAttribute("outer_login_check");
		
		// 세션에 저장된 값이 없을 경우 기본값을 false로 맞춰줘서 로그인과 회원가입 버튼이 나타나도록 한다.
		// 세션에 저장된 값이 있을 경우 실행되지 않고 기존 값이 유지된다.
		if(outer_login_check==null || outer_login_check.equals("")) {
			outer_login_check = "false";
			session.setAttribute("outer_login_check", outer_login_check);
		}
		
		List<Notice_Board> notice_li = outerService.noticeInfo(cri);
		m.addAttribute("notice_li", notice_li);
		PageCre pageCre = new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(outerService.totalCount5(cri));
		m.addAttribute("pageCre", pageCre);
		
		return "outer/outerNotice";
	}
	
	// 외부 로그인 페이지
	@RequestMapping("/outerLogin")
	public String outerLogin(HttpServletRequest request, HttpSession session) {
		String before_pageUrl = request.getHeader("referer");
		if(before_pageUrl.contains("Join")) {
			before_pageUrl = (String)session.getAttribute("before_pageUrl");
		}
		
		session.setAttribute("before_pageUrl", before_pageUrl);
		return "outer/outerLogin";
	}
	
	// 로그인 유효성 검사
	@RequestMapping("/outerLoginPro")
	public String outerLoginPro(Player player, HttpSession session) {
		// 외부 로그인 시 유효성 검사 후 리턴
		// 로그인 성공 시 기존에 머물렀던 페이지로 돌아감
		Player dbPlayer = playerService.loginCheck(player.getPlayer_ID());
		String outer_login_check = (String) session.getAttribute("outer_login_check");
		String before_pageUrl = (String) session.getAttribute("before_pageUrl");

		// jsp 이름만 남기고 앞의 공통된 주소는 잘라냄
		String beforePageUrl = before_pageUrl.substring(33);
		
		// DB에서 불러온 값이 null이면 로그인 실패
		if(dbPlayer == null) {
			return "redirect:/outer/outerLogin";
		}
		
		// 입력받은 값과 DB에 저장된 값이 id, pw가 모두 일치하면 로그인 성공
		else if(dbPlayer.getPlayer_ID().equals(player.getPlayer_ID()) && dbPlayer.getPlayer_PW().equals(player.getPlayer_PW())) {
			outer_login_check = "true";
			session.setAttribute("outer_login_check", outer_login_check);
			session.setAttribute("login_Player", dbPlayer);
			session.removeAttribute("before_pageUrl");
			// 로그인 페이지로 오기 전에 머물렀던 페이지로 다시 이동
			return "redirect:/outer/"+beforePageUrl;
		}
		else {
			return "redirect:/outer/outerLogin";
		}
	}
	
	// 회원가입 페이지
	@RequestMapping("/outerJoin")
	public String outerJoin(HttpServletRequest request, HttpSession session) {
		String before_pageUrl = request.getHeader("referer");
		if(before_pageUrl.contains("Login")) {
			before_pageUrl = (String)session.getAttribute("before_pageUrl");
		}
		session.setAttribute("before_pageUrl", before_pageUrl);
			
		return "outer/outerJoin";
	}
	
	// 회원가입 유효성 검사
	@RequestMapping("/outerJoinPro")
	public String outerJoinPro(Player player) {
		// 회원가입 유효성 검사 후 리턴
		// 회원가입 성공 시 로그인 페이지로 이동
		String input_ID = player.getPlayer_ID();
		String input_PW = player.getPlayer_PW();
		String input_Name = player.getPlayer_Name();
		String input_Tel = player.getPlayer_Tel();
		String input_Email = player.getPlayer_Email();
		
		// 회원가입 시 입력란에 입력하지 않았을 경우 가입 막기
		if(input_ID==null || input_ID.equals("") || input_PW==null || input_PW.equals("") || input_Name==null || input_Name.equals("") || input_Tel==null || input_Tel.equals("") || input_Email == null || input_Email.equals("")) {
			return "redirect:/outer/outerJoin";
		}
		// 모든 입력란에 입력을 했을 경우
		else {
			int result = playerService.insert_Player_Info(player);
			if(result==1) {
				// insert문 실행 성공으로 회원가입 성공 메시지를 모달창에 전달할 예정
				// 현재는 조건이 잘 작동하는지 확인하기 위해 출력문만 작성
				System.out.println("회원가입 성공");
				return "redirect:/outer/outerLogin";
			}
			else {
				// insert문 실행 실패로 회원가입 실패 메시지를 모달창에 전달할 예정
				// 현재는 조건이 잘 작동하는지 확인하기 위해 출력문만 작성
				System.out.println("회원가입 실패");
				return "redirect:/outer/outerJoin";
			}
		}
	}
	
	// 아이디 중복 확인
	@PostMapping("/checkDuplicateId")
	@ResponseBody
	public String checkDuplicateId(@RequestParam("player_ID") String player_ID) {
		boolean isDuplicate = playerService.isIdDuplicated(player_ID);
	    return isDuplicate ? "duplicate" : "available";
	}
	
	// 공지사항 페이지의 팝업
	@RequestMapping("/outerNoticePopup")
	public String outerNoticePopup() {
		return "outer/outerNoticePopup";
	}
	
	// 친구 찾기 페이지
	@RequestMapping("/outerFriend")
	public String outerFriend(Criteria cri, Model m) {
		List<NeedFriend_Board> readBoard=outerService.needFriendGetList(cri);
		m.addAttribute("readBoard",readBoard);
		PageCre pageCre=new PageCre();
		pageCre.setCri(cri);
		pageCre.setTotalCount(outerService.totalCount4(cri));
		m.addAttribute("pageCre",pageCre);
		return "outer/outerFriend";
	}
	
	@PostMapping("/nfWrite")
	public String register(NeedFriend_Board nf) {
		outerService.nfWrite(nf);
		return "redirect:/outer/outerFriend";
	}
	
	@PostMapping("/needFriendModify")
	public String selectModify(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey, Model m, NeedFriend_Board nf) {
		outerService.selectFriendUpdate(nf);
		NeedFriend_Board readBoard = outerService.selectNeedFriend(idx);
		List<Nf_Comment> nf_comment = outerService.nf_getComment(idx);
		m.addAttribute("readBoard",readBoard);
		m.addAttribute("comment",nf_comment);
		
		m.addAttribute("PageKey",PageKey);
		return "outer/selectBoard";
	}
	
	@RequestMapping("/nf_delete")
	public String needFriendRemove(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey) {
		outerService.needFriendDelete(idx);
		outerService.removeComment(idx);
		return "redirect:/outer/outerFriend";
	}
	
		
	// 실시간 테이블 확인 페이지
	
		@RequestMapping(value="/RealTimeList", method = {RequestMethod.GET})
		@ResponseBody
		public List<PlayDesk> RealTimeList(){
			List<PlayDesk> playli = oM.emptyDeskCheck(); //테이블목록조회
			return playli;
		}
		
		@RequestMapping("/outerRealtime")
		public String outerRealtime(Model m) {
			
			List<PlayDesk> playli = oM.emptyDeskCheck();
			m.addAttribute("playli",playli);
			
			return "outer/outerRealtime";
		}
	
	//==============================요청사항 작업중===================================
	// 요청 사항 페이지
	@RequestMapping("/outerRequest")
	public String outerRequest(Criteria cri,Model m) {
		
		List<Request_Board> readBoard = outerService.getRequest_Board(cri);
		
		m.addAttribute("readBoard",readBoard);
		
		PageCre pageCre=new PageCre();
		
		pageCre.setCri(cri);
		
		pageCre.setTotalCount(outerService.totalCount6(cri));
		
		m.addAttribute("pageCre",pageCre);
		
		return "outer/outerRequest";
	}
	

	@RequestMapping("/outerWriteForm")
	public String outerWriteForm(Model m,@RequestParam("PageKey") String PageKey) {
		m.addAttribute("PageKey",PageKey);
		return"/outer/outerWriteForm";
	}
	
	@PostMapping("/requestWrite")
	public String requestWrite(Request_Board request_Board) {
		outerService.requestWrite(request_Board);
		return"redirect:/outer/outerRequest";
	}
	
	@RequestMapping("/selectRequest")
	public String selectRequest(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey, Model m, HttpServletRequest request){
		if(PageKey.equals("Request")){
			Request_Board readBoard = outerService.getselectRequest(idx);
			List<Comment> comment = outerService.getComment(idx);
			m.addAttribute("readBoard",readBoard);
			m.addAttribute("comment",comment);
			outerService.viewCountup(idx);
			
		}
		else if(PageKey.equals("NoticePage")) {
			Notice_Board readBoard = outerService.oneNoticeInfo(idx);
			
			String before_pageUrl = request.getHeader("referer");
			if(!before_pageUrl.contains("modify") && !before_pageUrl.contains("Modify")) {
				outerService.noticeCountUp(idx);
			}
			m.addAttribute("readBoard",readBoard);
		}
		else if(PageKey.equals("NeedFriend")) {
			NeedFriend_Board readBoard=outerService.selectNeedFriend(idx);
			List<Nf_Comment> nf_comment=outerService.nf_getComment(idx);
			String before_pageUrl = request.getHeader("referer");
			if(!before_pageUrl.contains("modify") && !before_pageUrl.contains("Modify")) {
				outerService.viewCountUpdate(idx);
			}
			m.addAttribute("readBoard",readBoard);
			m.addAttribute("comment",nf_comment);
		}
		
		m.addAttribute("PageKey",PageKey);

		return"/outer/selectBoard";
	}
	
	@RequestMapping("/commentWrite")
	public String commentWrite(Comment comment, Request_Board request_Board, String PageKey, Model m) {
		m.addAttribute("readBoard",request_Board);
		m.addAttribute("PageKey",PageKey);
		outerService.addComment(comment);
		
		int idx = request_Board.getRequest_idx();
		
		List<Comment> ct = outerService.getComment(idx);
		m.addAttribute("comment",ct);
		return"/outer/selectBoard";
	}
	
	@RequestMapping("/nf_commentWrite")
	public String nf_commentWrite(Nf_Comment nf_comment, NeedFriend_Board nf, String PageKey, Model m) {
		m.addAttribute("readBoard",nf);
		m.addAttribute("PageKey",PageKey);
		outerService.nf_addComment(nf_comment);

		int idx = nf.getNf_idx();
		
		List<Nf_Comment> ct = outerService.nf_getComment(idx);
		m.addAttribute("comment",ct);
		return"/outer/selectBoard";
	}
	
	@RequestMapping("/deleteComment")
	public String deleteComment(Comment comment, Request_Board request_Board, String PageKey, Model m) {
		m.addAttribute("readBoard",request_Board);
		m.addAttribute("PageKey",PageKey);
		outerService.deleteComment(comment);
		System.out.println(comment);
		int idx = request_Board.getRequest_idx();
		
		List<Comment> ct = outerService.getComment(idx);
		m.addAttribute("comment",ct);
		return"/outer/selectBoard";
	}
	
	@RequestMapping("/nf_deleteComment")
	public String nf_deleteComment(Nf_Comment nf_comment, NeedFriend_Board nf, String PageKey, Model m) {
		m.addAttribute("readBoard",nf);
		m.addAttribute("PageKey",PageKey);
		outerService.nf_deleteComment(nf_comment);
		int idx = nf.getNf_idx();
		
		List<Nf_Comment> ct = outerService.nf_getComment(idx);
		m.addAttribute("comment",ct);
		return"/outer/selectBoard";
	}
	
	@RequestMapping("/requestModify")
	public String requestModify(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey, Model m, Request_Board request_Board) {
					
		outerService.request_BoardUpdate(request_Board);
		Request_Board readBoard = outerService.getselectRequest(idx);
		List<Comment> comment = outerService.getComment(idx);
		m.addAttribute("readBoard",readBoard);
		m.addAttribute("comment",comment);
		
		m.addAttribute("PageKey",PageKey);
		return "outer/selectBoard";
	}
	
	@RequestMapping("/request_delete")
	public String request_delete(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey) {
		
		outerService.requestRemove(idx);
		outerService.removeComment(idx);
		return "redirect:/outer/outerRequest";
	}
	//==============================요청사항 작업중===================================
	
	// 외부 마이페이지
	@RequestMapping("/outerMyPage")
	public String outerMyPage() {
		return "outer/outerMyPage";
	}
	
	// 외부 로그아웃
	@RequestMapping("/outerLogout")
	public String outerLogout(HttpSession session) {
		session.removeAttribute("outer_login_check");
		session.removeAttribute("login_Player");
		return "redirect:/select/inout_Select";
	}
	
	
	@RequestMapping("/noticeWrite")
	public String noticeWrite(Notice_Board notice_Board) {
		outerService.noticeWrite(notice_Board);
		return "redirect:/outer/outerNotice";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey, Model m) {
		
		if(PageKey.equals("Request")){
			Request_Board readBoard = outerService.getselectRequest(idx);
			m.addAttribute("readBoard",readBoard);
		}
		else if(PageKey.equals("NoticePage")) {
			Notice_Board readBoard = outerService.oneNoticeInfo(idx);
			m.addAttribute("readBoard",readBoard);
		}
		else if(PageKey.equals("NeedFriend")) {
			NeedFriend_Board readBoard=outerService.selectNeedFriend(idx);
			m.addAttribute("readBoard",readBoard);
		}
		
		m.addAttribute("PageKey",PageKey);
		return "outer/modifyForm";
	}
	
	@RequestMapping("/noticeModify")
	public String noticeModify(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey, Model m, Notice_Board notice_Board) {
					
		outerService.noticeInfoUpdate(notice_Board);
		Notice_Board readBoard = outerService.oneNoticeInfo(idx);
		m.addAttribute("readBoard",readBoard);
		
		m.addAttribute("PageKey",PageKey);
		return "outer/selectBoard";
	}
	
	@RequestMapping("/noticeDeletePro")
	public String noticeDelete(@RequestParam("idx") int idx, @RequestParam("PageKey") String PageKey) {
		
		outerService.noticeRemove(idx);
		return "redirect:/outer/outerNotice";
	}
	
	//아우터홈
	@RequestMapping("/outerHome")
	public String outerHome(HttpSession session, String outer_login_check) {	
		// 세션에 저장된 로그인 여부 확인 변수를 가져온다
		outer_login_check = (String) session.getAttribute("outer_login_check");	
			// 세션에 저장된 값이 없을 경우 기본값을 false로 맞춰줘서 로그인과 회원가입 버튼이 나타나도록 한다.
			// 세션에 저장된 값이 있을 경우 실행되지 않고 기존 값이 유지된다.
			if(outer_login_check==null || outer_login_check.equals("")) {
				outer_login_check = "false";
				session.setAttribute("outer_login_check", outer_login_check);
			}	
		return "outer/outerHome";
	}
}
