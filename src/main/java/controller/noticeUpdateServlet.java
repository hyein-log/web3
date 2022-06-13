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
 * Servlet implementation class noticeUpdateServlet
 */
@WebServlet("/notice/noticeUpdate.do")
public class noticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeid = request.getParameter("nno");
        int i_noticeid = 0;
        System.out.println("noticeid=" + noticeid);

        if(noticeid != null){
            i_noticeid = Integer.parseInt(noticeid);
        }

        NoticeService noticeService = new NoticeService();
        NoticeVO notice = noticeService.selectById(i_noticeid);
        request.setAttribute("notice",notice);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("noticeUpdate.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String noticeid = request.getParameter("nno");
        int i_noticeid = 0;
        if(noticeid != null){
            i_noticeid = Integer.parseInt(noticeid);
        }
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		NoticeVO notice = new NoticeVO(i_noticeid, title, content, null);
		NoticeService service = new NoticeService();
		int result = service.update(notice);
		System.out.println("update°á°ú : " + result);

		response.sendRedirect("noticelist.do");
	}

}
