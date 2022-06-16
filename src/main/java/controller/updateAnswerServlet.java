package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MyQnaVO;
import model.MyQnaService;

/**
 * Servlet implementation class updateAnswerServlet
 */
@WebServlet("/myqna/UpdateAnswer.do")
public class updateAnswerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int qa_id = Integer.parseInt(request.getParameter("qa_id"));
		String qa_content = request.getParameter("qa_content");
		PrintWriter writer = response.getWriter();
		
		MyQnaVO myqna = new MyQnaVO(qa_id,qa_content);
		int result = new MyQnaService().updateAnswer(myqna);
		
		if(result > 0) {
			writer.println("<script>alert('문의답변 성공.'); location.href='"+"../admin/adminMain.jsp"+"';</script>"); 
        	writer.close();
		}else {
			writer.println("<script>alert('문의답변 실패.'); location.href='"+"../admin/adminMain.jsp"+"';</script>"); 
        	writer.close();
		}
	}

}
