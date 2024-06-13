package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;
import com.entity.Users;

public class UserDAO {
	
	private Connection con;
	
	public UserDAO(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addUsers(Users u) {
		
		boolean f = false;
		
		try {
			
			String query = "insert into user(name, email, password, qualification, role) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getQualification());
			ps.setString(5, "User");
			
			int i = ps.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
	}
	
	public Users login(String email, String password) {
		Users u = null;
		
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new Users();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setQualification(rs.getString(5));
				u.setEmail(rs.getString(6));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return u;
	}
	
	
	
}




















