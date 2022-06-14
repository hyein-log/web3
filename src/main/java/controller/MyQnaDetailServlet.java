package controller;

import java.io.IOException;

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
 * Servlet implementation class MyQnaDetailServlet
 */
@WebServlet("/myqna/myqnaDetail.do")
public class MyQnaDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int memId = member.getMember_id();
		
		int qaid = Integer.parseInt(request.getParameter("qaid"));
		MyQnaService service = new MyQnaService();
		
		MyQnaVO vo = service.selectQaId(qaid);
		System.out.println(vo);
		request.setAttribute("myqna", vo);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("myqnaDetail.jsp");
		rd.forward(request, response);
	}

	
}
