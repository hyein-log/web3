package controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AccountVO;
import model.AccountService;

/**
 * Servlet implementation class AccountList
 */
@WebServlet("/account/accSendList.do")
public class AccSendListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int memberid =Integer.parseInt(request.getParameter("memberid")) ;
		AccountService service = new AccountService();
		
		List<AccountVO> acc = service.SELECT_ACCMEM_BYID_TYPE0(memberid);
		request.setAttribute("accListType0", acc);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("accSendList.jsp");
		rd.forward(request, response);
	}

}
