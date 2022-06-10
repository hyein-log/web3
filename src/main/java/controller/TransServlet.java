package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.AcclistService;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/trans/trans.do")
public class TransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AcclistService acclistService = new AcclistService();
		HttpSession session = request.getSession();
		int id =Integer.parseInt(request.getParameter("memberid"));
		if(id==0) {
			
		}
		session.setAttribute("acclist", acclistService.SELECT_ACCLIST_ALL(id));
		//request.setAttribute("acclist", acclistService.SELECT_ACCLIST_ALL());
		
		RequestDispatcher rd; //����(��û�� ���� ���� servlet�ε� ������ JSP�� �ϵ�����)
		rd = request.getRequestDispatcher("new.jsp");
		rd.forward(request, response);
	}

}
