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
@WebServlet(name="MemberController",urlPatterns= 
{"/member_save","/mypage","/join","/memberlogin","/login","/update","/idcheck","/logout","/update_name","/update_email","/update_password","/member_delete","/delete","/find","/id_find","/password_find","/repassword","/emailcheck"})
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
		
		if(action.equals("join")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/membersave.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("login")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/login.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("update")) {
			MemberDAO dao = new MemberDAOImpl();
			HttpSession sesstion = req.getSession();
			Member member = (Member) sesstion.getAttribute("member");
			Member members = dao.selectByNo(member.getMemberno());
			req.setAttribute("members",members );
			
			RequestDispatcher rd = req.getRequestDispatcher("/member/mypageupdate.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("mypage")) {
			MemberDAO dao = new MemberDAOImpl();
			HttpSession sesstion = req.getSession();
			Member member = (Member) sesstion.getAttribute("member");
			Member members = dao.selectByNo(member.getMemberno());
			req.setAttribute("members",members );
			
			RequestDispatcher rd = req.getRequestDispatcher("/member/mypageimpomation.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("delete")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/mypagedelete.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("find")) {
			RequestDispatcher rd = req.getRequestDispatcher("/member/id-passwordfind.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("member_save")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setMemberid(req.getParameter("memberid").trim());
			member.setPassword(req.getParameter("password").trim());
			member.setMembername(req.getParameter("membername").trim());
			member.setEmail(req.getParameter("email").trim());
			
			dao.insert(member);
			RequestDispatcher rd = req.getRequestDispatcher("/member/joinfinish.jsp");
			rd.forward(req, resp);
		}
		else if(action.equals("memberlogin")) {
			MemberDAO dao = new MemberDAOImpl();
			String memberid = req.getParameter("memberid");
			String password = req.getParameter("password");
			
			Member member = dao.selectById(memberid);
			
			if(member!=null && member.getMemberid() != null && password.equals(member.getPassword())) {
				HttpSession sesstion = req.getSession();
				sesstion.setAttribute("member", member);
				
				RequestDispatcher disptcher = req.getRequestDispatcher("/index.jsp");
				disptcher.forward(req, resp);
			}else {
				req.setAttribute("message", "아이디,비밀번호가 틀렸습니다.");
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/login.jsp");
				disptcher.forward(req, resp);
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
			
		}
		else if(action.equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("member");
			
			RequestDispatcher disptcher = req.getRequestDispatcher("/index.jsp");
			disptcher.forward(req, resp);
		}
		else if(action.equals("update_name")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setMembername(req.getParameter("membername"));
			member.setMemberno(Integer.parseInt(req.getParameter("memberno")));
			dao.updateName(member);
			
			RequestDispatcher disptcher = req.getRequestDispatcher("mypage"); 
			disptcher.forward(req, resp);
		}else if(action.equals("update_email")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setEmail(req.getParameter("email"));
			member.setMemberno(Integer.parseInt(req.getParameter("memberno")));
			dao.updateEmail(member);
			
			RequestDispatcher disptcher = req.getRequestDispatcher("mypage"); 
			disptcher.forward(req, resp);
		}else if(action.equals("update_password")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setPassword(req.getParameter("password"));
			member.setMemberno(Integer.parseInt(req.getParameter("memberno")));
			dao.updatePassword(member);
			
			RequestDispatcher disptcher = req.getRequestDispatcher("/member/mypageimpomation.jsp"); 
			disptcher.forward(req, resp);
		}else if (action.equals("member_delete")) {
			MemberDAO dao = new MemberDAOImpl();
			
			int memberno = Integer.parseInt(req.getParameter("memberno"));
			String memberid = req.getParameter("memberid");
			String password = req.getParameter("password");
			String membername = req.getParameter("membername");
			String email = req.getParameter("email");
			
			Member member = dao.selectByNo(memberno);
			if(member !=null 
					&& memberid.equals(member.getMemberid())
					&& password.equals(member.getPassword()) 
					&& membername.equals(member.getMembername())
					&& email.equals(member.getEmail())) {
				
				dao.delete(memberno);
				
				HttpSession session = req.getSession();
				session.removeAttribute("member");
				RequestDispatcher disptcher = req.getRequestDispatcher("/index.jsp"); 
				disptcher.forward(req, resp);
			}else {
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/mypagedelete.jsp"); 
				disptcher.forward(req, resp);
			}
		
		}else if(action.equals("id_find")) {
			MemberDAO dao = new MemberDAOImpl();
			String membername = req.getParameter("membername");
			String email = req.getParameter("email");
			Member member = dao.selectByEmail(email);
			
			if(member!=null && member.getEmail() !=null && membername.equals(member.getMembername())) {
				req.setAttribute("member", member);
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/id-passwordfind.jsp"); 
				disptcher.forward(req, resp);
			}else {
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/id-passwordfind.jsp"); 
				disptcher.forward(req, resp);
			}
			
		}else if(action.equals("password_find")) {
			MemberDAO dao = new MemberDAOImpl();
			String memberid = req.getParameter("memberid2");
			String membername = req.getParameter("membername2");
			String email = req.getParameter("email2");
			
			Member member = dao.selectById(memberid);
			
			if(member !=null && member.getMemberid() !=null && membername.equals(member.getMembername()) && email.equals(member.getEmail())) {
				req.setAttribute("member", member);
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/repassword.jsp"); 
				disptcher.forward(req, resp);
			}else {
				RequestDispatcher disptcher = req.getRequestDispatcher("/member/id-passwordfind.jsp"); 
				disptcher.forward(req, resp);
			}
		}else if (action.equals("repassword")) {
			MemberDAO dao = new MemberDAOImpl();
			Member member = new Member();
			
			member.setPassword(req.getParameter("password"));
			member.setMemberno(Integer.parseInt(req.getParameter("memberno")));
			dao.updatePassword(member);
			
			RequestDispatcher disptcher = req.getRequestDispatcher("/member/repasswordfinish.jsp"); 
			disptcher.forward(req, resp);
		}
		else if (action.equals("emailcheck")) {
			MemberDAO dao = new MemberDAOImpl();
			int count = dao.checkByEmail(req.getParameter("email"));
			String contains = req.getParameter("email");
			
			if(count==0 && contains.contains("@")) {
				req.setAttribute("message1", "사용 할수 있는 이메일입니다.");
			}else {
				req.setAttribute("message1", "사용 할수 없는 이메일입니다.");				
			}

			RequestDispatcher rd = req.getRequestDispatcher("/member/message.jsp");
			rd.forward(req, resp);
		}
	}
}
