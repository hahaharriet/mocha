package member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
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
@WebServlet(name="MemberController",urlPatterns= {"/member_save","/input","/login","/test","/idcheck","/logout"})
public class MemberController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		prosses(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		prosses(req,resp);
	}

	private void prosses(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+ 1);
		
		req.setCharacterEncoding("utf-8");
		
		if(action.equals("input")) {
			MemberDAO dao = new MemberDAOImpl();
			List<Member> member= dao.selectAll();
			req.setAttribute("member", member);
			RequestDispatcher rd = req.getRequestDispatcher("/member/membersave.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("test")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/login.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("member_save")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setMemberid(req.getParameter("memberid"));
			member.setPassword(req.getParameter("password"));
			member.setMembername(req.getParameter("membername"));
			member.setEmail(req.getParameter("email"));
			
			boolean a = dao.insert(member);
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("login")) {
			MemberDAO dao = new MemberDAOImpl();
			String memberid = req.getParameter("memberid");
			String password = req.getParameter("password");
			
			Member member = dao.selectById(memberid);
			
			if(member!=null && member.getMemberid() != null && password.equals(member.getPassword())) {
				HttpSession session = req.getSession();
				session.setAttribute("member", member);
				
				RequestDispatcher disptcher = req.getRequestDispatcher("/index.jsp");
				disptcher.forward(req, resp);
			}else {
				req.setAttribute("message", "아이디,비밀번호가 틀렸습니다.");
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/login.jsp");
				disptcher.forward(req, resp);
				System.out.println("안됨");
			}
		}else if(action.equals("idcheck")) {
			
			MemberDAO dao = new MemberDAOImpl();
			int count = dao.checkById(req.getParameter("memberid"));
			
			if(count==0) {
				req.setAttribute("message", "사용 할수 있는 아이디입니다.");
			}else {
				req.setAttribute("message", "사용 할수 없는 아이디입니다.");				
			}

			RequestDispatcher rd = req.getRequestDispatcher("/member/message.jsp");
			rd.forward(req, resp);	
			
		}else if(action.equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("member");
			
			RequestDispatcher disptcher = req.getRequestDispatcher("/index.jsp");
			disptcher.forward(req, resp);
		}
	}
	
}
