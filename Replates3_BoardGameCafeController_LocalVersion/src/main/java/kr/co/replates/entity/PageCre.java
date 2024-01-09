package kr.co.replates.entity;
import lombok.Data;

//페이징 처리 생성하는 클래스
@Data
public class PageCre {
	private Criteria cri;
	private int totalCount; //총 게시글 수
	private int startPage; //시작 페이지 번호
	private int endPage; //끝 페이지 번호
	private boolean prev; //이전 버튼
	private boolean next; //다음 버튼
	private int showPageNum=5;
	
	//총 게시글 수 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		createPage();
	}
	
	public void createPage() {
		
		//1. 화면에 보여질 마지막 페이지 번호
		endPage=(int)(Math.ceil(cri.getPage()/(double)showPageNum)*showPageNum);
		
		//2. 시작 페이지 번호
		startPage=(endPage-showPageNum)+1;
		
		if(startPage<=0)
			startPage=1;
		
		//3. 전체 마지막 페이지 계산
		int tmpPage=(int)(Math.ceil((totalCount)/(double)cri.getPerPageNum()));
		
		//4. 화면에 보여질 마지막 페이지 체크
		if(tmpPage<endPage) {
			endPage=tmpPage;
			//마지막 번호 9인데 10이 보이면..9를 마지막페이지로 설정해야함
		}
		
		//5. 이전 페이지 버튼이 존재해야하는지
		prev=(startPage==1)? false:true; //인덱스가 1~10일 경우 -> startPage=1
		
		//6. 다음 페이지 버튼이 존재해야하는지
		next=(endPage<tmpPage)? true:false; //내가 현재 보고있는 페이지의 마지막 페이지
						//tmpPage: 전체 게시글이 500개라고 가정하면 50
		
	}
}
