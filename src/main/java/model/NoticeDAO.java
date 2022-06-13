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
	static final String SELECT_ALL = "SELECT * FROM NOTICE";
	static final String SELECT_ID = "SELECT * FROM notice WHERE notic_id = ?";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	public List<NoticeVO> selectAll() {
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		NoticeVO notice = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_ALL);
			rs = st.executeQuery();
			while(rs.next()) {
				notice = makeNoti(rs);
				list.add(notice);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return list;
	}
	
	public NoticeVO selectById(int num) {
		NoticeVO notice = null;
		conn = DBUtil.getConnection();
		
		try {
			st= conn.prepareStatement(SELECT_ID);
			st.setInt(1, num);
			rs = st.executeQuery();
			while(rs.next()) {
				notice = makeNoti(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return notice;
		
	}
	
	private NoticeVO makeNoti(ResultSet rs) throws SQLException {
		NoticeVO vo = new NoticeVO();
		vo.setNotic_id(rs.getInt("notic_id"));
		vo.setNotic_title(rs.getString("notic_title"));
		vo.setNotic_content(rs.getString("notic_content"));
		vo.setNotic_date(rs.getDate("notic_date"));
		
		return vo;
	}
}
