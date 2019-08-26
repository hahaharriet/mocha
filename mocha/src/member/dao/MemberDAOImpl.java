package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.java.swing.plaf.windows.WindowsTreeUI.CollapsedIcon;

import javafx.util.converter.PercentageStringConverter;
import member.model.Member;

public class MemberDAOImpl extends BaseDAO implements MemberDAO{
	//전체 리스트
	private static final String MEMBER_SELECT_ALL_SQL="select * from member";
	private static final String MEMBER_SELECT_ALL_NO_SQL="select * from member where memberno = ?";
	//로그인
	private static final String	MEMBER_SELECT_BY_NO_SQL="SELECT * FROM MEMBER WHERE MEMBERNO = ?";
	private static final String MEMBER_SELECT_BY_ID_SQL="SELECT * FROM MEMBER WHERE MEMBERID = ?";
	private static final String MEMBER_SELECT_BY_EMAIL_SQL="select * from member where email = ?";
	//회원가입
	private static final String MEMBER_INTSERT_SQL="insert into member values(seq_no.nextval,?,?,?,?)";
	//중복확인
	private static final String MEMBER_COUNT_BY_ID_SQL= "SELECT COUNT(*) AS cnt FROM member WHERE memberid = ?";
	private static final String MEMBER_COUNT_BY_EMAIL_SQL= "SELECT COUNT(*) AS cnt FROM member WHERE EMAIL = ?";
	//수정
	private static final String MEMBER_UPDATE_PASSWORD_SQL= "update member set password = ? where memberno = ?";
	private static final String MEMBER_UPDATE_NAME_SQL="update member set membername = ? where memberno = ?";
	private static final String MEMBER_UPDATE_EMAIL_SQL="update member set email = ? where memberno =?";
	//삭제
	private static final String MEMBER_DELETE_SQL="delete from member where memberno = ?";
	
	@Override
	public List<Member> selectAll() {
		List<Member> members = new ArrayList<Member>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_SELECT_ALL_SQL);
			resultSet = preparedStatement.executeQuery();  
			
			while (resultSet.next()) {
				Member member = new Member();
				
				member.setMemberno(resultSet.getInt("memberno"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setPassword(resultSet.getString("password"));
				member.setMembername(resultSet.getString("membername"));
				member.setEmail(resultSet.getString("email"));	
				
				members.add(member);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return members;
	}
	
	@Override
	public List<Member> selectAllMemberno(int memberno) {
		List<Member> members = new ArrayList<Member>();

		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_SELECT_ALL_SQL);
			preparedStatement.setInt(1, memberno);
			resultSet = preparedStatement.executeQuery();  
			
			while (resultSet.next()) {
				Member member = new Member();
				
				member.setMemberno(resultSet.getInt("memberno"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setPassword(resultSet.getString("password"));
				member.setMembername(resultSet.getString("membername"));
				member.setEmail(resultSet.getString("email"));	
				
				members.add(member);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return members;
	}

	@Override
	public Member selectByNo(int memberno) {
		Member member = new Member();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_SELECT_BY_NO_SQL);
			preparedStatement.setInt(1, memberno);
			resultSet = preparedStatement.executeQuery();  
			
			while (resultSet.next()) {
				member.setMemberno(resultSet.getInt("memberno"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setPassword(resultSet.getString("password"));
				member.setMembername(resultSet.getString("membername"));
				member.setEmail(resultSet.getString("email"));	
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return member;
	}

	@Override
	public Member selectById(String memberid) {
		Member member = new Member();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_SELECT_BY_ID_SQL);
			preparedStatement.setString(1, memberid);
			resultSet = preparedStatement.executeQuery();  
			
			while (resultSet.next()) {
				member.setMemberno(resultSet.getInt("memberno"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setPassword(resultSet.getString("password"));
				member.setMembername(resultSet.getString("membername"));
				member.setEmail(resultSet.getString("email"));	
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return member;
	}

	@Override
	public boolean insert(Member member) {
		boolean result = false;
		
		Connection connection =null;
		PreparedStatement preparedStatement= null;
		
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_INTSERT_SQL);
			preparedStatement.setString(1, member.getMemberid());
			preparedStatement.setString(2, member.getPassword());
			preparedStatement.setString(3, member.getMembername());
			preparedStatement.setString(4, member.getEmail());
			
			int rowCount = preparedStatement.executeUpdate();
			if (rowCount >0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public int checkById(String memberid) {
		int count = 1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_COUNT_BY_ID_SQL);
			preparedStatement.setString(1, memberid);
			
			resultSet = preparedStatement.executeQuery();

			if(resultSet.next()) {
				count = resultSet.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public boolean updatePassword(Member member) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(MEMBER_UPDATE_PASSWORD_SQL);
			preparedStatement.setString(1, member.getPassword());
			preparedStatement.setInt(2, member.getMemberno());
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean updateName(Member member) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(MEMBER_UPDATE_NAME_SQL);
			preparedStatement.setString(1, member.getMembername());
			preparedStatement.setInt(2, member.getMemberno());
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean updateEmail(Member member) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(MEMBER_UPDATE_EMAIL_SQL);
			preparedStatement.setString(1, member.getEmail());
			preparedStatement.setInt(2, member.getMemberno());
			
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public boolean delete(int memberno) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement= null;
		
		try {
			connection = getConnection();
			
			preparedStatement = connection.prepareStatement(MEMBER_DELETE_SQL);
			preparedStatement.setInt(1,memberno);
	
			int rowCount = preparedStatement.executeUpdate();
			if(rowCount>0) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public Member selectByEmail(String email) {
		Member member = new Member();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_SELECT_BY_EMAIL_SQL);
			preparedStatement.setString(1, email);
			resultSet = preparedStatement.executeQuery();  
			
			while (resultSet.next()) {
				member.setMemberno(resultSet.getInt("memberno"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setPassword(resultSet.getString("password"));
				member.setMembername(resultSet.getString("membername"));
				member.setEmail(resultSet.getString("email"));	
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return member;
	}

	@Override
	public int checkByEmail(String email) {
		int count = 1;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(MEMBER_COUNT_BY_EMAIL_SQL);
			preparedStatement.setString(1, email);
			
			resultSet = preparedStatement.executeQuery();

			if(resultSet.next()) {
				count = resultSet.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

}
