package jdbc;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class JdbcTest2 {
	public static void main(String[] args) {
		String sql = "SELECT employee_id, last_name, salary FROM employees";
		try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql)){
			
			while(rs.next()) {
				System.out.println(rs.getInt("employee_id") + "\t");
				System.out.println(rs.getString("last_name") + "\t");
				System.out.println(rs.getLong("salary") + "\t");
			}
		} catch (Exception e) {
			System.out.println("실패:" + e.getMessage());
		} 
	}
}