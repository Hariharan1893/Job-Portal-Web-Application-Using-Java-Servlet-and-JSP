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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			Users u = new Users();
			
			if(email.equals("admin@gmail.com") && password.equals("admin@123")) {
				u.setRole("admin");
				
				session.setAttribute("userObj", u);	
				resp.sendRedirect("admin.jsp");
			}else {
				
				UserDAO dao = new UserDAO(DbConnection.getCon());
				Users user = dao.login(email, password);
				
				if(user != null) {
					session.setAttribute("userObj", user);
					resp.sendRedirect("userHome.jsp");
				}else {
					session.setAttribute("SuccessMsg", "Invalid Email & Password");
					resp.sendRedirect("login.jsp");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
