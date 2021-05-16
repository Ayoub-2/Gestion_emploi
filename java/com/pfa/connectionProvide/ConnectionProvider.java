package com.pfa.connectionProvide;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {
	private String jdbcURL = "jdbc:mysql://localhost:3308/programmeemploi?useUnicode=true&amp;characterEncoding=UTF-8";
	private String jdbcUsername = "root";
	private String jdbcPassword = "root";
	public ConnectionProvider() {
	}
	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			System.out.println("Connected");
		
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
