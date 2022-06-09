package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class PwChangeServlet
 */
@WebServlet("/login/pwChange.do")
public class PwChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		String pass = request.getParameter("password");
		
		MemberVO member = new MemberVO(pass,email);
		MemberService service = new MemberService();
		int result = service.passwordUpdate(member);
		session.removeAttribute("AuthenticationKey");
    	session.removeAttribute("pass");
    	session.removeAttribute("email");
		System.out.println("비밀번호 변경 여부 : " + result);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
    	writer.println("<script>alert('비밀번호 변경 완료.'); location.href='"+"login.jsp"+"';</script>"); 
    	writer.close();
		
	}
}
