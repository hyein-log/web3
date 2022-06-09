package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.AutoSendVO;
import util.DBUtil;

public class AutoSendDAO {
	static final String SELECT_AUTO = "SELECT * FROM auto_withdraw WHERE ACCOUNT_ID = ?";

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	public List<AutoSendVO> selectByAuto(int accId) {
		List<AutoSendVO> list = new ArrayList<>();
		AutoSendVO auto = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_AUTO);
			st.setInt(1, accId);
			rs = st.executeQuery();
			while (rs.next()) {
				auto = makeAuto(rs);
				list.add(auto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return list;
	}

	private AutoSendVO makeAuto(ResultSet rs) throws SQLException {
		AutoSendVO auto = new AutoSendVO();

		auto.setAuto_id(rs.getInt("auto_id"));
		auto.setAccount_id(rs.getInt("account_id"));
		auto.setAuto_content(rs.getString("auto_content"));
		auto.setAuto_amonut(rs.getInt("auto_amonut"));
		auto.setExpiry_date(rs.getDate("expiry_date"));
		auto.setAuto_date(rs.getDate("auto_date"));
		auto.setDelay_count(rs.getInt("delay_count"));

		return auto;
	}
}
