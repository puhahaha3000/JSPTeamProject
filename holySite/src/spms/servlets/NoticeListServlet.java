package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;
import spms.dao.NoticeDao;
import spms.dto.MemberDto;
import spms.dto.NoticeDto;

@WebServlet(value="/notice/list")
public class NoticeListServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			NoticeDao noticeDao = new NoticeDao();
			noticeDao.setConnection(conn);
			
			ArrayList<NoticeDto> noticeList = null;
			
			noticeList = (ArrayList<NoticeDto>)noticeDao.selectList();
			
			req.setAttribute("noticeList", noticeList);

//			res.setContentType("text/html");
//			res.setCharacterEncoding("UTF-8");
			
			//jsp로 출력을 위임한다
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("./NoticeView.jsp");
			
			dispatcher.include(req, res);
			
		} catch (Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher dispatcher = 
					req.getRequestDispatcher("/Error.jsp");
			dispatcher.forward(req, res);
			
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}
	
}
