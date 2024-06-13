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


@WebServlet("/deleteJobs")
public class DeleteJobsServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			jobDAO dao = new jobDAO(DbConnection.getCon());
			boolean f = dao.deleteJobs(id);

			if (f) {
				session.setAttribute("SuccessMsg", "Job Deleted Successfully");
				resp.sendRedirect("viewJob.jsp");
			} else {
				session.setAttribute("msg", "Something went wrong on server");
				resp.sendRedirect("viewJob.jsp");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
