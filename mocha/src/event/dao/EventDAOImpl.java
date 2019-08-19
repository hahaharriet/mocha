package event.dao;

import java.util.List;

import event.model.Event;


public class EventDAOImpl extends BaseDAO implements EventDAO {
	// 글쓰기
		private static final String EVENT_INSERT_SQL = "insert into review values(seq_review.nextval,?,?,?,?,sysdate,?,0)";
		// 전체 목록
		private static final String REVIEW_SELETE_ALL_SQL = "select * from review";
		// 상세보기
		private static final String REVIEW_SELECTBY_PRODUCTNO_SQL = "select * from review where productno=?";
		// 페이징 셀렉//나중에 productno로 정렬해라 by productno
		private static final String REVIEW_SELECT_ALL_PAGE_SQL = "SELECT * FROM (select ROWNUM RN, reviews.* "
				+ "FROM (select * from review order by reviewno desc) reviews) WHERE RN BETWEEN ? AND ?";
		// 선택
		private static final String REVIEW_SELECTBY_REVIEWNO_SQL = "select * from review where reviewno= ?";
		// 업데이트
		private static final String REVIEW_UPDATE_SQL = "update review set reviewsubject=?,content=?,rate=? where reviewno=?";
		// 삭제
		private static final String REVIEW_DELETE_SQL = "delete from review where reviewno=?";
		//조회수
		private static final String REVIEW_UPDATE_VISITED_SQL="update review set visited = visited+1 where reviewno=?";
		//상세 검색
		private static final String REVIEW_SELECTBY_REVIEWSUBJECT_SQL = "SELECT * FROM review WHERE reviewsubject like ? ORDER BY REVIEW_MEMBERID";
	@Override
	public List<Event> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Event event) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Event> selectByEventNo(int eventno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Event selectByReviewNo(int eventno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Event> selectAllPage(int rowStartNumber, int rowEndNumber) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Event event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean delete(int eventno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void updateVisited(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Event> selectbyEventSubject(String EVENTSUBJECT) {
		// TODO Auto-generated method stub
		return null;
	}

	

}
