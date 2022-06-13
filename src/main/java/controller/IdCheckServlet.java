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
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/login/idCheck.do")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		System.out.println("id¸¦ °¡Á®¿È : " + id);
		int result = new MemberService().idCheck(id);
		session.setAttribute("result", result);
		request.getRequestDispatcher("idCheckForm.jsp").forward(request, response);
	}

}
