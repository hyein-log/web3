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
	static final String SELECT_AUTO_LIST = "SELECT * FROM auto_withdraw WHERE ACCOUNT_ID = ?";
	static final String SELECT_AUTO_ID = "SELECT * FROM AUTO_WITHDRAW WHERE auto_id = ?";
	static final String UPDATE_AUTO = "UPDATE Auto_withdraw SET AUTO_CONTENT=?, AUTO_AMONUT=?, EXPIRY_DATE=?, AUTO_DATE=?  WHERE AUTO_ID =?";
	static final String insert_AUTO = "INSERT INTO AUTO_WITHDRAW values(auto_withdraw_seq.nextval, ?, ?, ?, ?, ?, 0)";
	static final String DELETE_AUTO_ID = "DELETE FROM AUTO_WITHDRAW WHERE AUTO_ID = ?";

	Connection conn;
	PreparedStatement st;
	ResultSet rs;
	int result;

	public List<AutoSendVO> selectByAuto(int accId) {
		List<AutoSendVO> list = new ArrayList<>();
		AutoSendVO auto = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_AUTO_LIST);
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

	public AutoSendVO selectById(int autoid) {
		AutoSendVO vo = null;
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(SELECT_AUTO_ID);
			st.setInt(1, autoid);
			rs = st.executeQuery();
			while (rs.next()) {
				vo = makeAuto(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}

		return vo;
	}

	public int updateAuto(AutoSendVO autosend) {
		conn = DBUtil.getConnection();
		try {
			st = conn.prepareStatement(UPDATE_AUTO);
			st.setString(1, autosend.getAuto_content());
			st.setInt(2, autosend.getAuto_amonut());
			st.setDate(3, autosend.getExpiry_date());
			st.setInt(4, autosend.getAuto_date());
			st.setInt(5, autosend.getAuto_id());

			result = st.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;

	}

	public int insertAuto(AutoSendVO autosend) {
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(insert_AUTO);
			st.setInt(1, autosend.getAuto_id());
			st.setString(2, autosend.getAuto_content());
			st.setInt(3, autosend.getAuto_amonut());
			st.setDate(4, autosend.getExpiry_date());
			st.setInt(5, autosend.getAuto_date());

			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}

	public int deleteAuto(int autoid) {
		conn = DBUtil.getConnection();

		try {
			st = conn.prepareStatement(DELETE_AUTO_ID);
			st.setInt(1, autoid);

			result = st.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.dbClose(rs, st, conn);
		}
		return result;
	}

	private AutoSendVO makeAuto(ResultSet rs) throws SQLException {
		AutoSendVO auto = new AutoSendVO();

		auto.setAuto_id(rs.getInt("auto_id"));
		auto.setAccount_id(rs.getInt("account_id"));
		auto.setAuto_content(rs.getString("auto_content"));
		auto.setAuto_amonut(rs.getInt("auto_amonut"));
		auto.setExpiry_date(rs.getDate("expiry_date"));
		auto.setAuto_date(rs.getInt("auto_date"));
		auto.setDelay_count(rs.getInt("delay_count"));

		return auto;
	}
}
