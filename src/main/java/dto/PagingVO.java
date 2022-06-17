package dto;

public class PagingVO {
	private int page = 1;
	private int totalCount;
	private int beginPage;
	private int endPage;
	private int displayRow = 10;
	private int displayPage = 10;
	private boolean prev;
	private boolean next;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		PagingVO();
	}
	private void PagingVO() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		System.out.println("endpage : "+endPage);
		beginPage = endPage-(displayPage-1);
		System.out.println("displayPage : "+displayPage);
		System.out.println("beginpage : "+beginPage);
		int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
		if(totalPage<endPage) {
			endPage=totalPage;
			next = false;
		}else {
			next = true;
		}
		prev = (beginPage==1)?false:true;
		System.out.println("endPage : "+endPage);
		System.out.println("totalpage : "+totalPage);
		
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}


}
