package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MailConfirmServlet
 */
@WebServlet("/login/MailConfirm.do")
public class MailConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String AuthenticationKey = (String)request.getSession().getAttribute("AuthenticationKey");
		
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        
        System.out.println(AuthenticationKey + " : " + AuthenticationUser);
        if(!AuthenticationKey.equals(AuthenticationUser))
        {
            System.out.println("인증번호 일치하지 않음");
            request.setAttribute("msg", "인증번호가 일치하지 않습니다");
            request.setAttribute("loc", "/member/searchPw");
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
            return;
        }
        
        
	}
}
