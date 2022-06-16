package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AutoSendVO;
import model.AutoSendService;

/**
 * Servlet implementation class AutoSendDetail
 */
@WebServlet("/autosend/AutoSendDetail.do")
public class AutoSendDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int autoid = Integer.parseInt(request.getParameter("autoid"));
		AutoSendService service = new AutoSendService();
		AutoSendVO vo = service.selectById(autoid);
		request.setAttribute("autoDetail", vo);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("autoDetail.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
