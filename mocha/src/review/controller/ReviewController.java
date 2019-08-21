package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import page.PageManager;
import page.PageSQL;
import review.dao.ReviewDAO;
import review.dao.ReviewDAOImpl;
import review.model.Review;

@WebServlet(name = "ReviewController", urlPatterns = { "/review_ready", "/review_latters", "/Lee", "/review_list",
		"/review_input", "/review_save", "/latter_req_list",
		"/review_update", "/review_detail", "/review_delete","/latter_search","/menuList_back" })
public class ReviewController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uri = req.getRequestURI();
		// System.out.println(uri);

		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex + 1);

		req.setCharacterEncoding("utf-8"); //

		if (action.equals("review_ready")) {

			RequestDispatcher rd = req.getRequestDispatcher("/index");

			rd.forward(req, resp);

		} else if (action.equals("review_list")) {

			List<Review> reviewlist = new ArrayList<Review>();

			ReviewDAO dao = new ReviewDAOImpl();

			req.setCharacterEncoding("utf-8");
			reviewlist = dao.selectAll();
			req.setAttribute("reviews", reviewlist);

			/*
			 * HttpSession session= req.getSession(); //브라우저 닫을때가지 생존
			 * session.setAttribute("latters", reviewlist);
			 */

			RequestDispatcher rd = req.getRequestDispatcher("reviewlist.jsp");
			rd.forward(req, resp);

			/*
			 * } else if (action.equals("review_latters")) {
			 * 
			 * ReviewDAO dao = new ReviewDAOImpl(); int productno = 1; //
			 * Integer.parseInt(req.getParameter("productno"));
			 * 
			 * List<Review> lists = dao.selectByProductNo(productno);
			 * 
			 * req.setAttribute("latters", lists);
			 */

		} else if (action.equals("Lee")) {

			ReviewDAO dao = new ReviewDAOImpl();
			int productno = 1;
			//Integer.parseInt(req.getParameter("productno"));
			
			List<Review> lists = dao.selectByProductNo(productno);

			req.setAttribute("latters", lists);
			RequestDispatcher rd = req.getRequestDispatcher("latter_req_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("review_input")) {
			ReviewDAO dao = new ReviewDAOImpl();
			int productno = 1;
			List<Review> lists = dao.selectByProductNo(productno);
			req.setAttribute("latters", lists);

			RequestDispatcher rd = req.getRequestDispatcher("/latter/proudct_insert.jsp");
			rd.forward(req, resp);

		} else if (action.equals("review_save")) {
			Review review = new Review();
			review.setReview_memberid(req.getParameter("review_memberid"));
			review.setReviewsubject(req.getParameter("reviewsubject"));
			review.setContent(req.getParameter("content"));
			review.setRate(Integer.parseInt(req.getParameter("rate")));
			review.setProductno(Integer.parseInt(req.getParameter("productno")));
			ReviewDAO dao = new ReviewDAOImpl();
			boolean result = dao.insert(review);

			System.out.println(result);

			RequestDispatcher rd = req.getRequestDispatcher("latter_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("latter_req_list")) {

			int requestPage = Integer.parseInt(req.getParameter("reqPage"));

			PageManager pm = new PageManager(requestPage);

			ReviewDAO dao = new ReviewDAOImpl();

			List<Review> lists = dao.selectAllPage(pm.getPageRowResult().getRowStartNumber(),
					pm.getPageRowResult().getRowEndNumber());

			HttpSession session = req.getSession();
			session.setAttribute("latters", lists);

			req.setAttribute("pageGroupResult", pm.getpageGroupResult(PageSQL.REVIEW_SELETE_ALL_COUNT));

			RequestDispatcher rd = req.getRequestDispatcher("/latter/product_latter.jsp");
			rd.forward(req, resp);

		} else if (action.equals("review_detail")) {

			int reviewno = Integer.parseInt(req.getParameter("reviewno"));

			ReviewDAO dao = new ReviewDAOImpl();
			Review review = dao.selectByReviewNo(reviewno);

			dao.updateVisited(reviewno);

			HttpSession session = req.getSession(); // 브라우저 닫을때가지 생존
			session.setAttribute("review", review);

			RequestDispatcher rd = req.getRequestDispatcher("/latter/product_detail.jsp");
			rd.forward(req, resp);

		} else if (action.equals("review_update")) {

			Review review = new Review();
			ReviewDAO dao = new ReviewDAOImpl();

			review.setReviewno(Integer.parseInt(req.getParameter("reviewno")));
			review.setReviewsubject(req.getParameter("reviewsubject"));
			review.setContent(req.getParameter("content"));
			review.setRate(Integer.parseInt(req.getParameter("rate")));

			dao.update(review);

			RequestDispatcher rd = req.getRequestDispatcher("latter_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("review_delete")) {

			Review review = new Review();
			ReviewDAO dao = new ReviewDAOImpl();

			review.setReviewno(Integer.parseInt(req.getParameter("reviewno")));

			int reviewno = Integer.parseInt(req.getParameter("reviewno"));

			boolean result = dao.delete(reviewno);

			System.out.println(result);
			RequestDispatcher rd = req.getRequestDispatcher("latter_req_list?reqPage=1");
			rd.forward(req, resp);

		} else if (action.equals("menu back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/reviewlist.jsp");
		} else if (action.equals("menuList_back")) {
			RequestDispatcher rd = req.getRequestDispatcher("/latter_req_list?reqPage=1");
			rd.forward(req, resp);
		} else if (action.equals("latter_search")) {
			
			ReviewDAO dao = new ReviewDAOImpl();
			String reviewsubject = req.getParameter("reviewsubject");
			System.out.println(reviewsubject);
			List<Review> lists = dao.selectbyreviewsubject("%" + reviewsubject + "%");
			System.out.println(lists);
			req.setAttribute("latters", lists);

			RequestDispatcher rd = req.getRequestDispatcher("latter_req_list?reqPage=1");
			rd.forward(req, resp);
		}
	}
}