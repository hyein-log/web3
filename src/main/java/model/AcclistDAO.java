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
	static final String SQL_SELECT_ALL = "SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where member_id=?";
	static final String SQL_SELECT_ID = "SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) WHERE TRANS_ID = ?";
	static final String SQL_SELECT_KIND = "SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where  member_id=? and TRANS_KIND = ?";
	static final String SQL_SELECT_MAP = "SELECT * FROM ACC_LIST al JOIN ACCOUNT a using(ACCOUNT_ID) where  ACCOUNT_ID=? and TRANS_ID = ?";
	Connection conn;
	Statement st;
	PreparedStatement pst; // 바인딩변수지원 [?]
	ResultSet rs;
	int result;
	

	public AcclistVO SELECT_ACCLIST_MAP(int ACCOUNT_ID, int TRANS_ID) {
		AcclistVO  acc = null;
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_MAP);
			pst.setInt(1, ACCOUNT_ID);
			pst.setInt(2, TRANS_ID);
			rs = pst.executeQuery();
			while(rs.next()) {
				acc = makelist(rs);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return acc;
	}
	public AcclistVO SELECT_ACCLIST_BYID(int TRANS_ID) {
		AcclistVO  acc = null;
		conn = DBUtil.getConnection();
		 try {
			 pst = conn.prepareStatement(SQL_SELECT_ID);
			 pst.setInt(1, TRANS_ID);
	            rs = pst.executeQuery();
	            while(rs.next()) {
	            	acc = makelist(rs);
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return acc;
	}
	public List<AcclistVO> SQL_SELECT_KIND(int memberid, String kind) {
		List<AcclistVO>  acclist = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			 pst = conn.prepareStatement(SQL_SELECT_KIND);
			 pst.setInt(1, memberid);
			 pst.setString(2, kind);
	         rs = pst.executeQuery();
	           
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
	
	public List<AcclistVO> SELECT_ACCLIST_ALL(int memberid) {
		List<AcclistVO>  acclist = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			pst = conn.prepareStatement(SQL_SELECT_ALL);
			pst.setInt(1, memberid);
			rs = pst.executeQuery();
			
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

	
	
}
