package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.dao.MemberDAOImpl;
import member.model.Member;
import notice.dao.NoticeDAO;
import notice.dao.NoticeDAOImpl;
import notice.model.Notice;
import page.PageManager;
import page.PageSQL;

@WebServlet(name = "NoticeController", urlPatterns = { "/notice_list_sp", "/notice_input", "/notice_save",
		"/notice_req_list","/notice_detail","/notice_update","/notice_delete","/notice_search" })
public class NoticeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();// 주소값이 옴 주소값마다 처리할것을 코드할 것
		System.out.println(uri);
		int lastIndex = uri.lastIndexOf("/"); // 마지막 슬러시의 인덱스를 달라는 것
		String action = uri.substring(lastIndex + 1);// 7에다가 8인거부터 끝까지 달라는거

		req.setCharacterEncoding("utf-8");

		if (action.equals("notice_list_sp")) {
			MemberDAO dao1 = new MemberDAOImpl();
			Member member = dao1.selectById(req.getParameter("memberid"));
			NoticeDAO dao = new NoticeDAOImpl();
			List<Notice> noticelist = dao.selectAll();
			for (Notice n : noticelist) {
				System.out.println(n);
			}
			req.setAttribute("member", member);
			req.setAttribute("notices", noticelist);

			RequestDispatcher rd = req.getRequestDispatcher("/notice_sp/notice_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_input")) {

			NoticeDAO dao = new NoticeDAOImpl();

			List<Notice> noticelist = dao.selectAll();
			req.setAttribute("notices", noticelist);

			RequestDispatcher rd = req.getRequestDispatcher("/notice_sp/notice_insert.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_save")) {
			Notice notice = new Notice();
			notice.setNoticesubject(req.getParameter("noticesubject"));
			notice.setNotice_date(req.getParameter("notice_date"));
			notice.setNotice_memberid(req.getParameter("notice_memberid"));
			notice.setNoticecontent(req.getParameter("noticecontent"));

			NoticeDAO dao = new NoticeDAOImpl();
			boolean result = dao.insert(notice);

			System.out.println(result);

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("notice_req_list")) {

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			NoticeDAO dao = new NoticeDAOImpl();

			List<Notice> noticelist = dao.selectAllPage(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());

			HttpSession session = req.getSession();
			session.setAttribute("notices", noticelist);

			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.NOTICE_SELETE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("/notice_sp/notice_list.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_detail")) {

			int noticeno = Integer.parseInt(req.getParameter("noticeno"));
			
			
			NoticeDAO dao = new NoticeDAOImpl();
			Notice notice = dao.selectByNoticeNo(noticeno);

			dao.updateVisited(noticeno);

			HttpSession session = req.getSession(); // 브라우저 닫을때가지 생존
			session.setAttribute("notices", notice);

			RequestDispatcher rd = req.getRequestDispatcher("/notice_sp/notice_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("notice_update")) {

			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();

			notice.setNoticeno(Integer.parseInt(req.getParameter("noticeno")));
			notice.setNoticesubject(req.getParameter("noticesubject"));
			notice.setNotice_date(req.getParameter("notice_date"));
			notice.setNoticecontent(req.getParameter("noticecontent"));

			dao.update(notice);

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("notice_delete")) {

			Notice notice = new Notice();
			NoticeDAO dao = new NoticeDAOImpl();

			int noticeno = Integer.parseInt(req.getParameter("noticeno"));

			boolean result = dao.delete(noticeno);

			System.out.println(result);
			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("menu back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/notice_sp/notice_list.jsp");
		} else if (action.equals("menuList_back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/notice_req_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("notice_search")) {

			NoticeDAO dao = new NoticeDAOImpl();
			String noticesubject = req.getParameter("noticesubject");
			System.out.println(noticesubject);
			List<Notice> noticelist = dao.selectbyNoticeSubject("%" + noticesubject + "%");
			System.out.println(noticelist);
			req.setAttribute("notices", noticelist);

			RequestDispatcher rd = req.getRequestDispatcher("notice_req_list?reqPage=1");
			rd.forward(req, resp);

		}
	}
}