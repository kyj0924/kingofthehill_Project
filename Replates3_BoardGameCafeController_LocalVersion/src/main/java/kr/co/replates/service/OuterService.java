package kr.co.replates.service;

import java.util.List;

import kr.co.replates.entity.Comment;
import kr.co.replates.entity.Criteria;
import kr.co.replates.entity.NeedFriend_Board;
import kr.co.replates.entity.Nf_Comment;
import kr.co.replates.entity.Notice_Board;
import kr.co.replates.entity.Request_Board;

public interface OuterService {
	
	//===============친구찾기===============
	public List<NeedFriend_Board> needFriendGetList(Criteria cri);
	public void nfWrite(NeedFriend_Board nf);
	public int totalCount4(Criteria cri);
	public NeedFriend_Board selectNeedFriend(int nf_idx);
	public void selectFriendUpdate(NeedFriend_Board nf);
	public void needFriendDelete(int nf_idx);
	public void viewCountUpdate(int nf_idx);
	public void nf_addComment(Nf_Comment nf_comment);
	public List<Nf_Comment> nf_getComment(int idx);
	public void nf_deleteComment(Nf_Comment nf_comment);
		
	
	public List<Request_Board> getRequest_Board(Criteria cri);
	public void requestWrite(Request_Board request_Board);
	public Request_Board getselectRequest(int request_idx);
	public void addComment(Comment comment);
	public List<Comment> getComment(int idx);
	public void deleteComment (Comment comment);
	public void request_BoardUpdate(Request_Board request_Board);
	public void requestRemove (int idx);
	public void removeComment (int idx);
	public int totalCount6(Criteria cri);
	public void viewCountup(int idx);
	
	// 공지사항의 모든 게시글 정보를 불러온다.
	public List<Notice_Board> noticeInfo(Criteria cri);
	
	// 공지사항의 특정 게시글 정보를 불러온다.
	public Notice_Board oneNoticeInfo(int notice_idx);
	
	// 공지사항에 게시글을 등록한다.
	public void noticeWrite(Notice_Board notice_Board);
	
	// 특정 게시글의 조회수를 증가시킨다.
	public void noticeCountUp(int notice_idx);
	
	// 특정 게시글을 수정한다.
	public void noticeInfoUpdate(Notice_Board notice_Board);
	
	// 특정 게시글을 삭제한다.
	public void noticeRemove(int notice_idx);
	
	// 공지사항 페이지네이션
	public int totalCount5(Criteria cri);
}
