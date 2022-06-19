package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.AutoSendVO;
import model.AccountService;
import model.AutoSendService;

/**
 * Servlet implementation class AutoSendUpdateServlet
 */
@WebServlet("/autosend/AutoSendUpdate.do")
public class AutoSendUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		int autoid = Integer.parseInt(request.getParameter("autoid"));
		int accid = Integer.parseInt(request.getParameter("accid"));
		String autoCate = request.getParameter("autoCate");
		String autoContent = request.getParameter("autoContent");
		int autoCost = Integer.parseInt(request.getParameter("autoCost"));
		int autoDate= Integer.parseInt(request.getParameter("autoDate"));
		String autoEnd = request.getParameter("autoEnd");
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		System.out.println(autoEnd +" 날짜다");
		
		PrintWriter writer = response.getWriter();

		if(autoEnd==null) {
			autoEnd="9999-12-31";
		}
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date endto;
		
		AccountService accService = new AccountService();
		int pwReal = accService.selectPw(accid);
		
		try {
			endto = fm.parse(autoEnd);
			long timein = endto.getTime();
			java.sql.Date date1 = new java.sql.Date(timein);
			AutoSendVO vo = new AutoSendVO(autoid,  autoContent, autoCost, date1 ,autoDate);
			
			if(pw==pwReal) {
				AutoSendService service = new AutoSendService();
				int result = service.updateAuto(vo);
				
				if(result > 0) {
					writer.println("<script>alert('내용이 변경되었습니다.');location.href='"+"AutoSendList.do?accid="+accid+"'</script>");
					writer.close();
				} else {
					writer.println("<script>alert('내용 변경에 실패했습니다.\n관리자에게 문의해주세요.');location.href='"+"AutoSendList.do?accid="+accid+"'</script>");
					writer.close();
				}
				
			} else {
				writer.println("<script>alert('잘못된 비밀번호입니다.');location.href='"+"AutoSendDetail.do?autoid="+autoid+"'</script>");
				writer.close();
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
	}

}
