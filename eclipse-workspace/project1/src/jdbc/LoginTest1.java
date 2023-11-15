package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

import org.apache.commons.codec.digest.DigestUtils;

public class LoginTest1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("id : ");
		String userid = sc.nextLine();
		System.out.print("pw : ");
		String userpw = DigestUtils.sha512Hex(sc.nextLine());
		
//		쿼리 작성이 용이하다.
//		성능이 향상된다.
//		SQL Injection에 강해짐.
		String sql = "SELECT userid, name " +
					"FROM members " +
					"WHERE userid=? and userpw=? ";
		
//		String sql = "SELECT employee_id, last_name, salary FROM employees";
		try (Connection conn = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521/xepdb1", "ace", "ace");
			PreparedStatement stmt = conn.prepareStatement(sql)){
			
			stmt.setString(1,  userid);
			stmt.setString(2, userpw);
			
			try (ResultSet rs = stmt.executeQuery()){
			
				if(rs.next()) {
					System.out.println(
							rs.getString("name") + "(" +
							rs.getString("userid") + ") 님이 로그인 하였습니다.");
				} else {
					System.out.println(
							"아이디 혹은 비번이 틀립니다.");
	//				System.out.println(rs.getString("last_name") + "\t");
	//				System.out.println(rs.getLong("salary") + "\t");
				}
			}
		} catch (Exception e) {
			System.out.println("실패:" + e.getMessage());
		}
		System.out.println(DigestUtils.sha512Hex("1234"));
	}

}
