package com.smarthostel.ConnectionFactory;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static final String URL =  "jdbc:mysql://mysql-db:3306/hosteldb?useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER = "root";
	private static final String PASSWORD = "root12345678";

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
