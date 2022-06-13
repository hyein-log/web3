package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeVO;
import model.NoticeService;

/**
 * Servlet implementation class NoticeDetailServlet
 */
@WebServlet("/notice/noticeDetail.do")
public class NoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("noticeid"));
		NoticeService service = new NoticeService();
		
		NoticeVO vo = service.selectById(num);
		request.setAttribute("notice", vo);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("noticeDetail.jsp");
		rd.forward(request, response);
	}

}
