package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AutoSendService;

/**
 * Servlet implementation class AutoSendDeleteServlet
 */
@WebServlet("/autosend/AutoSendDelete.do")
public class AutoSendDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		int autoid = Integer.parseInt(request.getParameter("autoid"));
		int accid = Integer.parseInt(request.getParameter("accid"));
		
		AutoSendService service = new AutoSendService();
		int result = service.deleteAuto(autoid);
		
		PrintWriter writer = response.getWriter();
		
		if(result > 0) {
			writer.println("<script>alert('해지되었습니다.');location.href='"+"AutoSendList.do?accid="+accid+"'</script>");
			
		} else {
			writer.println("<script>alert('해지에 실패했습니다. \n다시 시도해주세요');location.href='"+"AutoSendList.do?accid="+accid+"'</script>");
			
		}
	}


}
