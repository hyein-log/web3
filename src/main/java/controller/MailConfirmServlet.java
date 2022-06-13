package controller;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class MailConfirmServlet
 */
@WebServlet("/login/MailConfirm.do")
public class MailConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		String AuthenticationKey = (String)session.getAttribute("AuthenticationKey");
		PrintWriter writer = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		System.out.println("id :" + id);
		String pass = (String)session.getAttribute("pass");
		System.out.println(pass);
		String email = (String)session.getAttribute("email");
		System.out.println(email);
        String AuthenticationUser = request.getParameter("AuthenticationUser");
        
        if(!AuthenticationKey.equals(AuthenticationUser))
        {
        	writer.println("<script>alert('인증번호 일치하지 않음.'); location.href='"+"login.jsp"+"';</script>"); 
        	writer.close();
            //request.getRequestDispatcher("login.jsp").forward(request, response);
        	
            return;
        }
        if(id!=null) {
        	
	        writer.println("<h1>당신의 아이디는 : "+id+" 입니다.</h1>");
	        writer.println("<button><a href=login.jsp>로그인 하러 가기</a></button>");
	        session.removeAttribute("AuthenticationKey");
	        session.removeAttribute("id");
	        writer.close();
        }
        if(pass!=null) {
        	request.getRequestDispatcher("pwChange.jsp").forward(request, response);
        	
        }
        
        
	}
}