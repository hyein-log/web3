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
 * Servlet implementation class MyQnaUpdate
 */
@WebServlet("/myqna/myqnaUpdate.do")
public class MyQnaUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int memId = member.getMember_id();
		
		int qaid = Integer.parseInt( request.getParameter("qaid") );
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		
		MyQnaVO myqna = new MyQnaVO(qaid, memId, title, content, null, null, null);
		MyQnaService service = new MyQnaService();
		int result = service.myUpdate(myqna);
		
		// 수정완료 후 목록이나 상세페이지로 가기 
		//response.sendRedirect("myqnaDetail.do?qaid=" + qaid);
		response.sendRedirect("myqnalist.do?qaid=" + qaid);
	}

	

}
