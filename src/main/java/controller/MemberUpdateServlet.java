
package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberVO;
import model.MemberService;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mypage/memberInfoUpdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정하기
				MemberVO member = makeMember(request);
				MemberService service = new MemberService();
				int result = service.update_member_email(member);
				System.out.println(result>0?" 수정성공":"수정실패");
				RequestDispatcher rd = request.getRequestDispatcher("memberInfo.jsp");
				rd.forward(request, response);
			}
			private MemberVO makeMember(HttpServletRequest request) {
				MemberVO vo = new MemberVO();
				int memberid = readInt(request, "memberid");
				String email = request.getParameter("email");
				
				vo.setEmail(email);
				vo.setMember_id(memberid);
				
				return vo;
				
				
			}
			private int readInt(HttpServletRequest request, String str) {
				String data = request.getParameter(str);
				return Integer.parseInt(data);
			}
			
			
		

}
