package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class IdSearchServlet
 */
@WebServlet("/login/IdSearch.do")
public class IdSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		PrintWriter writer = response.getWriter();
		MemberService service = new MemberService();
		MemberVO member = service.selectByEmail(name, email);
		
		
		if(member==null) {
			writer.println(0);
		}
		else
			writer.println(member.getId());
		
	}

}
