package model;

import util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dto.AcclistVO;

public class AcclistDAO {
	static final String SQL_SELECT_ALL = "SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=?";
	static final String SQL_SELECT_ALL_COUNT = "SELECT COUNT(*) FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=?";
	static final String SQL_SELECT_ALL_COUNT_IN = "SELECT COUNT(*) FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=? AND TRANS_KIND='입금'";
	static final String SQL_SELECT_ALL_COUNT_OUT = "SELECT COUNT(*) FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=?AND TRANS_KIND='출금'";
	static final String SQL_SELECT_ALL_PAGE = "SELECT * FROM(select* from(SELECT rownum num,a.* FROM (SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=? ORDER BY trans_date desc)a )WHERE num >=?)WHERE num<=?";	
	static final String SQL_SELECT_KIND = "SELECT * FROM(select* from(SELECT rownum num,a.* FROM (SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where ACC_NUMBER=?and TRANS_KIND = ? ORDER BY trans_date desc)a )WHERE num >=?)WHERE num<=?";
	Connection conn;
	PreparedStatement st; 
	ResultSet rs;
	int result;
	

	
	public List<AcclistVO> SQL_SELECT_KIND(String ACC_NUMBER, String kind, int page) {
		List<AcclistVO> acclist = new ArrayList<AcclistVO>();
		int startNum = (page-1)*10+1;
	    int endNum = page*10;
	    
		conn = DBUtil.getConnection();
		try {
			 st = conn.prepareStatement(SQL_SELECT_KIND);
			 st.setString(1, ACC_NUMBER);
			 st.setString(2, kind);
			 st.setInt(3, startNum);
			 st.setInt(4, endNum);
	         rs = st.executeQuery();
	           
			while (rs.next()) {
				acclist.add(makelist(rs));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return acclist;
	}
	
	public List<AcclistVO> SELECT_ACCLIST_ALL(String ACC_NUMBER) {
		List<AcclistVO>  acclist = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL);
			st.setString(1, ACC_NUMBER);
			rs = st.executeQuery();
			
			while (rs.next()) {
				acclist.add(makelist(rs));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return acclist;
	}
	
	private AcclistVO makelist(ResultSet rs) throws SQLException {
		AcclistVO acclist = new AcclistVO();
		
		acclist.setAcc_pass(rs.getInt("acc_pass"));
		acclist.setAccount_id(rs.getInt("account_id"));
		acclist.setAccounttype(rs.getInt("accounttype"));
		acclist.setBalance(rs.getLong("balance"));
		acclist.setLocation(rs.getString("location"));
		acclist.setMember_id(rs.getInt("member_id"));
		acclist.setPast_acc(rs.getLong("past_acc"));
		acclist.setTrans_acc(rs.getLong("trans_acc"));
		acclist.setTrans_date(rs.getDate("trans_date"));
		acclist.setTrans_id(rs.getInt("trans_id"));
		acclist.setTrans_kind(rs.getString("trans_kind"));
		acclist.setTrans_name(rs.getString("trans_name"));
		acclist.setMakedate(rs.getDate("makedate"));
		acclist.setAcc_number(rs.getString("acc_number"));
		return acclist;
	}

	public List<AcclistVO> SQL_SELECT_ALL_PAGE(String id ,int page) {
		List<AcclistVO> list = new ArrayList<AcclistVO>();
		int startNum = (page-1)*10+1;
	    int endNum = page*10;
	    
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL_PAGE);
			st.setString(1, id);
			st.setInt(2, startNum);
			st.setInt(3, endNum);
			rs = st.executeQuery();
			
			while (rs.next()) {
				list.add(makelist(rs));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return list;
	}
	public int SQL_SELECT_ALL_COUNT(String id ) {
		int a=0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL_COUNT);
			st.setString(1, id);
			rs = st.executeQuery();
			
			while (rs.next()) {
				a= rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return a;
	}
	public int SQL_SELECT_ALL_COUNT_IN(String id ) {
		int a=0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL_COUNT_IN);
			st.setString(1, id);
			rs = st.executeQuery();
			
			while (rs.next()) {
				a= rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return a;
	}
	public int SQL_SELECT_ALL_COUNT_OUT(String id ) {
		int a=0;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_SELECT_ALL_COUNT_OUT);
			st.setString(1, id);
			rs = st.executeQuery();
			
			while (rs.next()) {
				a= rs.getInt(1);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return a;
	}
	private static AcclistDAO instance = new AcclistDAO();
	
	public static AcclistDAO getInstance() {
		return instance;
	}
	public AcclistDAO() {
		
	}
}
