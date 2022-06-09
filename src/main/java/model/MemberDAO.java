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
	static final String SELECT_MEMBER_BY_EMAIL = "select * from member where name=? and email=?";
	static final String SELECT_EMAIL_BY_ID = "select * from member where id=?";
	
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
	
	public MemberVO selecByEmail(String name, String email) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_MEMBER_BY_EMAIL);
            st.setString(1, name);
            st.setString(2, email);
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

	public MemberVO selectEmailById(String id) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_EMAIL_BY_ID);
            st.setString(1, id);
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
		member.setName(rs.getString(2));
		member.setId(rs.getString(3));
		member.setPassword(rs.getString(4));
		member.setEmail(rs.getString(5));
		
		return member;
	}


	

	
	
}
