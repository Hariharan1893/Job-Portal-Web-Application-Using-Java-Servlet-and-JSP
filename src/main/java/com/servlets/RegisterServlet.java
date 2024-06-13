package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.database.DbConnection;
import com.entity.Users;

@WebServlet("/signUp")
public class RegisterServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		try {

			String name = req.getParameter("name");
			String qualification = req.getParameter("qualification");
			String email = req.getParameter("email");
			String password = req.getParameter("password");

			UserDAO dao = new UserDAO(DbConnection.getCon());
			Users u = new Users(name, email, password, qualification, "User");

			boolean f = dao.addUsers(u);

			HttpSession session = req.getSession();

			if (f) {
				session.setAttribute("SuccessMsg", "Registered Successfully");
				res.sendRedirect("signup.jsp");
			} else {
				session.setAttribute("SuccessMsg", "Something went wrong on server");
				res.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
