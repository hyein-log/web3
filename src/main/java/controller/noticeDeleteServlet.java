package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.NoticeService;

/**
 * Servlet implementation class noticeDeleteServlet
 */
@WebServlet("/notice/noticeDelete.do")
public class noticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    int nno = Integer.parseInt(request.getParameter("nno"));
	    
	    NoticeService service = new NoticeService();
	    int result = service.delete(nno);
	    RequestDispatcher rd = request.getRequestDispatcher("noticelist.do");
	    rd.forward(request, response);
	}

}
