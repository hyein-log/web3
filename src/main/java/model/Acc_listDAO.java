package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.Acc_listVO;
import dto.AcclistVO;
import util.DBUtil;

public class Acc_listDAO {
	static final String INSERT_ACCLIST = "INSERT INTO ACC_LIST (TRANS_ID , ACCOUNT_ID, PAST_ACC, TRANS_ACC, TRANS_KIND, Trans_name) VALUES (acc_list_seq.nextval,?,?,?,?,?)";
	static final String SELECT_LIST_BY_TERM ="SELECT * FROM ACC_LIST al WHERE ACCOUNT_ID =? AND TRANS_DATE BETWEEN ? AND ?";
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	public int InsertAccList(int ACCOUNT_ID, int PAST_ACC, int TRANS_ACC, String TRANS_KIND, String TRANS_NAME) {
		conn=DBUtil.getConnection();
		try { 
			st = conn.prepareStatement(INSERT_ACCLIST);
			st.setInt(1, ACCOUNT_ID);
			st.setInt(2, PAST_ACC);
			st.setInt(3, TRANS_ACC);
			st.setString(4, TRANS_KIND);
			st.setString(5, TRANS_NAME);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
	public List<Acc_listVO> SELECT_ACCLIST_ALL(int account_id, String startDate, String EndDate) {
		List<Acc_listVO>  acclist = new ArrayList<>();
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(SELECT_LIST_BY_TERM);
			st.setInt(1, account_id);
			st.setString(2, startDate);
			st.setString(3, EndDate);
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
	private Acc_listVO makelist(ResultSet rs) throws SQLException {
		Acc_listVO acclist = new Acc_listVO();
		
		acclist.setAccount_id(rs.getInt("account_id"));
		acclist.setLocation(rs.getString("location"));
		acclist.setPast_acc(rs.getLong("past_acc"));
		acclist.setTrans_acc(rs.getLong("trans_acc"));
		acclist.setTrans_date(rs.getDate("trans_date"));
		acclist.setTrans_id(rs.getInt("trans_id"));
		acclist.setTrans_kind(rs.getString("trans_kind"));
		acclist.setTrans_name(rs.getString("trans_name"));
		return acclist;
	}
}
