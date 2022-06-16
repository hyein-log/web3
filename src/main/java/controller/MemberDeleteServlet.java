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

import model.AccountService;
import model.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mypage/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		// MemberVO member = (MemberVO) session.getAttribute("member");
		// int memId = member.getMember_id();

		int data_memberid = Integer.parseInt(request.getParameter("data_memberid"));
		System.out.println(data_memberid);
		session.setAttribute("memberid",data_memberid);
		AccountService service = new AccountService();
		int money = service.selectMemBal(data_memberid);
		PrintWriter writer = response.getWriter();
		if (money == 0) {
			MemberService memserService = new MemberService();
			int result = memserService.DELETE_MEMBER(data_memberid);
			if (result > 0) {
				writer.println("<script>alert('삭제되었습니다.');</script>");
				response.setHeader("refresh", "0;url=../finances-master/main.jsp");
			} else {
				writer.println("<script>alert('다시 시도해주세요.');</script>");
				response.setHeader("refresh", "0;url=../finances-master/main.jsp");
			}
		} else {
			writer.println("<script>alert('잔액이 남은 계좌는 해지할 수 없습니다!');</script>");
			response.setHeader("refresh", "0;url=../finances-master/main.jsp");
		}
		// 위임
		RequestDispatcher rd = request.getRequestDispatcher("../finances-master/main.jsp");
		rd.forward(request, response);
	}

}
