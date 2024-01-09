package kr.co.replates.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.replates.entity.Comment;
import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.NeedFriend_Board;
import kr.co.replates.entity.Nf_Comment;
import kr.co.replates.entity.Notice_Board;
import kr.co.replates.entity.Request_Board;
import kr.co.replates.mapper.OuterMapper;

@Service
public class OuterServiceImpl implements OuterService{

	@Autowired
	OuterMapper outerMapper;
	
	
	//===============친구찾기===============
	@Override
	public List<NeedFriend_Board> needFriendGetList(Criteria cri){
		List<NeedFriend_Board> li=outerMapper.needFriendGetList(cri);
		return li;
	}
	
	@Override
	public int totalCount4(Criteria cri) {
		return outerMapper.totalCount4(cri);
	}

	@Override
	public void nfWrite(NeedFriend_Board nf) {
		outerMapper.nfWrite(nf);
	}
	
	@Override
	public void viewCountUpdate(int nf_idx) {
		outerMapper.viewCountUpdate(nf_idx);
		
	}
	
	@Override
	public NeedFriend_Board selectNeedFriend(int nf_idx) {
		NeedFriend_Board nf=outerMapper.selectNeedFriend(nf_idx);
		return nf;
	}
	
	@Override
	public void selectFriendUpdate(NeedFriend_Board nf) {
		outerMapper.selectFriendUpdate(nf);
	}
	
	@Override
	public void needFriendDelete(int nf_idx) {

        // 원글 삭제
		outerMapper.needFriendDelete(nf_idx);
	}
	
	@Override
	public void nf_addComment(Nf_Comment nf_comment) {
		outerMapper.nf_addComment(nf_comment);
	}
	
	@Override
	public List<Nf_Comment> nf_getComment(int idx){
		List<Nf_Comment> li=outerMapper.nf_getComment(idx);
		return li;
	}
	
	@Override
	public void nf_deleteComment(Nf_Comment nf_comment) {
		outerMapper.nf_deleteComment(nf_comment);
	}
	
	
	
	

	@Override
	public List<Request_Board> getRequest_Board(Criteria cri) {
		List<Request_Board> li = outerMapper.getRequest_Board(cri);
		return li;
	}
	
	@Override
	public void requestWrite(Request_Board request_Board) {
		outerMapper.requestWrite(request_Board);
		
	}

	@Override
	public Request_Board getselectRequest(int request_idx) {
		Request_Board request_Board = outerMapper.getselectRequest(request_idx);
		return request_Board;
	}
	
	@Override
	public List<Notice_Board> noticeInfo(Criteria cri) {
		List<Notice_Board> notice_li = outerMapper.noticeInfo(cri);
		return notice_li;
	}
	
	@Override
	public Notice_Board oneNoticeInfo(int notice_idx) {
		Notice_Board oneNotice = outerMapper.oneNoticeInfo(notice_idx);
		return oneNotice;
	}

	@Override
	public void noticeWrite(Notice_Board notice_Board) {
		outerMapper.noticeWrite(notice_Board);
		
	}

	@Override
	public void noticeCountUp(int notice_idx) {
		outerMapper.noticeCountUp(notice_idx);
		
	}

	@Override
	public void noticeInfoUpdate(Notice_Board notice_Board) {
		outerMapper.noticeInfoUpdate(notice_Board);
		
	}

	@Override
	public void noticeRemove(int notice_idx) {
		outerMapper.noticeRemove(notice_idx);
		
	}


	@Override
	public void addComment(Comment comment) {
		outerMapper.addComment(comment);
		
	}

	@Override
	public List<Comment> getComment(int idx) {
		List<Comment> li = outerMapper.getComment(idx);
		return li;
	}

	@Override
	public void deleteComment(Comment comment) {
		outerMapper.deleteComment(comment);
		
	}
	
	@Override
	public int totalCount5(Criteria cri) {
		return outerMapper.totalCount5(cri);
	}

	@Override
	public void request_BoardUpdate(Request_Board request_Board) {
		outerMapper.request_BoardUpdate(request_Board);
		
	}

	@Override
	public void requestRemove(int idx) {
		outerMapper.requestRemove(idx);
		
	}

	@Override
	public void removeComment(int idx) {
		outerMapper.removeComment(idx);
		
	}

	@Override
	public int totalCount6(Criteria cri) {
		
		return outerMapper.totalCount6(cri);
	}

	@Override
	public void viewCountup(int idx) {
		outerMapper.viewCountup(idx);
		
	}
}
