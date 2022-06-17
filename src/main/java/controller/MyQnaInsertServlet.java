package controller;

import java.io.IOException;
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
 * Servlet implementation class MyQnaInsertServlet
 */
@WebServlet("/myqna/myqnaInsert.do")
public class MyQnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		int memId = member.getMember_id();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		MyQnaVO vo = new MyQnaVO(memId, title, content);
		System.out.println("memId" + vo);
		System.out.println(vo);
		int result = new MyQnaService().myInsert(vo);
		
		
		response.sendRedirect("myqnalist.do");
	}



}
