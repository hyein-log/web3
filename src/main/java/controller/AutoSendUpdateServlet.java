package controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AutoSendVO;
import model.AutoSendService;

/**
 * Servlet implementation class AutoSendUpdateServlet
 */
@WebServlet("/autosend/AutoSendUpdate.do")
public class AutoSendUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int autoid = Integer.parseInt(request.getParameter("autoid"));
		int accid = Integer.parseInt(request.getParameter("accid"));
		
		String autoCate = request.getParameter("autoCate");
		String autoContent = request.getParameter("autoContent");
		int autoCost = Integer.parseInt(request.getParameter("autoCost"));
		int autoDate= Integer.parseInt(request.getParameter("autoDate"));
		String autoEnd = request.getParameter("autoEnd");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date endto;
		try {
			endto = fm.parse(autoEnd);
			long timein = endto.getTime();
			java.sql.Date date1 = new java.sql.Date(timein);
			AutoSendVO vo = new AutoSendVO(autoid,  autoContent, autoCost, date1 ,autoDate);
			
			AutoSendService service = new AutoSendService();
			int result = service.updateAuto(vo);
			
			response.sendRedirect("AutoSendList.do?accid=" + accid);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}

}
