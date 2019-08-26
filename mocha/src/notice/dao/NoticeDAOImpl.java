package notice.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import notice.model.Notice;


public class NoticeDAOImpl extends BaseDAO implements NoticeDAO {
	// 글쓰기
	private static final String NOTICE_INSERT_SQL = "insert into notice values(seq_notice.nextval,?,?,?,?,0)";
	// 전체 목록
	private static final String NOTICE_SELETE_ALL_SQL = "select * from notice";
	// 상세보기
	private static final String NOTICE_SELECTBY_NOTICENO_SQL = "select * from notice where noticeno=?";				
	// 페이징 셀렉//나중에 productno로 정렬해라 by productno
	private static final String NOTICE_SELECT_ALL_PAGE_SQL = "SELECT * FROM (select ROWNUM RN, notices.* FROM (select * from notice order by noticeno desc) notices) WHERE RN BETWEEN ? AND ?";	
	// 업데이트
	private static final String NOTICE_UPDATE_SQL = "update notice set noticesubject=?,notice_date=?,noticecontent=? where noticeno=?";
	// 삭제
	private static final String NOTICE_DELETE_SQL = "delete from notice where noticeno=?";
	//조회수
	private static final String NOTICE_UPDATE_VISITED_SQL="update notice set visited = visited+1 where noticeno=?";
	//상세 검색
	private static final String NOTICE_SELECTBY_NOTICESUBJECT_SQL = "SELECT * FROM notice WHERE noticesubject like ? ORDER BY notice_date";
		
	@Override
	public List<Notice> selectAll() {
		
		List<Notice> noticelist = new ArrayList<Notice>();
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();

			preparedStatement = connection.prepareStatement(NOTICE_SELETE_ALL_SQL);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Notice notice = new Notice();

				notice.setNoticeno(resultSet.getInt("noticeno"));
				notice.setNoticesubject(resultSet.getString("noticesubject"));
				notice.setNoticecontent(resultSet.getString("noticecontent"));
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);
				notice.setNotice_memberid(resultSet.getString("notice_memberid"));
				notice.setVisited(resultSet.getInt("visited"));
								
				noticelist.add(notice);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return noticelist;

	}


	@Override
	public boolean insert(Notice notice) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_INSERT_SQL);

			preparedStatement.setString(1, notice.getNoticesubject());
			preparedStatement.setString(2, notice.getNoticecontent());
			preparedStatement.setString(3, notice.getNotice_date());
			preparedStatement.setString(4, notice.getNotice_memberid());

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
	public Notice selectByNoticeNo(int noticeno) {
		Notice notice = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int no = noticeno;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_SELECTBY_NOTICENO_SQL);
			preparedStatement.setInt(1, no);

			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				
				
				notice = new Notice();
				notice.setNoticeno(resultSet.getInt("noticeno"));
				notice.setNoticesubject(resultSet.getString("noticesubject"));				
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);
				notice.setNotice_memberid(resultSet.getString("notice_memberid"));
				notice.setNoticecontent(resultSet.getString("noticecontent"));
				notice.setVisited(resultSet.getInt("visited"));
				
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return notice;

	}

	@Override
	public List<Notice> selectAllPage(int rowStartNumber, int rowEndNumber) {

		List<Notice> noticelist = new ArrayList<Notice>();
		Notice notice = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_SELECT_ALL_PAGE_SQL);

			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				notice = new Notice();
				notice.setNoticeno(resultSet.getInt("noticeno"));
				notice.setNoticesubject(resultSet.getString("noticesubject"));
				notice.setNoticecontent(resultSet.getString("noticecontent"));
				notice.setNotice_date(resultSet.getString("notice_date"));
				notice.setNotice_memberid(resultSet.getString("notice_memberid"));
				notice.setVisited(resultSet.getInt("visited"));
				
				noticelist.add(notice);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return noticelist;

	}

	@Override
	public void update(Notice notice) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_UPDATE_SQL);			
			preparedStatement.setString(1, notice.getNoticesubject());
			preparedStatement.setString(2, notice.getNotice_date().split("\\s")[0]);
			preparedStatement.setString(3, notice.getNoticecontent());
			preparedStatement.setInt(4, notice.getNoticeno());

			preparedStatement.executeQuery();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	}

	
	@Override
	public boolean delete(int noticeno) {
		
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_DELETE_SQL);
			preparedStatement.setInt(1, noticeno);

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
			preparedStatement = connection.prepareStatement(NOTICE_UPDATE_VISITED_SQL);

			preparedStatement.setInt(1, no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	
	}
	
	@Override
	public List<Notice> selectbyNoticeSubject(String noticesubject) {
		
		List<Notice> noticelist = new ArrayList<Notice>();
		Notice notice = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(NOTICE_SELECTBY_NOTICESUBJECT_SQL);
			preparedStatement.setString(1, noticesubject);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				notice = new Notice();

				notice.setNoticeno(resultSet.getInt("noticeno"));
				notice.setNoticesubject(resultSet.getString("noticesubject"));
				notice.setNoticecontent(resultSet.getString("noticecontent"));
				notice.setNotice_date(resultSet.getString("notice_date").split("\\s")[0]);
				notice.setNotice_memberid(resultSet.getString("notice_memberid"));
				notice.setVisited(resultSet.getInt("visited"));
								
				noticelist.add(notice);
				

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
		return noticelist;

	}


}
