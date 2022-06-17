package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/trans/trans.do")
public class TransListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate now = LocalDate.now();
		System.out.println("nownow : "+ now);
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		HttpSession session = request.getSession();
		String accNum = request.getParameter("accNum");
		request.setAttribute("accNum", accNum);
		session.setAttribute("now", now);
		RequestDispatcher rd; 
		rd = request.getRequestDispatcher("transList.jsp");
		rd.forward(request, response);

	}

}
