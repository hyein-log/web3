package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class InsertMemberServlet
 */
@WebServlet("/login/InsertMember.do")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String address = request.getParameter("address") + " " + request.getParameter("addressDetail");
		System.out.println("address : " + address);
		String phone = request.getParameter("phone");
		PrintWriter writer = response.getWriter();
		
		MemberVO member = new MemberVO(name,id,password,email,address,phone);
		int result = new MemberService().insertMember(member);
		
		if(result > 0) {
			writer.println("<script>alert('회원가입 성공.'); location.href='"+"login.jsp"+"';</script>"); 
        	writer.close();
		}else {
			writer.println("<script>alert('회원가입 실패.'); location.href='"+"login.jsp"+"';</script>"); 
        	writer.close();
		}
	}

}
