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
import dto.PagingVO;
import model.AcclistDAO;
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
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String kind = request.getParameter("kind");
		String accNum = request.getParameter("accNum");
		AcclistDAO dao = AcclistDAO.getInstance();
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		PagingVO paging = new PagingVO();
		int count = dao.SQL_SELECT_ALL_COUNT(accNum);
		paging.setPage(page);
		paging.setTotalCount(count);
//		System.out.println("page:" +page);
//		System.out.println("count = "+count);
//		System.out.println("kind:" + kind);
//		System.out.println("accNum:" + accNum);
		AcclistService acclistService = new AcclistService();
		List<AcclistVO> alist = new ArrayList<AcclistVO>();
		if (kind == null)
			return;
		if (kind.equals("all")) {
			alist = dao.SQL_SELECT_ALL_PAGE(accNum, page);
			session.setAttribute("alist", alist);

		} else if (kind.equals("입금")) {
			alist = acclistService.SQL_SELECT_KIND(accNum, kind, page);
			session.setAttribute("alist", alist);
			System.out.println(alist);
		} else if (kind.equals("출금")) {
			alist = acclistService.SQL_SELECT_KIND(accNum, kind,page);
			session.setAttribute("alist", alist);
		}
		System.out.println(alist);
		RequestDispatcher rd;
		request.setAttribute("alist", alist);
		request.setAttribute("balance", alist.get(0).getBalance());
		request.setAttribute("paging", paging);
		request.setAttribute("kind", kind);
		request.setAttribute("accNum", accNum);
		rd = request.getRequestDispatcher("transDetail.jsp");
		rd.forward(request, response);
	}

}
