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
import model.AccountDAO;
import model.AccountService;
import model.MemberService;

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
		HttpSession session = request.getSession();
		//int member_id = Integer.parseInt(request.getParameter("member_id"));//회원id
		
		MemberVO member = (MemberVO)  session.getAttribute("member");
		int member_id =  member.getMember_id();
		
		int accountType = Integer.parseInt(request.getParameter("bank_account"));//통장타입(0,1,2)
		//String acc_number = request.getParameter("acc_number");//계좌번호 자동생성
		int acc_pass = Integer.parseInt(request.getParameter("acc_pass"));	//비밀번호

		AccountVO vo = new AccountVO(member_id, accountType, "", acc_pass);
		System.out.println("member:" + vo);
		String acc = new AccountService().accInsert(vo);
		
		
		// 계좌생성 된 리스트를 acc_result로 가라
		//AccountService service = new AccountService();
		//List<AccountVO> acc = service.selectById(member_id);
		//request.setAttribute("accLists", acc);
		request.setAttribute("acc", acc);
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("acc_result.jsp");
		rd.forward(request, response);
	}

}
