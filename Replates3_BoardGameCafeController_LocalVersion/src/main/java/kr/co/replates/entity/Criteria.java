package kr.co.replates.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page; //현재 페이지 번호
	private int perPageNum; //한 페이지에 보여줄 게시글 개수
	
	//검색기능 변수
	private String SearchType;
	private String SearchKey;
	
	private String foodSearchType;
	private String foodSearchKey;
	
	private String gameSearchType;
	private String gameSearchKey;
	
	private int gspage;  
	private int gsperPageNum;
	
	private String gstype;
	private String gskeyword;
	
	private int bgspage;  
	private int bgsperPageNum;

	private String bgstype;
	private String bgskeyword;
	
	private String friendSearchType;
	private String friendSearchKey;
	
	private String noticeSearchType;
	private String noticeSearchKey;
	
	private String requestSearchType;
	private String requestSearchKey;
	

	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	}
	
	//현재 페이지 게시글 시작 번호
		public int getPageStart() {
			return (page-1)*perPageNum; //1~5
		}
		
		
		
		
		
		
		
		
		
}
