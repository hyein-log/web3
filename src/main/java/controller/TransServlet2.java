package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dto.AcclistVO;
import model.AcclistService;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/trans/transdetail.do")
public class TransServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		   String TRANS_ID = request.getParameter("TRANS_ID");
		   System.out.println("TRANS_ID:" + TRANS_ID);
		   AcclistService acclistService = new AcclistService();
	        if(TRANS_ID==null)  return ;
	        int i_TRANS_ID =Integer.parseInt(TRANS_ID);
	        
	        //DB�� ����id�� �����ϴ��� üũ�Ѵ�. ???empService->empDAO-->DB
	        AcclistVO vo = acclistService.SELECT_ACCLIST_BYID(i_TRANS_ID);
	        request.setAttribute("acc", vo);
	        RequestDispatcher rd; //����(��û�� ���� ���� servlet�ε� ������ JSP�� �ϵ�����)
			
			
			if(vo!=null) {
				String str= vo.getLocation();
				System.out.println(str);
				writer.println(str);
			}
			rd = request.getRequestDispatcher("tran.jsp");
			rd.forward(request, response);
	}

}
