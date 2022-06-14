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

import dto.MemberAccountJoinVO;
import model.MemberAccountJoinService;
import model.MemberService;

/**
 * Servlet implementation class AccSendServlet
 */
@WebServlet("/account/accSend.do")
public class AccSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   //내 계좌정보임
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String accNum = request.getParameter("accNum");
		System.out.println("accNum:"+accNum);
		MemberAccountJoinService service = new MemberAccountJoinService();
		MemberAccountJoinVO memberaccount = service.SELECT_BY_ACC_NUMBER(accNum);
		HttpSession session = request.getSession();
		if(memberaccount==null) {
			writer.println(0);
		}
		else {
			//writer.println(member.getId());
			session.setAttribute("acc_pass", memberaccount.getAcc_pass());
			session.setAttribute("acc_balance", memberaccount.getBalance());
			session.setAttribute("name", memberaccount.getName());
			session.setAttribute("acc_num", memberaccount.getAcc_number());
		}
		System.out.println("memberaccount:"+memberaccount);
		RequestDispatcher rd = request.getRequestDispatcher("accSend.jsp");
		rd.forward(request, response);
	}

}
