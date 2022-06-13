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

@WebServlet("/notice/noticelist.do")
public class noticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeService service = new NoticeService();
        List<NoticeVO> nlist = service.selectAll();

        request.setAttribute("noticeDatas",nlist);

        //���� (��û�� �������� Servlet�ε� ������ jsp�� �Ѵ�)
        RequestDispatcher rd;
        rd = request.getRequestDispatcher("noticeList.jsp");
        rd.forward(request,response);
	}

}
