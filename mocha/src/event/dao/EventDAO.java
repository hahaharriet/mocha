package event.dao;

import java.util.List;

import event.model.Event;


public interface EventDAO {
	
	List<Event> selectAll();//리스트	가라
	
	boolean insert(Event event);
	List<Event> selectByEventNo(int eventno); //상세보기 후기
	
	//이벤트번호로 수정 삭제 처리
	Event selectByReviewNo(int eventno);
	
	//페이징 처리
	List<Event> selectAllPage(int rowStartNumber, int rowEndNumber);
	//업데이트
	void update(Event event);
	//삭제
	boolean delete(int eventno);
	//조회수 처리
	void updateVisited(int no);
	//상세 검색처리
	List<Event> selectbyEventSubject(String EVENTSUBJECT);
}
