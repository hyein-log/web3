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
		System.out.println("1.Driver load ����");
		//2.Connection
		String url = "jdbc:oracle:thin:@BankDB_medium?TNS_ADMIN=C:/Users/KIM/Desktop/Oracle_DB/Wallet_BankDB/";
		String userid = "admin";
		String password = "Kosta1234567!";
		
		Connection conn = DriverManager.getConnection(url, userid, password);
		System.out.println("2.Connection ����");
		//3.SQL�� ��λ���(DB�� ��ȭ�Ҽ��ִ� ��)
		Statement st = conn.createStatement();
		System.out.println("3.SQL�� ��λ���(DB�� ��ȭ�Ҽ��ִ� ��) ����");
		//4.SQL�� ����
		String sql = "SELECT * FROM member";

		ResultSet rs= st.executeQuery(sql);
		System.out.println("4.SQL�� ���� �����ϰ� �����Ͱ� �޸𸮷� ���´�.");
		while(rs.next()) {
			System.out.println("NAME : "+rs.getString("membername"));
			
			System.out.println("--------------------------------");
		}
		//5.DB��������
		conn.close();
		System.out.println("5.DB�������� ����");
	}

}
