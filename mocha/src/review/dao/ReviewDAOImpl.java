package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import review.model.Review;

public class ReviewDAOImpl extends BaseDAO implements ReviewDAO {
	// 글쓰기
	private static final String REVIEW_INSERT_SQL = "insert into review values(seq_review.nextval,?,?,?,?,sysdate,?,0)";
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
	public List<Review> selectAll() {

		List<Review> reviewlist = new ArrayList<Review>();
		Connection connection = null;
		ResultSet resultSet = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();

			preparedStatement = connection.prepareStatement(REVIEW_SELETE_ALL_SQL);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Review review = new Review();

				review.setReviewno(resultSet.getInt("reviewno"));
				review.setReviewsubject(resultSet.getString("reviewsubject"));
				review.setProductno(resultSet.getInt("productno"));
				review.setRate(resultSet.getInt("rate"));
				review.setReview_memberid(resultSet.getString("review_memberid"));
				review.setReview_date(resultSet.getString("review_date"));
				review.setContent(resultSet.getString("content"));

				reviewlist.add(review);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}

		return reviewlist;

	}

	@Override
	public boolean insert(Review review) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_INSERT_SQL);

			preparedStatement.setString(1, review.getReviewsubject());
			preparedStatement.setInt(2, review.getProductno());
			preparedStatement.setInt(3, review.getRate());
			preparedStatement.setString(4, review.getReview_memberid());
			preparedStatement.setString(5, review.getContent());

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
	public List<Review> selectByProductNo(int productno) {

		Review review = null;

		Connection connection = null;

		PreparedStatement preparedStatement = null;

		ResultSet resultSet = null;

		List<Review> lists = new ArrayList<Review>();

		int inputInt = productno;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_SELECTBY_PRODUCTNO_SQL);
			preparedStatement.setInt(1, inputInt);
			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				review = new Review();
				review.setReviewno(resultSet.getInt("reviewno"));
				review.setReviewsubject(resultSet.getString("reviewsubject"));
				review.setProductno(resultSet.getInt("productno"));
				review.setRate(resultSet.getInt("rate"));
				review.setReview_memberid(resultSet.getString("review_memberid"));
				review.setReview_date(resultSet.getString("review_date"));
				review.setContent(resultSet.getString("content"));
				lists.add(review);
			}
		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);

		}

		return lists;
	}

	@Override
	public List<Review> selectAllPage(int rowStartNumber, int rowEndNumber) {

		List<Review> lists = new ArrayList<Review>();
		Review review = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_SELECT_ALL_PAGE_SQL);

			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				review = new Review();
				review.setReviewno(resultSet.getInt("reviewno"));
				review.setReviewsubject(resultSet.getString("reviewsubject"));
				review.setProductno(resultSet.getInt("productno"));
				review.setRate(resultSet.getInt("rate"));
				review.setReview_memberid(resultSet.getString("review_memberid"));
				review.setReview_date(resultSet.getString("review_date"));
				review.setContent(resultSet.getString("content"));
				review.setVisited(resultSet.getInt("visited"));
				lists.add(review);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return lists;

	}

	@Override
	public void update(Review review) {

		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_UPDATE_SQL);

			preparedStatement.setString(1, review.getReviewsubject());
			preparedStatement.setString(2, review.getContent());
			preparedStatement.setInt(3, review.getRate());
			preparedStatement.setInt(4, review.getReviewno());

			preparedStatement.executeQuery();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	}

	@Override
	public Review selectByReviewNo(int reviewno) {
		Review review = new Review();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_SELECTBY_REVIEWNO_SQL);
			preparedStatement.setInt(1, reviewno);

			resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {

				review = new Review();
				review.setReviewno(resultSet.getInt("reviewno"));
				review.setReviewsubject(resultSet.getString("reviewsubject"));
				review.setProductno(resultSet.getInt("productno"));
				review.setRate(resultSet.getInt("rate"));
				review.setReview_memberid(resultSet.getString("review_memberid"));
				review.setReview_date(resultSet.getString("review_date"));
				review.setContent(resultSet.getString("content"));
				review.setVisited(resultSet.getInt("visited"));
				

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return review;

	}

	@Override
	public boolean delete(int reviewno) {
		
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;

		try {

			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_DELETE_SQL);
			preparedStatement.setInt(1, reviewno);

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
			preparedStatement = connection.prepareStatement(REVIEW_UPDATE_VISITED_SQL);

			preparedStatement.setInt(1, no);

			preparedStatement.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			closeDBObjects(null, preparedStatement, connection);
		}
	
	}

	@Override
	public List<Review> selectbyreviewsubject(String reviewsubject) {
		
		List<Review> lists = new ArrayList<Review>();
		Review review = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;

		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(REVIEW_SELECTBY_REVIEWSUBJECT_SQL);
			preparedStatement.setString(1, reviewsubject);

			resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				review = new Review();
				review.setReviewno(resultSet.getInt("reviewno"));
				review.setReviewsubject(resultSet.getString("reviewsubject"));
				review.setProductno(resultSet.getInt("productno"));
				review.setRate(resultSet.getInt("rate"));
				review.setReview_memberid(resultSet.getString("review_memberid"));
				review.setReview_date(resultSet.getString("review_date"));
				review.setContent(resultSet.getString("content"));
				lists.add(review);
				

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			closeDBObjects(null, preparedStatement, connection);
		}
		return lists;

	}
}
