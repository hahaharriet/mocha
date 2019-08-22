package orders.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.Member;
import orders.dao.OrdersDAO;
import orders.dao.OrdersDAOImpel;
import orders.model.Orders;
import product.dao.ProductDAO;
import product.dao.ProductDAOImpel;
import product.model.Product;


@WebServlet(name="OrdersController",urlPatterns= {"/Orders_input.do","/orders_save","/Orders_list","/orders_search","/orders_delete"})
public class OrdersController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() ȣ���");
		process(req,resp);
		/*RequestDispatcher rd=req.getRequestDispatcher("/jsp/input/inputForm.jsp");
		rd.forward(req, resp);*/
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() ȣ��");
		req.setCharacterEncoding("utf-8");
		process(req,resp);
		
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		System.out.println(uri);
		
		if(action.equals("Orders_input.do"))  {
			int prodNum = Integer.parseInt(req.getParameter("productno"));
			ProductDAOImpel odo=new ProductDAOImpel();
			Product p = odo.selectByproductno(prodNum);
			
			req.setAttribute("product", p);
			
			RequestDispatcher rd=req.getRequestDispatcher("/Orders/orders_form.jsp");
			rd.forward(req, resp);
			
		}else if(action.equals("orders_save")) {
			int memberno=Integer.parseInt(req.getParameter("memberno"));
			int productno=Integer.parseInt(req.getParameter("productno"));
			OrdersDAO odo=new OrdersDAOImpel();
			Orders orders=new Orders();
			
			orders.setMemberno(Integer.parseInt(req.getParameter("memberno")));
			orders.setProductno(Integer.parseInt(req.getParameter("productno")));
			orders.setProductname(req.getParameter("productname"));
			orders.setOrdersmemberid(req.getParameter("ordersmemberid"));
			orders.setOrdersmembername(req.getParameter("ordersmembername"));
			orders.setOrdersmemberemail(req.getParameter("ordersmemberemail"));
			//orders.setAddress(req.getParameter("address"));
			String[] addressList= {req.getParameter("postnum"),req.getParameter("roadaddress"),req.getParameter("landrotaddress"),req.getParameter("detailsaddress"),req.getParameter("seealso")};
			
			String address=addressList[0]+addressList[1]+addressList[2]+addressList[3]+addressList[4];
			
			orders.setAddress(address);
			orders.setOrdersprice(Integer.parseInt(req.getParameter("ordersprice")));
			orders.setOrderdate(req.getParameter("orderdate"));
		
			boolean result=odo.insert(orders);
			System.out.println(result);
			
			List<Orders> orders1 = odo.SelectAll(memberno,productno);
			ProductDAO dao = new ProductDAOImpel();			
			List<Product> products = dao.selectAll();
			//List<Orders> orders1 = odo.SelectAll(memberno);
			
			req.setAttribute("orders", orders1);
		
			RequestDispatcher rd=req.getRequestDispatcher("/Orders_list");
			rd.forward(req, resp);
		}else if(action.equals("Orders_list")) {
			HttpSession session = req.getSession();
			Member m = (Member) session.getAttribute("member");
			
			System.out.println(m.toString());
			int memberno = m.getMemberno();
			
			
			OrdersDAO odo=new OrdersDAOImpel();
			List<Orders> orders1 = odo.SelectAll(memberno);
			
			//System.out.println("=="+orders.get(0).toString());
			
			req.setAttribute("orders", orders1);
			
	
			RequestDispatcher rd=req.getRequestDispatcher("/Orders/orders_list.jsp");
			rd.forward(req, resp);
		}else if(action.equals("orders_search")) {
			
			HttpSession session = req.getSession();
			Member m = (Member) session.getAttribute("member");
			System.out.println(m.toString());
			int memberno = m.getMemberno();
			
			String fromdate=req.getParameter("fromdate");
			String todate=req.getParameter("todate");
			
			OrdersDAO odo=new OrdersDAOImpel();
			List<Orders> ordersList=odo.SelectOrderDate(fromdate, todate,memberno);
			
			req.setAttribute("orders", ordersList);
			
			RequestDispatcher rd=req.getRequestDispatcher("/Orders/orders_list.jsp");
			rd.forward(req, resp);
			
		}else if(action.equals("orders_delete")) {
			
			int orderId=Integer.parseInt(req.getParameter("orderid"));
			OrdersDAO odo=new OrdersDAOImpel();
			boolean result=odo.delete(orderId);
			
			RequestDispatcher rd=req.getRequestDispatcher("/Orders_list");
			rd.forward(req, resp);
		}
	}
}