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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		String memberid = request.getParameter("memberid");
		MemberVO memberinfo = new MemberVO();
		MemberService service = new MemberService();
		if (memberid == null)
			return;
		int i_memberid = Integer.parseInt(memberid);
		memberinfo = service.selectMemberByMemberId(i_memberid);
		session.setAttribute("member", memberinfo);
		session.setAttribute("email", memberinfo.getEmail());
		session.setAttribute("name", memberinfo.getName());
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("mypage.jsp");
		rd.forward(request, response);
	}

}
