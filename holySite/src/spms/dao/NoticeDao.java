package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import spms.dto.BulletinDto;
import spms.dto.MemberDto;
import spms.dto.NoticeDto;

public class NoticeDao {

	private Connection conn;
	
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public List<NoticeDto> selectList() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT NO, TITLE, WRITER, CRE_DATE";
		sql += " FROM NOTICE";
		sql += " ORDER BY NO ASC";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			List<NoticeDto> NoticeList = 
				new ArrayList<NoticeDto>();
			
			int no = 0;
			String title = "";
			MemberDto writer = null;
			Date createdDate = null;
			
			MemberDao memberDao = new MemberDao();
			memberDao.setConnection(conn);
			
			while (rs.next()) {
				no = rs.getInt("NO");
				title = rs.getString("TITLE");
				writer = memberDao.memberSelectOne(rs.getInt("WRITER"));
				createdDate = rs.getDate("CRE_DATE");
				NoticeDto noticeDto = 
					new NoticeDto(no, title, createdDate, writer);

				NoticeList.add(noticeDto);
			}

			return NoticeList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	public int addList(NoticeDto noticeDto) throws Exception {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		

		try {
			String title = noticeDto.getTitle();
			String text = noticeDto.getText();
			int writer = noticeDto.getWriter().getNo();
			
			String sql = "INSERT INTO NOTICE" 
					+ " (NO, TITLE, TEXT, CRE_DATE,WRITER)"
					+ " VALUES(NOTICE_NO_SEQ.NEXTVAL,"
					+ " ?, ?, SYSDATE, ?)";
			

			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, text);
			pstmt.setInt(3, writer);


			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;

		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			try {
				if (pstmt != null) {
					pstmt.close();
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return result;
	}
}
