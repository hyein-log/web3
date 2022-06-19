package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AutoSendVO;
import dto.NoticeVO;
import model.AccountService;
import model.AutoSendService;
import model.NoticeService;

/**
 * Servlet implementation class AutoSendInsertServlet
 */
@WebServlet("/autosend/AutoSendInsert.do")
public class AutoSendInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int accid = Integer.parseInt(request.getParameter("accid"));
		String autoCate = request.getParameter("autoCate");
		String autoContent = request.getParameter("autoContent");
		if(!autoCate.equals("기타")){
			autoContent = autoCate;
		}
		int autoCost = Integer.parseInt(request.getParameter("autoCost"));
		int autoDate = Integer.parseInt(request.getParameter("autoDate"));
		int pw = Integer.parseInt(request.getParameter("pw"));
		String autoEnd = request.getParameter("autoEnd");
		if(autoEnd == null) autoEnd = "9998-12-31";
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date endto;
		
		PrintWriter writer = response.getWriter();

		if(autoContent.equals("")) {
			autoContent= request.getParameter("selcontent");
		}
		
		if(autoEnd==null) {
			autoEnd= "9999-12-31";
		} 
		
		AccountService accService = new AccountService();
		int pwReal = accService.selectPw(accid);
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date endto;
		
		try {
			endto = fm.parse(autoEnd);
			long timein = endto.getTime();
			java.sql.Date date1 = new java.sql.Date(timein);
			AutoSendVO vo = new AutoSendVO(accid,  autoContent, autoCost, date1 ,autoDate);
			
			if(pw==pwReal) {
				AutoSendService service = new AutoSendService();
				int result = service.insertAuto(vo);
				
				if(result >0) {
					writer.println("<script>alert('자동이체가 설정되었습니다.');location.href='"+"AutoSendList.do?accid="+accid+"'</script>"); 
					writer.close();
				} else {
					writer.println("<script>alert('자동이체 등록에 실패했습니다.\n관리자에게 문의해주세요.');location.href='"+"AutoSendList.do?accid="+accid+"'</script>"); 
					writer.close();
					
				}
			} else {
	        	writer.println("<script>alert('잘못된 비밀번호입니다.');location.href='"+"autoInsert.jsp?accid="+accid+"'</script>"); 
	        	writer.close();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

}
