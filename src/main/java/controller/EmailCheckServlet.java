package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberService;

/**
 * Servlet implementation class EmailCheckServlet
 */
@WebServlet("/login/emailCheck.do")
public class EmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		System.out.println("email¸¦ °¡Á®¿È : " + email);
		int result = new MemberService().emailCheck(email);
		session.setAttribute("result", result);
		request.getRequestDispatcher("emailCheckForm.jsp").forward(request, response);
	}

}
