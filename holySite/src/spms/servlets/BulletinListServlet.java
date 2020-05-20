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

import spms.dao.BulletinDao;
import spms.dao.MemberDao;
import spms.dto.BulletinDto;
import spms.dto.MemberDto;

@WebServlet(value="/bulletin/list")	
public class BulletinListServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = (Connection) sc.getAttribute("conn");
			
			BulletinDao bulletinDao = new BulletinDao();
			bulletinDao.setConnection(conn);
			
			ArrayList<BulletinDto> bulletinList = new ArrayList<BulletinDto>();
			
			bulletinList = bulletinDao.selectList();
			// request에 회원 목록 데이터 보관한다
			request.setAttribute("bulletinList", bulletinList);

			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			//jsp로 출력을 위임한다
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("./BulletinListView.jsp");
			
			dispatcher.include(request, response);
		} catch (Exception e) {
			request.setAttribute("error", e);
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher("/Error.jsp");
			dispatcher.forward(request, response);
			
		}
	}
}
