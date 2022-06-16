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
		 request.setCharacterEncoding("utf8");
		   response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		MemberVO member = makeMember(request);
		MemberService service = new MemberService();
		int result = service.update_member_info(member);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("result.jsp");
		rd.forward(request, response);
	}

	private MemberVO makeMember(HttpServletRequest request) {
		MemberVO vo = new MemberVO();
		int memberid = readInt(request, "memberid");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String dropout_ox = request.getParameter("dropout_ox");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phonenum = request.getParameter("phonenum");
		String subscri_ox = request.getParameter("subscri_ox");
		
		vo.setEmail(email);
		vo.setMember_id(memberid);
		vo.setAddress(address);
		vo.setDropout_ox(dropout_ox.charAt(0));
		vo.setId(id);
		vo.setName(name);
		vo.setPassword(password);
		vo.setPhoneNum(phonenum);
		vo.setSubscri_ox(subscri_ox.charAt(0));

		return vo;

	}

	private int readInt(HttpServletRequest request, String str) {
		String data = request.getParameter(str);
		return Integer.parseInt(data);
	}

}
