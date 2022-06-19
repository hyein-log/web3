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
		int amount = Integer.parseInt(request.getParameter("amount")); //������ ��
		AccountVO you_acc = new AccountVO();
		AccountVO me_acc = new AccountVO();
		AccountService service = new AccountService();
		you_acc = service.SELECT_ACCID_BY_ACCNUM(accnum_you);
		me_acc = service.SELECT_ACCID_BY_ACCNUM(accnum_me);
		int account_id_YOU = you_acc.getAccount_id();//���� ���� ID
		int account_id_ME = me_acc.getAccount_id();//�� ���� ID
		int past_acc_YOU = you_acc.getBalance(); //���� �ܰ�
		int past_acc_ME = me_acc.getBalance(); //�� �ܰ�
		Acc_listService acc_listService = new Acc_listService();
		int you_list = acc_listService.InsertAccList(account_id_YOU, past_acc_YOU, amount, "�Ա�");
		int me_list = acc_listService.InsertAccList(account_id_ME, past_acc_ME, amount, "���");
		
		int update_Ybal = service.UPDATE_BALANCE(past_acc_YOU+amount, account_id_YOU);
		int update_Mbal = service.UPDATE_BALANCE(past_acc_ME-amount, account_id_ME);
		if (you_list > 0 && me_list>0 &&update_Ybal>0 &&update_Mbal>0 ) {
			writer.println("<script>alert('��ü�Ǿ����ϴ�.');</script>");
			response.setHeader("refresh", "0;url=../finances-master/main.jsp");
			
		} else {
			writer.println("<script>alert('��ü �����߽��ϴ�.\n�ٽ� �õ����ּ���');</script>");
		}
	}

}
