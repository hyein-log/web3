package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
		HttpSession session = request.getSession();
		LocalDate date = LocalDate.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String end = date.format(fm);
		LocalDate end1 = date.minusYears(1);
		String start = end1.format(fm);
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String accNum = request.getParameter("accNum");
		session.setAttribute("accNum", accNum);
		session.setAttribute("now", date);
		session.setAttribute("end", end);
		session.setAttribute("start", start);
		RequestDispatcher rd; 
		rd = request.getRequestDispatcher("transList.jsp");
		rd.forward(request, response);

	}

}
