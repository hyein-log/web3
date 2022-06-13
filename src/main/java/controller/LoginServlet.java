package controller;

import dto.MemberVO;
import model.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("userid");
		String pass = request.getParameter("userpass");
		PrintWriter writer = response.getWriter();

		MemberService service = new MemberService();
		MemberVO member = service.selectById(id, pass);
		HttpSession session = request.getSession();
		System.out.println(member);
//		
//		if (session.isNew()){
//			if(id != null){
//				session.setAttribute("id", id);
//				String url=response.encodeURL("login");
//			}else {
//				session.invalidate();
//			}
//		}else{
//			id = (String) session.getAttribute("user_id");
//			if (id != null && id.length() != 0) {
//			} else {
//				session.invalidate();
//			}
//		}
		
		session.setAttribute("member", member);
		//System.out.println(member.getId());
//		String path = (String) session.getAttribute("member");
		String path = null;
		System.out.println("path=" + path);
		
 		if (member == null) {
			writer.println("<script>alert('로그인 실패. id와 password를 확인해주세요.'); location.href='"+"login.do"+"';</script>"); 
        	writer.close();
		} else {
			//--------------------------------------
			if(path==null) {

				if(id.equals("admin")) {
					path = request.getContextPath();
					response.sendRedirect("../admin/adminMain.jsp");
				}else {
					path = request.getContextPath();
					response.sendRedirect("../finances-master/main.jsp");
				}

			}
			//--------------------------------------
			//response.sendRedirect(path);
		}
	}

}
