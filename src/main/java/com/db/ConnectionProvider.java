package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection conn;
	
	public static Connection getConnection() {
		try {
			if(conn == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook","root","Blaise@123");
			}
			
		}catch(Exception e) {
			e.getCause().printStackTrace();
		}
		return conn;
	}
}
