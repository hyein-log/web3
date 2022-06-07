package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionTest2Cloud {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//1.Driver load
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("1.Driver load 성공");
		//2.Connection
		String url = "jdbc:oracle:thin:@BankDB_medium?TNS_ADMIN=C:/Users/KIM/Desktop/Oracle_DB/Wallet_BankDB/";
		String userid = "admin";
		String password = "Kosta1234567!";
		
		Connection conn = DriverManager.getConnection(url, userid, password);
		System.out.println("2.Connection 성공");
		//3.SQL문 통로생성(DB와 대화할수있는 길)
		Statement st = conn.createStatement();
		System.out.println("3.SQL문 통로생성(DB와 대화할수있는 길) 성공");
		//4.SQL문 실행
		String sql = "SELECT * FROM member";

		ResultSet rs= st.executeQuery(sql);
		System.out.println("4.SQL문 실행 성공하고 데이터가 메모리로 들어온다.");
		while(rs.next()) {
			System.out.println("NAME : "+rs.getString("membername"));
			
			System.out.println("--------------------------------");
		}
		//5.DB연결해제
		conn.close();
		System.out.println("5.DB연결해제 성공");
	}

}
