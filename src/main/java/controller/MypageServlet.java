package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class MypageServlet
 */
@WebServlet("/mypage/mypage.do")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf8");
		   response.setCharacterEncoding("utf8");
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf8");
		   response.setCharacterEncoding("utf8");
		   HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		   String memberid = request.getParameter("memberid");
		   System.out.println("memberid : "+memberid);
		   MemberVO memberinfo = new MemberVO();
		   MemberService service = new MemberService();
		   if(memberid==null)  return ;
	        int i_memberid =Integer.parseInt(memberid);
	        memberinfo = service.selectMemberByMemberId(i_memberid);
	        System.out.println("member == "+memberinfo);
	        session.setAttribute("memberinfo", memberinfo);
		   RequestDispatcher rd;
		   rd = request.getRequestDispatcher("mypage.jsp");
			rd.forward(request, response);
	}

}
