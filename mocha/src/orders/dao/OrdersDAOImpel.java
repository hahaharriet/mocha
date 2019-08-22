package orders.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.model.Member;
import orders.model.Orders;

public class OrdersDAOImpel extends BaseDAO implements OrdersDAO {

	public static final String ORDERS_INSERT ="insert into ORDERS values (SEQ_ORDERS.nextval,?,?,?,?,?,?,?,?,sysdate)";
	public static final String ORDERS_SELECTALL="SELECT * FROM ORDERS";
	public static final String ORDERS_SELECT_MEMBERNO_PRODUCTNO="SELECT * FROM ORDERS where MEMBERNO=? and productno=?";
	public static final String ORDERS_SELECT_MEMBERNO="select ORDERID,MEMBERNO,PRODUCTNO,PRODUCTNAME,orders_membername,orders_MEMBERID,orders_memberemail,address,ORDERSPRICE,ORDERDATE FROM ORDERS where MEMBERNO=? order by orderid desc";
	public static final String ORDERS_SELECT_ORDERDATE="select ORDERID,MEMBERNO,PRODUCTNO,PRODUCTNAME,orders_membername,orders_MEMBERID,orders_memberemail,address,ORDERSPRICE,ORDERDATE from orders where ORDERDATE BETWEEN ? and ? and memberno=?";
	public static final String MEMBER_SELECT_MEMBERNO="SELECT MEMBERNO,MEMBERID,EMAIL "
													+ "FROM MEMBER "
													+ "WHERE MEMBERNO=?";
	public static final String ORDERS_DELETE="delete from ORDERS where ORDERID=?";
	
	@Override
	public boolean insert(Orders orders) {
		boolean result=false;
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_INSERT);
			preparedStatement.setInt(1,orders.getMemberno());
			preparedStatement.setInt(2,orders.getProductno());
			preparedStatement.setString(3,orders.getProductname());
			preparedStatement.setString(4, orders.getOrdersmembername());
			preparedStatement.setString(5, orders.getOrdersmemberid());
			preparedStatement.setString(6, orders.getOrdersmemberemail());
			preparedStatement.setString(7, orders.getAddress());
			preparedStatement.setInt(8, orders.getOrdersprice());
			
			
			int rowCount=preparedStatement.executeUpdate();
			if(rowCount>0) {
				result=true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	
	}

	@Override
	public List<Orders> SelectAll(int memberno) {
		 List<Orders> ordersList=new ArrayList<Orders>();
		 Orders orders =null;
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_SELECT_MEMBERNO);
			preparedStatement.setInt(1,memberno);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				orders = new Orders();
				orders.setOrderid(resultSet.getInt("orderid"));
				orders.setMemberno(resultSet.getInt("memberno"));
				orders.setProductno(resultSet.getInt("productno"));
				orders.setProductname(resultSet.getString("productname"));
				orders.setOrdersmembername(resultSet.getString("orders_membername"));
				orders.setOrdersmemberid(resultSet.getString("orders_memberid"));
				orders.setOrdersmemberemail(resultSet.getString("orders_memberemail"));
				orders.setAddress(resultSet.getString("address"));
				orders.setOrdersprice(resultSet.getInt("ordersprice"));
				orders.setOrderdate(resultSet.getString("orderdate"));
				ordersList.add(orders);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ordersList;
	}
	
	public List<Orders> SelectAll(int memberno,int productno) {
		 List<Orders> ordersList=new ArrayList<Orders>();
		 Orders orders =null;
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_SELECT_MEMBERNO_PRODUCTNO);
			preparedStatement.setInt(1,memberno);
			preparedStatement.setInt(2,productno);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				orders = new Orders();
				orders.setOrderid(resultSet.getInt("orderid"));
				orders.setMemberno(resultSet.getInt("memberno"));
				orders.setProductno(resultSet.getInt("productno"));
				orders.setProductname(resultSet.getString("productname"));
				orders.setOrdersmembername(resultSet.getString("orders_membername"));
				orders.setOrdersmemberid(resultSet.getString("orders_memberid"));
				orders.setOrdersmemberemail(resultSet.getString("orders_memberemail"));
				orders.setAddress(resultSet.getString("address"));
				orders.setOrdersprice(resultSet.getInt("ordersprice"));
				orders.setOrderdate(resultSet.getString("orderdate"));
				ordersList.add(orders);
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ordersList;
	}

	@Override
	public List<Orders> SelectAll() {
		List<Orders> ordersList =new ArrayList<Orders>();
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_SELECTALL);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Orders orders = new Orders();
				orders.setOrderid(resultSet.getInt("orderid"));
				orders.setMemberno(resultSet.getInt("memberno"));
				orders.setProductno(resultSet.getInt("productno"));
				orders.setProductname(resultSet.getString("productname"));
				orders.setOrdersmembername(resultSet.getString("orders_membername"));
				orders.setOrdersmemberid(resultSet.getString("orders_memberid"));
				orders.setOrdersmemberemail(resultSet.getString("orders_memberemail"));
				orders.setAddress(resultSet.getString("address"));
				orders.setOrdersprice(resultSet.getInt("ordersprice"));
				orders.setOrderdate(resultSet.getString("orderdate"));
				
				ordersList.add(orders);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ordersList;
	}

	@Override
	public List<Orders> SelectOrderDate(String fromdate, String todate,int membrno) {
		List<Orders> ordersList=new ArrayList<Orders>();
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_SELECT_ORDERDATE);
			preparedStatement.setString(1, fromdate);
			preparedStatement.setString(2,todate);
			preparedStatement.setInt(3, membrno);
			
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Orders orders=new Orders();
				orders.setOrderid(resultSet.getInt("orderid"));
				orders.setMemberno(resultSet.getInt("memberno"));
				orders.setProductno(resultSet.getInt("productno"));
				orders.setProductname(resultSet.getString("productname"));
				orders.setOrdersmembername(resultSet.getString("orders_membername"));
				orders.setOrdersmemberid(resultSet.getString("orders_memberid"));
				orders.setOrdersmemberemail(resultSet.getString("orders_memberemail"));
				orders.setAddress(resultSet.getString("address"));
				orders.setOrdersprice(resultSet.getInt("ordersprice"));
				orders.setOrderdate(resultSet.getString("orderdate"));
				
				ordersList.add(orders);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return ordersList;
	}

	@Override
	public List<Member> SelectMemberNo(int memberno) {
		List<Member> memberList=new ArrayList<Member>();
		
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(MEMBER_SELECT_MEMBERNO);
			preparedStatement.setInt(1, memberno);
			
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Member member=new Member();
				member.setMemberno(resultSet.getInt("MEMBERNO"));
				member.setMemberid(resultSet.getString("memberid"));
				member.setEmail(resultSet.getString("email"));
				
				memberList.add(member);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(resultSet, preparedStatement, connection);
		}
		return memberList;
	}

	@Override
	public boolean delete(int orderId) {
		boolean result=false;
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		
		try {
			connection=getConnection();
			preparedStatement=connection.prepareStatement(ORDERS_DELETE);
			preparedStatement.setInt(1, orderId);
			
			int rowCount=preparedStatement.executeUpdate();
			
			if(rowCount>0) {
				result=true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			closeDBObjects(null, preparedStatement, connection);
		}
		return result;
	}
	
	
	
}
