package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AccountVO;
import util.DBUtil;


public class AccountDAO {

	static final String SELECT_ACCOUNT = "select * from account order by 1 desc";
	static final String SQL_INSERT = "INSERT INTO account values( acc_seq.nextval, ?, ?, ?, 0, ?, sysdate)";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	//전체목록
	public List<AccountVO> selectAll() {
		List<AccountVO> alist = new ArrayList<>();
		AccountVO account = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_ACCOUNT);
			rs = st.executeQuery();
			while(rs.next()) {
				account = makeAcc(rs);
				alist.add(account);
				
			}				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}		
		return alist;
	}
	
	private AccountVO makeAcc(ResultSet rs) throws SQLException {
		
		AccountVO acc = new AccountVO();
		acc.setAcc_number(rs.getString("acc_number"));
		acc.setAcc_pass(rs.getInt("acc_pass"));
		acc.setAccount_id(rs.getInt("account_id"));
		acc.setAccountType(rs.getInt("accountType"));
		acc.setBalance(rs.getInt("balance"));
		acc.setMember_id(rs.getInt("member_id"));
		acc.setMakedate(rs.getDate("makedate"));
		
		return acc;
	
	}

	//계좌 생성
	public int accInsert(AccountVO acc) {
		 
		int result = 0;
		
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_INSERT);
            st.setInt(1, acc.getMember_id());
            st.setInt(2, acc.getAccountType());
            st.setString(3, acc.getAcc_number());
           // st.setInt(4, acc.getBalance());
            st.setInt(4, acc.getAcc_pass());
            //st.setDate(5, acc.getMakedate());
			result = st.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}		
		return result;
	}
	
}
