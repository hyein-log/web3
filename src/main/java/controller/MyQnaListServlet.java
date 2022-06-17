package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberVO;
import dto.MyQnaVO;
import model.MyQnaService;

/**
 * Servlet implementation class MyQnaDeleteServlet
 */
@WebServlet("/myqna/myqnalist.do")
public class MyQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int memId = member.getMember_id();
		RequestDispatcher rd;
		MyQnaService service = new MyQnaService();
		List<MyQnaVO> mlist = new ArrayList<MyQnaVO>();

		if(memId == 1) {
			mlist = service.selectAll();
			request.setAttribute("qnaDatas", mlist);
			rd = request.getRequestDispatcher("../admin/qnaList.jsp");
			rd.forward(request, response);
		}else {
			mlist = service.selectById(memId);
			request.setAttribute("myqnaDatas", mlist);
			rd = request.getRequestDispatcher("myqnaList.jsp");
			rd.forward(request, response);
		}
		
		
		
		
	}

	
}
