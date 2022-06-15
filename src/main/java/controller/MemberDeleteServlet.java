package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberService;

/**
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/mypage/memberDelete.do")
public class MemberDeleteServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//MemberVO member = (MemberVO) session.getAttribute("member");
		//int memId = member.getMember_id();
		
		int data_memberid = Integer.parseInt(request.getParameter("data_memberid"));
	    
	    MemberService service = new MemberService();
	    int result = service.DELETE_MEMBER(data_memberid);
	
	    //ю╖юс
	    RequestDispatcher rd = request.getRequestDispatcher("../finances-master/main.jsp");
	    rd.forward(request, response);
	    }
	    
}
