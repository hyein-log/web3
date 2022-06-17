package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

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
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mypage/memberInfoUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		int memberid = Integer.parseInt(request.getParameter("memberid"));
		System.out.println(memberid);
		String password = (String)request.getParameter("password");
		System.out.println(password);
		String email = (String)request.getParameter("email");
		System.out.println(email);
		String phonenum = (String)request.getParameter("phonenum");
		String address = (String)request.getParameter("address");
		char dropout_ox = (char)request.getParameter("dropout_ox").charAt(0);
		String id = (String)request.getParameter("id");
		char subscri_ox = (char)request.getParameter("subscri_ox").charAt(0);
		String name = (String)request.getParameter("name");
		System.out.println(phonenum);
		MemberVO member = new MemberVO(memberid,name, id, password, email, address, phonenum,subscri_ox, dropout_ox );
		MemberService service = new MemberService();
		int result = service.update_member_info(member);
		if(result >0) {
			writer.println("<script>alert('회원 정보가 변경되었습니다.');</script>");
			response.setHeader("refresh", "0;url=memberInfo.jsp");
		}else {
			writer.println("<script>alert('회원 정보가 변경되지 않았습니다.');</script>");
		}
		session.setAttribute("member", member);
	}

}
