package model;

import util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.MemberVO;

public class MemberDAO {
	static final String SELECT_MEMBER = "select * from member";
	static final String SELECT_MEMBER_BY_ID = "select * from member where id=? and password=?";
	static final String SELECT_MEMBER_BY_EMAIL = "select * from member where name=? and email=?";
	static final String SELECT_EMAIL_BY_ID = "select * from member where id=?";
	static final String SELECT_BY_ID_EMAIL = "select * from member where id=? and name=? and email=?";
	static final String SELECT_BY_EMAIL_FOR_PASS = "select * from member where email=?";
	static final String PASSWORD_UPDATE = "update member set password=? where email=?";
	static final String MEMBER_INSERT = "insert into member values(member_id_seq.nextval,?,?,?,?,?,?,'X','X')";
	static final String SELECT_ALL_ID = "select id from member where id=?";
	static final String SELECT_ALL_EMAIL = "select email from member where email=?";
	static final String SELECT_MEMBER_BY_MEMBERID = "select * from member where member_id=?";
	static final String UPDATE_MEMBER_EMAIL = "UPDATE MEMBER SET EMAIL = ? WHERE MEMBER_ID =?";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

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
		member.setMember_id(rs.getInt("Member_id"));
		return member;
	}


	public MemberVO selectByIdEmail(String id, String name, String email) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_BY_ID_EMAIL);
            st.setString(1, id);
            st.setString(2, name);
            st.setString(3, email);
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
	public MemberVO selectByEmailForPass(String email) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_BY_EMAIL_FOR_PASS);
            st.setString(1, email);
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
	
	public int passwordUpdate(MemberVO member) {
		conn = DBUtil.getConnection();
		System.out.println(member);
		try {
			st = conn.prepareStatement(PASSWORD_UPDATE);
			st.setString(1, member.getPassword());
			st.setString(2, member.getEmail());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return result;
	}

	public int insertMember(MemberVO member) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(MEMBER_INSERT);
			st.setString(1, member.getName());
			st.setString(2, member.getId());
			st.setString(3, member.getPassword());
			st.setString(4, member.getEmail());
			st.setString(5, member.getAddress());
			st.setString(6, member.getPhoneNum());
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return result;
	}
	public int selectAllId(String id) {
		int sai_result=-1;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_ALL_ID);
            st.setString(1, id);
            rs = st.executeQuery();
            if(rs.next()) {
            	sai_result=1; //議댁옱 �븷 寃쎌슦
            	System.out.println("result 媛� : "+sai_result);
            }else {
            	//議댁옱�븯吏� �븡�쓣寃쎌슦
            	sai_result=0;
            	System.out.println("result 媛� : "+sai_result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.dbClose(rs, st, conn);
        }
        return sai_result;
	}

	public int selectAllEmail(String email) {
		int sai_result=-1;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_ALL_EMAIL);
            st.setString(1, email);
            rs = st.executeQuery();
            if(rs.next()) {
            	sai_result=1; //議댁옱 �븷 寃쎌슦
            	System.out.println("result 媛� : "+sai_result);
            }else {
            	//議댁옱�븯吏� �븡�쓣寃쎌슦
            	sai_result=0;
            	System.out.println("result 媛� : "+sai_result);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.dbClose(rs, st, conn);
        }
        return sai_result;
	}
	

	public MemberVO selectMemberByMemberId(int memberid) {
		MemberVO member = null;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(SELECT_MEMBER_BY_MEMBERID);
            st.setInt(1, memberid);
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
	
	public int update_member_email(MemberVO member) {
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_MEMBER_EMAIL); // sql臾몄옣 誘몃━ 以�鍮�
			st.setString(1, member.getEmail());
			st.setInt(2, member.getMember_id());
			
			result = st.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
}
