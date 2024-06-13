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

@WebServlet("/postJobs")
public class AddPostServlet extends HttpServlet{

	
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String title = req.getParameter("title");
			String description = req.getParameter("description");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String location = req.getParameter("location");
			
			Jobs j = new Jobs();
			j.setTitle(title);
			j.setDescription(description);
			j.setCategory(category);
			j.setStatus(status);
			j.setLocation(location);
			
			jobDAO dao = new jobDAO(DbConnection.getCon());
			
			HttpSession session = req.getSession();
			
					
			boolean f = dao.addJobs(j);
			
			if(f) {
				session.setAttribute("SuccessMsg", "Job posted Successfully");
				resp.sendRedirect("postJob.jsp");
			}else {
				session.setAttribute("msg", "Something went wrong on server");
				resp.sendRedirect("postJob.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
