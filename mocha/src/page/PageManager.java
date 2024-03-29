package page;


public class PageManager {

	private int requestPage;

	public PageManager() {

	}

	public PageManager(int requestPage) {

		this.requestPage = requestPage;
	}

	public PageRowResult getPageRowResult() {

		PageRowResult pageRowResult = new PageRowResult();

		// pageRowResult의 객체변수 값 세팅
		pageRowResult.setRowStartNumber(PageInfo.ROW_COUNT_PRE_PAGE * (requestPage - 1) + 1);
		pageRowResult.setRowEndNumber(PageInfo.ROW_COUNT_PRE_PAGE * requestPage);

		return pageRowResult;

	}

	public PageGroupResult getpageGroupResult(String sql) {

		PageGroupResult pageGroupResult = new PageGroupResult();

		// groupResult의 객체변수 값 세팅
		int requestPageGroupNumber =(requestPage-1)/PageInfo.SHOW_PAGE_COUNT ;
		
		pageGroupResult.setGroupStartNumber(requestPageGroupNumber*PageInfo.SHOW_PAGE_COUNT+1);
		pageGroupResult.setGroupEndNumber((requestPageGroupNumber+1)*PageInfo.SHOW_PAGE_COUNT);
		
		/*int requestPageGroupNumber =(int)Math.cell((double)requestPage/PageInfo.SHOW_PAGE_COUNT) ; 방법2
	 
		groupResult.setGroupStartNumber(requestPageGroupNumber*PageInfo.SHOW_PAGE_COUNT-(PageInfo.SHOW_PAGE_COUNT-1);
		groupResult.setGroupEndNumber(requestPageGroupNumber*PageInfo.SHOW_PAGE_COUNT);*/
	  
		//총줄수 가져오기
		PageDAO dao = new PageDAOImpl();
		int totalRow = dao.getCount(sql);
		
		//총 링크 개수
		int totalPageNumber = (totalRow-1)/PageInfo.ROW_COUNT_PRE_PAGE+1;
		
		//last 페이지 링크값 변경하기
		if (pageGroupResult.getGroupEndNumber()>totalPageNumber) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}
		
		//before,after 유무
		if (pageGroupResult.getGroupStartNumber()==1) {
			
			pageGroupResult.setBeforePage(false);
		}
		
		if (pageGroupResult.getGroupEndNumber()==totalPageNumber) {
			
			pageGroupResult.setAfterPage(false);
		}
		
		pageGroupResult.setSelectPageNumber(requestPage);
		
		return pageGroupResult;
	}

/*	public static void main(String[] args) {
		
		// 테스트 페이지
		PageManager manager = new PageManager(3);
		System.out.println(manager.getpageGroupResult().getGroupStartNumber());
		System.out.println(manager.getpageGroupResult().getGroupEndNumber());
		
		for (int i = 1; i <= 4; i++) {
			PageManager manager02 = new PageManager(i);
			manager.getPageRowResult();

			System.out.println(manager02.getPageRowResult().getRowStartNumber());
			System.out.println(manager02.getPageRowResult().getRowEndNumber());
			System.out.println("==================================================");
		}
	}*/
}
