package orders.dao;

import java.util.List;

import member.model.Member;
import orders.model.Orders;

public interface OrdersDAO {
	boolean insert(Orders orders);
	List<Orders> SelectAll(int memberno);
	List<Orders> SelectAll(int memberno,int productno);
	List<Orders> SelectAll();
	List<Orders> SelectOrderDate(String fromdate, String todate,int membrno);
	List<Member> SelectMemberNo(int memberno);
	
	boolean delete(int orderId);
}
