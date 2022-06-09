package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.Arrays;

import java.util.List;

import dto.AccountVO;
import util.DBUtil;


public class AccountDAO {

	static final String SELECT_ACCOUNT = "select * from account order by 1 desc";

	static final String SELECT_ACC_MEMBER_ID = "SELECT * FROM account WHERE MEMBER_ID = ?";
	static final String SQL_INSERT = "INSERT INTO account values( acc_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
	static final String DELETE_ACC= "DELETE FROM ACCOUNT WHERE ACC_NUMBER = ?";
	static final String UPDATE_LIMIT= "UPDATE account SET limit_ox = 'O' WHERE ACC_NUMBER =?";

	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	
	//�쟾泥대ぉ濡�
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
	

	//�쉶�썝�쓽 怨꾩쥖 議고쉶
	public List<AccountVO> selectById(int memId) {
		List<AccountVO> list = new ArrayList<>();
		AccountVO account = null;
		conn = DBUtil.getConnection();
		
		try {
			st = conn.prepareStatement(SELECT_ACC_MEMBER_ID);
			st.setInt(1, memId);
			rs = st.executeQuery();
			while(rs.next()) {
				account= makeAcc(rs);
				list.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return list;
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
		acc.setLimit_ox(rs.getString("limit_ox").charAt(0));
		
		return acc;
	
	}


	//怨꾩쥖 insert
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
	
	public int updateLimit(String accNum) {
		conn=DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_LIMIT);
			st.setString(1, accNum);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
	
	//怨꾩쥖 �빐吏�
	public int deleteAcc(String accNum) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(DELETE_ACC);
            st.setString(1, accNum);

			result = st.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}		
		return result;
	}
	
}
