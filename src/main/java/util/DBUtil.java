package util;

import javax.naming.Context;

import java.sql.DriverManager;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {

//	public static Connection getConnection() {
//		Context initContext = null;
//		Connection conn = null;
//		try {
//			initContext = new InitialContext();
//			Context envContext  = (Context)initContext.lookup("java:/comp/env");
//			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
//			conn = ds.getConnection();
//		} catch (NamingException e) {
//			throw new RuntimeException(e);
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//
//		return conn;
//	}

	public static Connection getConnection() {
		Connection conn = null;

//	  String url = "jdbc:oracle:thin:@bankdb_medium?TNS_ADMIN=C:/Users/KIM/Desktop/Oracle_DB/Wallet_BankDB";
//		String url = "jdbc:oracle:thin:@bankdb_medium?TNS_ADMIN=C:/kosta241/Wallet_BankDB";
//		String url = "jdbc:oracle:thin:@bankdb_medium?TNS_ADMIN=/Users/jeonmingi/Wallet_BankDB";

		String userid = "ADMIN", password="Kosta1234567";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url,userid,password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;

	}
	
	public static void dbClose(ResultSet rs, Statement st,Connection conn) {
		try {
			if(rs!=null)rs.close();
			if(st!=null)st.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
