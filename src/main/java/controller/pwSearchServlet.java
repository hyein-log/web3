package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class pwSearchServlet
 */
@WebServlet("/login/pwSearch.do")
public class pwSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		PrintWriter writer = response.getWriter();
		MemberService service = new MemberService();
		MemberVO member = service.selectByIdEmail(id, name, email);
		
		
		if(member==null) {
			writer.println(0);
		}
		else
			writer.println(member.getPassword());
	}

}
