package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import event.dao.EventDAO;
import event.dao.EventDAOImpl;
import event.model.Event;
import member.dao.MemberDAO;
import member.dao.MemberDAOImpl;
import member.model.Member;
import page.PageManager;
import page.PageSQL;
import product.dao.ProductDAO;
import product.dao.ProductDAOImpel;
import product.model.Product;
import review.dao.ReviewDAO;
import review.dao.ReviewDAOImpl;
import review.model.Review;

@WebServlet(name = "EventController", urlPatterns = { "/index", "/event_list_sp", "/event_input", 
		"/event_save","/event_req_list","/event_detail","/event_update","/event_delete","/event_search"})
public class EventController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		prosses(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		prosses(req, resp);
	}

	private void prosses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();// 주소값이 옴 주소값마다 처리할것을 코드할 것
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/"); // 마지막 슬러시의 인덱스를 달라는 것
		String action = uri.substring(lastIndex + 1);// 7에다가 8인거부터 끝까지 달라는거

		req.setCharacterEncoding("utf-8");

		if (action.equals("event_list_sp")) {
			MemberDAO dao1 = new MemberDAOImpl();
			Member member = dao1.selectById(req.getParameter("memberid"));
			EventDAO dao = new EventDAOImpl();
			List<Event> eventlist = dao.selectAll();
			for (Event e : eventlist) {
				System.out.println(e);
			}
			req.setAttribute("member", member);
			req.setAttribute("events", eventlist);
			
			RequestDispatcher rd = req.getRequestDispatcher("/event_sp/event_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("event_input")) {

			EventDAO dao = new EventDAOImpl();

			List<Event> eventlist = dao.selectAll();
			req.setAttribute("events", eventlist);

			RequestDispatcher rd = req.getRequestDispatcher("/event_sp/event_insert.jsp");
			rd.forward(req, resp);

		} else if (action.equals("event_save")) {
			Event event = new Event();
			event.setEventsubject(req.getParameter("eventsubject"));
			event.setStart_date(req.getParameter("start_date"));
			event.setEnd_date(req.getParameter("end_date"));
			event.setEventcontent(req.getParameter("eventcontent"));

			EventDAO dao = new EventDAOImpl();
			boolean result = dao.insert(event);

			System.out.println(result);

			RequestDispatcher rd = req.getRequestDispatcher("event_req_list?reqPage=1");
			rd.forward(req, resp);
			
		}else if (action.equals("event_req_list")) {

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			EventDAO dao = new EventDAOImpl();

			List<Event> eventlist = dao.selectAllPage(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());

			HttpSession session = req.getSession();
			session.setAttribute("events", eventlist);

			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.EVENT_SELETE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("/event_sp/event_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("event_detail")) {

			int eventno = Integer.parseInt(req.getParameter("eventno"));

			EventDAO dao = new EventDAOImpl();
			Event event = dao.selectByEventNo(eventno);

			dao.updateVisited(eventno);

			HttpSession session = req.getSession(); // 브라우저 닫을때가지 생존
			session.setAttribute("events", event);

			RequestDispatcher rd = req.getRequestDispatcher("/event_sp/event_detail.jsp");
			rd.forward(req, resp);

		}else if (action.equals("event_update")) {

			Event event = new Event();
			EventDAO dao = new EventDAOImpl();

			event.setEventno(Integer.parseInt(req.getParameter("eventno")));
			event.setEventsubject(req.getParameter("eventsubject"));
			event.setStart_date(req.getParameter("start_date"));
			event.setEnd_date(req.getParameter("end_date"));
			event.setEventcontent(req.getParameter("eventcontent"));
			
			dao.update(event);

			RequestDispatcher rd = req.getRequestDispatcher("event_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("event_delete")) {

			Event event = new Event();
			EventDAO dao = new EventDAOImpl();

			int eventno = Integer.parseInt(req.getParameter("eventno"));

			boolean result = dao.delete(eventno);

			System.out.println(result);
			RequestDispatcher rd = req.getRequestDispatcher("event_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("menu back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/event_sp/event_list.jsp");
		} else if (action.equals("menuList_back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/event_req_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("event_search")) {
			
			EventDAO dao = new EventDAOImpl();
			String eventsubject = req.getParameter("eventsubject");
			System.out.println(eventsubject);
			List<Event> eventlist = dao.selectbyEventSubject("%" + eventsubject + "%");
			System.out.println(eventlist);
			req.setAttribute("events", eventlist);

			RequestDispatcher rd = req.getRequestDispatcher("event_req_list?reqPage=1");
			rd.forward(req, resp);
		}
	}
}
