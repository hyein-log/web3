package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DBUtil;

public class Acc_listDAO {
	static final String INSERT_ACCLIST = "INSERT INTO ACC_LIST (TRANS_ID , ACCOUNT_ID, PAST_ACC, TRANS_ACC, TRANS_KIND) VALUES (acc_list_seq.nextval,?,?,?,?)";
	
	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;
	public int InsertAccList(int ACCOUNT_ID, int PAST_ACC, int TRANS_ACC, String TRANS_KIND) {
		conn=DBUtil.getConnection();
		try { 
			st = conn.prepareStatement(INSERT_ACCLIST);
			st.setInt(1, ACCOUNT_ID);
			st.setInt(2, PAST_ACC);
			st.setInt(3, TRANS_ACC);
			st.setString(4, TRANS_KIND);
			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}
}
