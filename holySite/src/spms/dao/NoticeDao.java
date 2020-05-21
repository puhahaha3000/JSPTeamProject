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
		sql += " ORDER BY NO DESC";

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
	
	public int noticeDelete(int no) throws SQLException {
		int result = 0;

		PreparedStatement pstmt = null;

		String sql = "";
		sql = "DELETE FROM NOTICE";
		sql += " WHERE NO = ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		} finally {

			try {
				if (pstmt != null) {
					pstmt.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} // finally 종료

		return result;
	}
	
	public NoticeDto noticeSelectOne(int no) throws Exception {

		NoticeDto noticeDto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		sql = "SELECT NO, TITLE, TEXT, WRITER";
		sql += " FROM NOTICE";
		sql += " WHERE NO =?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();


			String title = "";
			String text = "";
			MemberDto writer = null;
			

			if (rs.next()) {
				title = rs.getString("TITLE");
				text = rs.getString("TEXT");
				MemberDao memberDao = new MemberDao();
				memberDao.setConnection(conn);
				
				writer = memberDao.memberSelectOne(rs.getInt("WRITER"));

				noticeDto = new NoticeDto();

				noticeDto.setNo(no);
				noticeDto.setText(text);
				noticeDto.setTitle(title);
				noticeDto.setWriter(writer);
				
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}

		} catch (SQLException e) {
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

		} // finally 종료
		return noticeDto;
	}
	
	// 회원 정보 변경
		public int noticeUpdate(NoticeDto noticeDto) throws SQLException {
			int result = 0;

			PreparedStatement pstmt = null;

			String sql = "";
			sql = "UPDATE NOTICE";
			sql += " SET TITLE=?, TEXT=?, CRE_DATE=SYSDATE";
			sql += " WHERE NO =?";

			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, noticeDto.getTitle());
				pstmt.setString(2, noticeDto.getText());
				pstmt.setInt(3, noticeDto.getNo());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			} finally {
				try {
					if (pstmt != null) {
						pstmt.close();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} // finally 종료
			return result;
		}
		
		// 사용자 존재 유무 없으면 null 리턴
		public NoticeDto memberExist(String title, String text, int no) throws SQLException {
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "";
			
			sql += "SELECT TITLE, TEXT, NO";
			sql += " FROM NOTICE";
			sql += " WHERE TITLE = ?";
			sql += " AND TEXT = ?";
			sql += " AND NO = ?";
			
			
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				int colIndex = 1;
				
				pstmt.setString(colIndex++, title);
				pstmt.setString(colIndex++, text);
				pstmt.setInt(colIndex, no);
				
				rs = pstmt.executeQuery();
				
				NoticeDto noticeDto = new NoticeDto();
				
				if (rs.next()) {
					title = rs.getString("title");
					text = rs.getString("text");
					
					noticeDto.setText(text);
					noticeDto.setTitle(title);
					
					// 회원 정보 조회 확인
					return noticeDto;
				}
				
			} catch (SQLException e) {
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
			
			// 회원이 조회가 안된 경우
			return null;
		}

		
}
