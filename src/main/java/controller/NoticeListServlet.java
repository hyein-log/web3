package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeVO;
import model.NoticeService;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/notice/NoticeList.do")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService service = new NoticeService();
		
		List<NoticeVO> noti = service.selectAll();
		request.setAttribute("notiList", noti);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("noticeLIst.jsp");
		rd.forward(request, response);
	}
}
