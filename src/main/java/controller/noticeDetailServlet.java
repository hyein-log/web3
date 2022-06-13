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
 * Servlet implementation class noticeDetailServlet
 */
@WebServlet("/notice/noticeDetail.do")
public class noticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeid = request.getParameter("noticeid");
        int i_noticeid = 0;
        System.out.println("noticeid=" + noticeid);

        if(noticeid != null){
            i_noticeid = Integer.parseInt(noticeid);
        }

        NoticeService noticeService = new NoticeService();
        NoticeVO notice = noticeService.selectById(i_noticeid);
        request.setAttribute("notice",notice);

        RequestDispatcher rd;
        rd = request.getRequestDispatcher("noticeDetail.jsp");
        rd.forward(request,response);
	}

}
