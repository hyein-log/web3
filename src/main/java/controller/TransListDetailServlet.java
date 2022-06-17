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

import dto.Acc_listVO;
import dto.AcclistVO;
import dto.MemberVO;
import dto.PagingVO;
import model.Acc_listService;
import model.AcclistDAO;
import model.AcclistService;
import model.AccountService;
import model.MemberService;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/trans/transIn.do")
public class TransListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public TransListDetailServlet() {
		super();
	}
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		String kind = request.getParameter("kind");
		session.setAttribute("kind", kind);
		String accNum = request.getParameter("accNum");
		session.setAttribute("accNum", accNum);
		String searchStartDate = (String)request.getParameter("searchStartDate");
		String searchEndDate = (String)request.getParameter("searchEndDate");
		
		
		String sel = request.getParameter("sel");
		AcclistDAO dao = AcclistDAO.getInstance();
		int page = 1;
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		PagingVO paging = new PagingVO();
		int count =0;
		if(kind.equals("all")) {
		count = dao.SQL_SELECT_TERM_COUNT(accNum,searchStartDate,searchEndDate  );
		}else if(kind.equals("입금")) {
			count = dao.SQL_SELECT_ALL_COUNT_IN(accNum,searchStartDate,searchEndDate );
		}else {
			count= dao.SQL_SELECT_ALL_COUNT_OUT(accNum, searchStartDate, searchEndDate);
		}
		paging.setPage(page);
		paging.setTotalCount(count);
		AcclistService acclistService = new AcclistService();
		List<AcclistVO> alist = new ArrayList<AcclistVO>();
	
		if(sel.equals("1")) {
		if (kind.equals("all")) {
			alist = acclistService.SQL_SELECT_TERM(accNum,searchStartDate, searchEndDate, page);
			session.setAttribute("alist", alist);
		} else if (kind.equals("입금")) {
			alist = acclistService.SQL_SELECT_KIND(accNum, kind, page);
			session.setAttribute("alist", alist);
			System.out.println(alist);
		} else if (kind.equals("출금")) {
			alist = acclistService.SQL_SELECT_KIND(accNum, kind,page);
			session.setAttribute("alist", alist);
		}
		}else {
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
		}
		RequestDispatcher rd;
		request.setAttribute("alist", alist);
		request.setAttribute("balance", alist.get(0).getBalance());
		request.setAttribute("paging", paging);
		request.setAttribute("kind", kind);
		request.setAttribute("sel", sel);
		request.setAttribute("accNum", accNum);
		request.setAttribute("searchStartDate", searchStartDate);
		request.setAttribute("searchEndDate", searchEndDate);
		rd = request.getRequestDispatcher("transDetail.jsp");
		rd.forward(request, response);
	}

}
