package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AcclistVO;
import dto.MemberVO;
import model.AcclistService;
import model.MemberService;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/trans/transIn.do")
public class TransListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransListDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("utf8");
		   response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		   String kind = request.getParameter("kind");
		  int id =Integer.parseInt(request.getParameter("member_id"));
		   System.out.println("kind:" + kind);
		   System.out.println("id:" + id);
		   AcclistService acclistService = new AcclistService();
		   List<AcclistVO> alist=  new ArrayList<>();
	        if(kind==null)  return ;
	        if(kind.equals("all")) {
	        	alist = acclistService.SELECT_ACCLIST_ALL(id);
	        	session.setAttribute("alist",alist );
	        }else if(kind.equals("입금")) {
	        	alist = acclistService.SQL_SELECT_KIND(id,kind);
	        	session.setAttribute("alist",alist );
	        	System.out.println(alist);
	        }
	        else if(kind.equals("출금")) {
	        	alist = acclistService.SQL_SELECT_KIND(id,kind);
	        	session.setAttribute("alist",alist );
	        }
	        
	       
			
	        RequestDispatcher rd;
	        
			rd = request.getRequestDispatcher("transDetail.jsp");
			rd.forward(request, response);
	}

}
