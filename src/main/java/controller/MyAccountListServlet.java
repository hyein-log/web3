package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AccountVO;
import dto.MemberVO;
import model.AccountService;

/**
 * Servlet implementation class AccountList
 */
@WebServlet("/trans/MyAccountList.do")
public class MyAccountListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		int memacc = member.getMember_id();
		AccountService service = new AccountService();
		
		List<AccountVO> acc = service.selectById(memacc);
		request.setAttribute("accLists", acc);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("my_AccList.jsp");
		rd.forward(request, response);
	}

}
