package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Acc_listVO;
import dto.AcclistVO;
import dto.AccountVO;
import model.Acc_listService;
import model.AcclistDAO;
import model.AcclistService;
import model.AccountDAO;
import model.AccountService;

/**
 * Servlet implementation class AccSendInsertServlet
 */
@WebServlet("/account/InsertAcclist.do")
public class AccSendInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccSendInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter writer = response.getWriter();
		String accnum_you = request.getParameter("accnum_you");
		String accnum_me = request.getParameter("accnum_me");
		int amount = Integer.parseInt(request.getParameter("amount")); //보내는 돈
		AccountVO you_acc = new AccountVO();
		AccountVO me_acc = new AccountVO();
		AccountService service = new AccountService();
		you_acc = service.SELECT_ACCID_BY_ACCNUM(accnum_you);
		me_acc = service.SELECT_ACCID_BY_ACCNUM(accnum_me);
		int account_id_YOU = you_acc.getAccount_id();//상대방 계좌 ID
		int account_id_ME = me_acc.getAccount_id();//내 계좌 ID
		int past_acc_YOU = you_acc.getBalance(); //상대방 잔고
		int past_acc_ME = me_acc.getBalance(); //내 잔고
		Acc_listService acc_listService = new Acc_listService();
		int you_list = acc_listService.InsertAccList(account_id_YOU, past_acc_YOU, amount, "입금");
		int me_list = acc_listService.InsertAccList(account_id_ME, past_acc_ME, amount, "출금");
		
		int update_Ybal = service.UPDATE_BALANCE(past_acc_YOU+amount, account_id_YOU);
		int update_Mbal = service.UPDATE_BALANCE(past_acc_ME-amount, account_id_ME);
		if (you_list > 0 && me_list>0 &&update_Ybal>0 &&update_Mbal>0 ) {
			writer.println("<script>alert('이체되었습니다.');</script>");
			response.setHeader("refresh", "0;url=../finances-master/main.jsp");
			
		} else {
			writer.println("<script>alert('이체 실패했습니다.\n다시 시도해주세요');</script>");
		}
	}

}
