package event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import event.model.Event;
import review.model.Review;




public class EventDAOImpl extends BaseDAO implements EventDAO {
		// 글쓰기
		private static final String EVENT_INSERT_SQL = "insert into event values(seq_event.nextval,?,?,?,0,?)";
		// 전체 목록
		private static final String EVENT_SELETE_ALL_SQL = "select * from event";
		// 상세보기
		private static final String  EVENT_SELECTBY_EVENTNO_SQL = "select * from event where eventno=?";
		// 페이징 셀렉//나중에 productno로 정렬해라 by productno
		private static final String EVENT_SELECT_ALL_PAGE_SQL = "SELECT * FROM (select ROWNUM RN, events.* FROM (select * from event order by eventno desc) events) WHERE RN BETWEEN ? AND ?";
		// 선택
		private static final String REVIEW_SELECTBY_REVIEWNO_SQL = "select * from review where reviewno= ?";
		// 업데이트
		private static final String EVENT_UPDATE_SQL = "update event set eventsubject=?,start_date=?,end_date=?,eventcontent=? where eventno=?";
		// 삭제
		private static final String EVENT_DELETE_SQL = "delete from event where eventno=?";
		//조회수
		private static final String EVENT_UPDATE_VISITED_SQL="update event set eventvisited = eventvisited+1 where eventno=?";
		//상세 검색
		private static final String EVENT_SELECTBY_EVENTSUBJECT_SQL = "SELECT * FROM event WHERE eventcontent like ? ORDER BY start_date";
	
		@Override
	public List<Event> selectAll() {
			
			List<Event> eventlist = new ArrayList<Event>();
			Connection connection = null;
			ResultSet resultSet = null;
			PreparedStatement preparedStatement = null;

			try {
				connection = getConnection();

				preparedStatement = connection.prepareStatement(EVENT_SELETE_ALL_SQL);

				resultSet = preparedStatement.executeQuery();

				while (resultSet.next()) {

					Event event = new Event();

					event.setEventno(resultSet.getInt("eventno"));
					event.setEventsubject(resultSet.getString("eventsubject"));
					event.setStart_date(resultSet.getString("start_date").split("\\s")[0]);
					event.setEnd_date(resultSet.getString("end_date").split("\\s")[0]);
					event.setEventvisited(resultSet.getInt("eventvisited"));
					event.setEventcontent(resultSet.getString("eventcontent"));
					
					eventlist.add(event);
				}

			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				closeDBObjects(resultSet, preparedStatement, connection);
			}

			return eventlist;

		}

	@Override
	public boolean insert(Event event) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_INSERT_SQL);

			preparedStatement.setString(1, event.getEventsubject());
			preparedStatement.setString(2, event.getStart_date());
			preparedStatement.setString(3, event.getEnd_date());
			preparedStatement.setString(4, event.getEventcontent());
		

			int rowCount = preparedStatement.executeUpdate();

			if (rowCount > 0) {
				result = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;

	}
	
	@Override
	public Event selectByEventNo(int eventno) {
		Event event = null;

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		int no = eventno;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_SELECTBY_EVENTNO_SQL);
			preparedStatement.setInt(1, no);
			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				event = new Event();

				event.setEventno(resultSet.getInt("eventno"));
				event.setEventsubject(resultSet.getString("eventsubject"));
				event.setStart_date(resultSet.getString("start_date").split("\\s")[0]);
				event.setEnd_date(resultSet.getString("end_date").split("\\s")[0]);
				event.setEventvisited(resultSet.getInt("eventvisited"));
				event.setEventcontent(resultSet.getString("eventcontent"));

			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);

		}

		return event;
	}

	
	@Override
	public List<Event> selectAllPage(int rowStartNumber, int rowEndNumber) {
		List<Event> evnetlist = new ArrayList<Event>();
		Event event = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_SELECT_ALL_PAGE_SQL);

			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				event = new Event();
				event.setEventno(resultSet.getInt("eventno"));
				event.setEventsubject(resultSet.getString("eventsubject"));
				event.setStart_date(resultSet.getString("start_date").split("\\s")[0]);
				event.setEnd_date(resultSet.getString("end_date").split("\\s")[0]);
				event.setEventvisited(resultSet.getInt("eventvisited"));
				event.setEventcontent(resultSet.getString("eventcontent"));
				
				evnetlist.add(event);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return evnetlist;

	}
	
	@Override
	public void update(Event event) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_UPDATE_SQL);

			preparedStatement.setString(1, event.getEventsubject());
			preparedStatement.setString(2, event.getStart_date());
			preparedStatement.setString(3, event.getEnd_date());
			preparedStatement.setString(4, event.getEventcontent());
			preparedStatement.setInt(5, event.getEventno());
			
			preparedStatement.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public boolean delete(int eventno) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_DELETE_SQL);
			preparedStatement.setInt(1, eventno);

			int rowCount = preparedStatement.executeUpdate();
			if (rowCount > 0) {
				result = true;
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			closeDBObjects(null, preparedStatement, connection);

		}
		return result;
	}

	@Override
	public void updateVisited(int no) {
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_UPDATE_VISITED_SQL);

			preparedStatement.setInt(1, no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	
	}

	@Override
	public List<Event> selectbyEventcontent(String eventcontent) {
		List<Event> evnetlist = new ArrayList<Event>();
		Event event = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(EVENT_SELECTBY_EVENTSUBJECT_SQL);
			preparedStatement.setString(1, eventcontent);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				event = new Event();
				event.setEventno(resultSet.getInt("eventno"));
				event.setEventsubject(resultSet.getString("eventsubject"));
				event.setStart_date(resultSet.getString("start_date").split("\\s")[0]);
				event.setEnd_date(resultSet.getString("end_date").split("\\s")[0]);
				event.setEventcontent(resultSet.getString("eventcontent"));
			
				evnetlist.add(event);
				

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
		return evnetlist;

	}

	
	

}
