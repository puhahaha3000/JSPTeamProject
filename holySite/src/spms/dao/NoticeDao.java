package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import spms.dto.BulletinDto;
import spms.dto.MemberDto;

public class NoticeDao {

	private Connection conn;
	
	private void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public List<NoticeDao> selectList() throws Exception {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "SELECT NO, TITLE, WRITER, CRE_DATE";
		sql += " FROM BULLETIN";
		sql += " ORDER BY NO ASC";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			ArrayList<BulletinDto> memberList = 
				new ArrayList<BulletinDto>();
			
			int no = 0;
			String title = "";
			String writer = "";

			while (rs.next()) {
				no = rs.getInt("NO");
				title = rs.getString("EMAIL");
				writer = rs.getString("NICKNAME");

				MemberDto memberDto = 
					new MemberDto(no, title, writer);

				memberList.add(memberDto);
			}

			return memberList;
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
}
