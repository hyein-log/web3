package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AccountVO;
import model.AccountDAO;

/**
 * Servlet implementation class AccountCreateServlet
 */
@WebServlet("/account/acc_create.do")
public class AccountCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int accountType = Integer.parseInt(request.getParameter("accountType"));
		String userid = request.getParameter("userid");
		int acc_pass = Integer.parseInt(request.getParameter("acc_pass"));
		
		//AccountVO vo = new AccountVO(0, 0, accountType, userid, accountType, acc_pass, null);
		AccountDAO dao = new AccountDAO();
	
	}

}
