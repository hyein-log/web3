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
            System.out.println("������ȣ ��ġ���� ����");
            request.setAttribute("msg", "������ȣ�� ��ġ���� �ʽ��ϴ�");
            request.setAttribute("loc", "/member/searchPw");
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
            return;
        }
        
        
	}
}
