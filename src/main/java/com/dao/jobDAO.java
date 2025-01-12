package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Jobs;

public class jobDAO {

	private Connection con;

	public jobDAO(Connection con) {
		super();
		this.con = con;
	}

	public boolean addJobs(Jobs j) {
		boolean f = false;

		try {

			String query = "insert into jobs(title,description,category,status,location) values(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			} else {
				f = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Jobs> getAllJobs() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {

			String query = "select * from jobs order by id desc";
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getDate(7) + "");

				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Jobs getJobsById(int id) {
		Jobs j = null;

		try {

			String query = "select * from jobs where id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getDate(7) + "");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return j;
	}

	public boolean updateJobs(Jobs j) {
		boolean f = false;

		try {

			String query = "update jobs set title=?,description=?,category=?,status=?,location=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());

			ps.setInt(6, j.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteJobs(int id) {
		boolean f = false;

		try {

			String query = "delete from jobs where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<Jobs> getAllJobsForUsers() {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {

			String query = "select * from jobs where status=? order by id desc";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getDate(7) + "");

				list.add(j);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Jobs> getJobsORLocationAndCategory(String category, String location) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {

			String query = "select * from jobs where category=? or location=? order by id DESC";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getDate(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List<Jobs> getJobsANDLocationAndCategory(String category, String location) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;

		try {

			String query = "select * from jobs where category=? and location=? order by id DESC";
			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, category);
			ps.setString(2, location);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j = new Jobs();

				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getDate(7) + "");

				list.add(j);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
