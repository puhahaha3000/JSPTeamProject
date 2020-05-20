package spms.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.BulletinDao;
import spms.dao.MemberDao;
import spms.dto.BulletinDto;
import spms.dto.MemberDto;

@WebServlet(value="/bulletin/add")
public class BulletinAddServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 337 1번 문제 입력화면 생성 코드 제거	
		res.sendRedirect("../bulletin/BulletinForm.jsp");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		String title = req.getParameter("title");
		String text = req.getParameter("text");
		MemberDao memberDao = new MemberDao();
		int writerNo = Integer.parseInt(req.getParameter("writer"));
		MemberDto writer = null;
		
		try {
			writer = memberDao.memberSelectOne(writerNo);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
//		MemberDto memberDto = new MemberDto();
		BulletinDto bulletinDto = new BulletinDto();
		
		bulletinDto.setTitle(title);
		bulletinDto.setText(text);
		bulletinDto.setWriter(writer);
		
		ServletContext sc = this.getServletContext();

		conn = (Connection) sc.getAttribute("conn");
		
//		MemberDao memberDao = new MemberDao();
//		
//		memberDao.setConnection(conn);
		
		BulletinDao bulletinDao = new BulletinDao();
		bulletinDao.setConnection(conn);
		
		// 0이면 못 넣음 0이외에는 성공
		int result;
		try {
			result = bulletinDao.bulletinInsert(bulletinDto);
			
			if(result == 0){
				System.out.println("게시판 추가 실패");
			}
			
			res.sendRedirect("./list");
		} catch (Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/Error.jsp");
			dispatcher.forward(req, res);
		}
		
	}
}
