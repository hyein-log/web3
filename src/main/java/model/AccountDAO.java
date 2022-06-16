
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import dto.AcclistVO;
import dto.AccountVO;
import util.DBUtil;

public class AccountDAO {

	static final String SELECT_ACCOUNT = "select * from account order by 1 desc";

	static final String SELECT_ACC_MEMBER_ID = "SELECT * FROM account WHERE MEMBER_ID = ?";

	static final String SQL_INSERT = "INSERT INTO account values( acc_seq.nextval, ?, ?, ?, 0, ?, sysdate, 'x')";
	static final String UPDATE_BALANCE = "UPDATE ACCOUNT SET BALANCE = ? WHERE ACCOUNT_ID =?";
	static final String DELETE_ACC = "DELETE FROM ACCOUNT WHERE ACC_NUMBER = ?";
	static final String UPDATE_LIMIT = "UPDATE account SET limit_ox = 'O' WHERE ACC_NUMBER =?";
	static final String SELECT_ACCMEM_BYID_TYPE0 = "SELECT * FROM account WHERE MEMBER_ID = ? AND ACCOUNTTYPE =0";
	static final String SELECT_ACCID_BY_ACCNUM = "SELECT * FROM ACCOUNT WHERE ACC_NUMBER=?";
	static final String SELECT_PW = "SELECT * FROM ACCOUNT WHERE account_id= ?";
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	// 전체목록

	public List<AccountVO> selectAll() {
		List<AccountVO> alist = new ArrayList<>();
		AccountVO account = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_ACCOUNT);
			rs = st.executeQuery();
			while (rs.next()) {
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

	public List<AccountVO> selectById(int memId) {
		List<AccountVO> list = new ArrayList<>();
		AccountVO account = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_ACC_MEMBER_ID);
			st.setInt(1, memId);
			rs = st.executeQuery();
			while (rs.next()) {
				account = makeAcc(rs);
				list.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return list;
	}

	public int selectPw(int accid) {
		AccountVO acc = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_PW);
			st.setInt(1, accid);
			rs = st.executeQuery();
			while (rs.next()) {
				acc = makeAcc(rs);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return acc.getAcc_pass();
	}

	public int selectBal(String accNum) {
		AccountVO acc = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_ACCID_BY_ACCNUM);
			st.setString(1, accNum);
			rs = st.executeQuery();
			while (rs.next()) {
				acc = makeAcc(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return acc.getBalance();
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

	// 怨꾩쥖 insert
	public String accInsert(AccountVO acc) {

		int result = 0;

		String c = new Date().getTime() + "000";
		String s = c.substring(0, 4) + "-" + c.substring(4, 7) + "-" + c.substring(7, 10) + c.substring(10, 13);

		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SQL_INSERT);
			st.setInt(1, acc.getMember_id()); // 외래키
			st.setInt(2, acc.getAccountType());
			st.setString(3, s);
			// st.setInt(4, acc.getBalance());
			st.setInt(4, acc.getAcc_pass());
			// st.setDate(5, acc.getMakedate());

			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			s = null;
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return s;
	}

	public int updateLimit(String accNum) {
		conn = DBUtil.getConnection();
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

	// 계좌 해지
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

	public List<AccountVO> SELECT_ACCMEM_BYID_TYPE0(int memberid) {
		List<AccountVO> list = new ArrayList<>();
		AccountVO account = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_ACCMEM_BYID_TYPE0);
			st.setInt(1, memberid);
			rs = st.executeQuery();
			while (rs.next()) {
				account = makeAcc(rs);
				list.add(account);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return list;
	}

	public AccountVO SELECT_ACCID_BY_ACCNUM(String acc_number) {
		AccountVO acc = null;
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_ACCID_BY_ACCNUM);
			st.setString(1, acc_number);
			rs = st.executeQuery();
			while (rs.next()) {
				acc = makeAcc(rs);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return acc;
	}

	public int UPDATE_BALANCE(int balance, int account_id) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_BALANCE);
			st.setInt(1, balance);
			st.setInt(2, account_id);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
	public int selectMemBal(int memberid) {
		List<AccountVO> acc = new ArrayList<AccountVO>();
		conn = DBUtil.getConnection();
		int sum = 0;
		try {
			st = conn.prepareStatement(SELECT_ACC_MEMBER_ID);
			st.setInt(1, memberid);
			rs = st.executeQuery();
			while (rs.next()) {
				acc.add(makeAcc(rs));
			}
			
			for(int i=0; i<acc.size(); i++) {
				sum += acc.get(i).getBalance();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return sum;
	}
}
