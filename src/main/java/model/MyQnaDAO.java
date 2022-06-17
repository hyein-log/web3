
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.MyQnaVO;
import util.DBUtil;

public class MyQnaDAO {

	static final String SELECT_MYQNA = "select * from QnA order by 1 desc";
	static final String SELECT_BYID = "SELECT * FROM QnA WHERE MEMBER_ID = ? order by 1 desc";
	static final String SELECT_QAID = "select * from QnA where qa_id = ?";
	static final String INSERT_MYQNA = "INSERT INTO QnA values(qna_seq.nextval, ?, ?, ?, null, sysdate, null)";
	static final String UPDATE_MYQNA = "update QnA set qa_title = ?, qa_content=?, qa_date=sysdate where qa_id = ?";
	static final String DELETE_MYQNA = "delete from QnA where qa_id = ? ";
	static final String UPDATE_ANSWER = "update QnA set qa_answer = ? where qa_id = ?";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	
	//전체 목록 조회
	public List<MyQnaVO> selectAll() {
		List<MyQnaVO> mlist = new ArrayList<>();
		MyQnaVO myqna = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_MYQNA);
			rs = st.executeQuery();
			while(rs.next()) {
				myqna = makeMyqna(rs);
				mlist.add(myqna);
				
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}		
		return mlist;
	}

	//로그인한 회원 게시판만 보이게 
	public List<MyQnaVO> selectById(int memId) {
		List<MyQnaVO> list = new ArrayList<>();
		MyQnaVO myqna = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_BYID);
			st.setInt(1, memId);
			rs = st.executeQuery();
			while(rs.next()) {
				myqna = makeMyqna(rs);
				list.add(myqna);
				
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}		
		//System.out.println(list);
		return list;
	}
	
	
	public MyQnaVO selectQaId(int qaId) {
		MyQnaVO myqna = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_QAID);
			st.setInt(1, qaId);
			rs = st.executeQuery();
			while(rs.next()) {
				myqna = makeMyqna(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return myqna;
		
	}
	

	private MyQnaVO makeMyqna(ResultSet rs) throws SQLException {
		MyQnaVO my = new MyQnaVO();
		my.setMember_id(rs.getInt("member_id"));
		my.setQa_answer(rs.getString("qa_answer"));
		my.setQa_answer_date(rs.getDate("qa_answer_date"));
		my.setQa_content(rs.getString("qa_content"));
		my.setQa_date(rs.getDate("qa_date"));
		my.setQa_id(rs.getInt("qa_id"));
		my.setQa_title(rs.getString("qa_title"));
		
		return my;
	}
	
	//
	
	//insert
	public int myInsert(MyQnaVO my) {

        int result = 0;
        conn = DBUtil.getConnection();
        try {
            st = conn.prepareStatement(INSERT_MYQNA);
            st.setInt(1, my.getMember_id());	//외래키
            st.setString(2,my.getQa_title());
            st.setString(3, my.getQa_content());

            result = st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.dbClose(rs, st, conn);
        }
        return result;
    }
	
	//update..
	public int myUpdate(MyQnaVO my) {
		
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_MYQNA);
			st.setString(1,my.getQa_title());
			st.setString(2, my.getQa_content());
			st.setInt(3, my.getQa_id());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
	
	//delete
	public int myDelete(int qaId) {
		
		int result = 0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(DELETE_MYQNA);
			st.setInt(1, qaId);	//외래키
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}

	public int updateAnswer(MyQnaVO myqna) {
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_ANSWER);
			st.setString(1,myqna.getQa_answer());
			st.setInt(2, myqna.getQa_id());
			
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
	
	
}
