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

/**
 * Servlet implementation class accountDeleteServlet
 */
@WebServlet("/account/accountDelete.do")
public class accountDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String accNum = request.getParameter("accNum");

		AccountService service = new AccountService();
		int result = service.deleteAcc(accNum);

		PrintWriter writer = response.getWriter();
		// ���� �� �˾� ���� �� ���� ����Ʈ�� �̵�
		if (result > 0) {
			response.setHeader("refresh", "0;url=AccountList.do");
			writer.println("<script>alert('�����Ǿ����ϴ�.');</script>");
		} else {
			writer.println("<script>alert('�ٽ� �õ����ּ���.');</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
