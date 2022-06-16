package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AutoSendVO;
import model.AutoSendService;

/**
 * Servlet implementation class AutoSendListServlet
 */
@WebServlet("/autosend/AutoSendList.do")
public class AutoSendListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int accid = Integer.parseInt(request.getParameter("accid"));
		
		AutoSendService service = new AutoSendService();
		List<AutoSendVO> list = service.selectByAuto(accid);
		request.setAttribute("autosend", list);
		request.setAttribute("accid", accid);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("autoList.jsp");
		rd.forward(request, response);
	}

}
