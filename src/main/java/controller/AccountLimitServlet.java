package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AccountService;

/**
 * Servlet implementation class AccountLimitServlet
 */
@WebServlet("/account/accountLimit.do")
public class AccountLimitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String accNum = request.getParameter("accNum");

		AccountService service = new AccountService();
		int result = service.updateLimit(accNum);

		PrintWriter writer = response.getWriter();
		
		// �ѵ� ���� ���� �� �˾� ���� �� ���� ����Ʈ�� �̵�
		if (result > 0) {
			response.setHeader("refresh", "0;url=AccountList.do");
			writer.println("<script>alert('�ѵ��� ����Ǿ����ϴ�.');</script>");
		} else {
			writer.println("<script>alert('�ѵ� ���濡 �����߽��ϴ�.\n�ٽ� �õ����ּ���');</script>");
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
