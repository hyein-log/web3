package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.AcclistVO;
import dto.MemberAccountJoinVO;
import util.DBUtil;

public class MemberAccountJoinDAO {
	static final String SQL_SELECT_BY_MEMBERID = "SELECT  name, ACCOUNT_ID , MEMBER_ID , ACC_NUMBER , BALANCE , ACC_PASS  FROM MEMBER JOIN ACCOUNT a using(member_id) WHERE ACCOUNTTYPE =0 AND MEMBER_ID =?";
	static final String SQL_SELECT_BY_ACC_NUMBER = "SELECT  *  FROM MEMBER JOIN ACCOUNT a using(member_id) WHERE ACCOUNTTYPE =0 AND ACC_NUMBER =?";
	Connection conn;
	Statement st;
	PreparedStatement pst; 
	ResultSet rs;
	int result;
	
	public MemberAccountJoinVO SELECT_BY_ACC_NUMBER(String ACC_NUMBER) {
		MemberAccountJoinVO  mem_acc = null;
		conn = DBUtil.getConnection();
		 try {
			 pst = conn.prepareStatement(SQL_SELECT_BY_ACC_NUMBER);
			 pst.setString(1, ACC_NUMBER);
	            rs = pst.executeQuery();
	            while(rs.next()) {
	            	mem_acc = makeMemAcc(rs);
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		
		return mem_acc;
	}
	private MemberAccountJoinVO makeMemAcc(ResultSet rs) throws SQLException {
		MemberAccountJoinVO mem_acc = new MemberAccountJoinVO();
		mem_acc.setAccount_id(rs.getInt("account_id"));
		mem_acc.setAcc_number(rs.getString("acc_number"));
		mem_acc.setAcc_pass(rs.getInt("acc_pass"));
		mem_acc.setAccounttype(rs.getInt("accounttype"));
		mem_acc.setAddress(rs.getString("address"));
		mem_acc.setBalance(rs.getInt("balance"));
		mem_acc.setDropout_ox(rs.getString("dropout_ox"));
		mem_acc.setEmail(rs.getString("email"));
		mem_acc.setId(rs.getString("id"));
		mem_acc.setLimit_ox(rs.getString("limit_ox"));
		mem_acc.setMakedate(rs.getDate("makedate"));
		mem_acc.setMember_id(rs.getInt("member_id"));
		mem_acc.setName(rs.getString("name"));
		mem_acc.setPassword(rs.getString("password"));
		mem_acc.setPhonenum(rs.getString("phonenum"));
		mem_acc.setSubscri_ox(rs.getString("subscri_ox"));
		return mem_acc;
	}
}
