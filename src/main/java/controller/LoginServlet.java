package controller;

import dto.MemberVO;
import model.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("userid");
		String pass = request.getParameter("userpass");

		MemberService service = new MemberService();
		MemberVO member = service.selectById(id, pass);
		HttpSession session = request.getSession();
		
		session.setAttribute("member", member);
		String path = (String) session.getAttribute("reqPath");
		System.out.println("path=" + path);
		
 		if (member == null) {
			response.sendRedirect("login.do");
		} else {
			//--------------------------------------
			if(path==null)
				path = request.getContextPath() + "/index.jsp";
			//--------------------------------------
			response.sendRedirect(path);
		}
	}

}
