package model;

import util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.MemberVO;

public class MemberDAO {
	static final String SELECT_MEMBER = "select * from member";
	static final String SELECT_MEMBER_BY_ID = "select * from member where id=? and password=?";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	public int insertMember(MemberVO member) {
		return 0;
	}

	public ArrayList<MemberVO> getMembers() {
		ArrayList<MemberVO> members = new ArrayList<MemberVO>();
		MemberVO memberVO;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_MEMBER);
			rs = st.executeQuery();
			while(rs.next()) {
				memberVO = makeMember(rs);
				members.add(memberVO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return members;
	}
	
	public MemberVO selectById(String user_id, String user_pass) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_MEMBER_BY_ID);
            st.setString(1, user_id);
            st.setString(2, user_pass);
            rs = st.executeQuery();
            while(rs.next()) {
				member = makeMember(rs);
			}
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.dbClose(rs, st, conn);
        }

        return member;
	}
	
	private MemberVO makeMember(ResultSet rs) throws SQLException {
		MemberVO member = new MemberVO();
		member.setId(rs.getString(3));
		member.setPassword(rs.getString(4));
		
		return member;
	}

	
	
}
