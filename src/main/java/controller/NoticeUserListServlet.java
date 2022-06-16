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
 * Servlet implementation class NoticeUserListServlet
 */
@WebServlet("/notice/NoticeUserList.do")
public class NoticeUserListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService service = new NoticeService();
		
		List<NoticeVO> noti = service.selectAll();
		request.setAttribute("notiList", noti);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("noticeUserList.jsp");
		rd.forward(request, response);
	}

}
