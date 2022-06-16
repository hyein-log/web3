package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AcclistService;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/trans/trans.do")
public class TransListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TransListServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		AcclistService acclistService = new AcclistService();
		HttpSession session = request.getSession();
		String accNum = request.getParameter("accNum");
		request.setAttribute("accNum", accNum);
		RequestDispatcher rd; // ����(��û�� ���� ���� servlet�ε� ������ JSP�� �ϵ�����)
		rd = request.getRequestDispatcher("transList.jsp");
		rd.forward(request, response);

	}

}
