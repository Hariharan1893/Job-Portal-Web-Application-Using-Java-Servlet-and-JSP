package com.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.jobDAO;
import com.database.DbConnection;
import com.entity.Jobs;

@WebServlet("/UpdateJob")
public class UpdateJobServlet extends HttpServlet	{

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			
			Jobs j = new Jobs();
			
			j.setId(id);
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);	
			j.setStatus(status);
			j.setLocation(location);
			
			HttpSession session = req.getSession();
			
			jobDAO dao = new jobDAO(DbConnection.getCon());
			boolean f = dao.updateJobs(j);
			
			if(f) {
				session.setAttribute("SuccessMsg", "Job updated Successfully");
				resp.sendRedirect("viewJob.jsp");
			}else {
				session.setAttribute("msg", "Something went wrong on server");
				resp.sendRedirect("viewJob.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
