package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

	private static Connection con;

	public static Connection getCon(){

		try {
			if (con == null) {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "Hari@Sql18");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}
}
