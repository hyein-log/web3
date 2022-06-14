package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.NoticeVO;
import util.DBUtil;

public class NoticeDAO {

	static final String SQL_SELECT_ALL = "select * from notice order by 1 desc";
	static final String SQL_SELECT_BY_ID = "select * from notice where notic_id = ?";
	static final String SQL_DELETE = "delete from notice where notic_id = ?";
	static final String SQL_INSERT = "insert into notice values(notice_seq.nextval,?,?,sysdate)";
	static final String SQL_UPDATE = "update notice set notic_title = ? , notic_content = ? , notic_date = sysdate where notic_id = ?";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;

	
	int result;
	
	public List<NoticeVO> selectAll() {
		List<NoticeVO> nlist = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL);
			rs = st.executeQuery();
			while(rs.next()) {
				nlist.add(makeNotice(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return nlist;
	}
	
	public NoticeVO selectById(int i_noticeid) {
		NoticeVO notice = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_BY_ID);
			st.setInt(1, i_noticeid);
			rs = st.executeQuery();
			while(rs.next()) {
				notice = makeNotice(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return notice;
		
	}


	
	public int delete(int nno) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_DELETE);
			st.setInt(1, nno);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return result;
	}
	
	public int insert(NoticeVO notice) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_INSERT);
			st.setString(1, notice.getNotice_title());
			st.setString(2, notice.getNotice_content());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return result;
	}
	
	public int update(NoticeVO notice) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_UPDATE);
			st.setString(1, notice.getNotice_title());
			st.setString(2, notice.getNotice_content());
			st.setInt(3, notice.getNotice_id());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return result;
	}
	
	private NoticeVO makeNotice(ResultSet rs) throws SQLException {
		NoticeVO notice = new NoticeVO();
		notice.setNotice_id(rs.getInt(1));
		notice.setNotice_title(rs.getString(2));
		notice.setNotice_content(rs.getString(3));
		notice.setNotice_date(rs.getDate(4));
		
		return notice;
	}

	

	

	


}
