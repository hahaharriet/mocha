package notice.dao;

import java.util.List;


import notice.model.Notice;


public interface NoticeDAO {
	
	List<Notice> selectAll();//리스트	가라
	
	boolean insert(Notice notice);
	//List<Event> selectByEventNo(int eventno); //상세보기 후기
	
	//이벤트번호로  상세보기 수정 삭제 처리
	Notice selectByNoticeNo(int noticeno);
	
	//페이징 처리
	List<Notice> selectAllPage(int rowStartNumber, int rowEndNumber);
	//업데이트
	void update(Notice notice);
	//삭제
	boolean delete(int noticeno);
	//조회수 처리
	void updateVisited(int no);
	//상세 검색처리
	List<Notice> selectbyNoticeContent(String noticecontent);
}
