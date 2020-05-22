package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;
import spms.dto.MemberDto;

@SuppressWarnings("serial")
@WebServlet("/member/idcheck")
public class MemberIdCheckServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	

		RequestDispatcher dispatcher = 
				req.getRequestDispatcher("./idCheck.jsp");
		dispatcher.forward(req, res);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = null;
		
		Connection conn = null;
		
		String email = req.getParameter("email");
		
		memberDto = new MemberDto();
		memberDto.setEmail(email);
		
		ServletContext sc = this.getServletContext();
		
		conn = (Connection) sc.getAttribute("conn");
		
		MemberDao memberDao = new MemberDao();
		memberDao.setConnection(conn);
		
		int result = 0;
		
		try {
			result = memberDao.memberCheckId(memberDto);
			if(result ==0) {
				System.out.println("회원정보 조회 실패띠");
			}
			res.sendRedirect("./checkid");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, res);
		}
		
		
	}
	
	
}
