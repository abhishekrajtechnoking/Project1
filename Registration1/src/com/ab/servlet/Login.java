package com.ab.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

	
@WebServlet("/login")
public class Login extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			int mob;
			String pwd;
			
			mob=Integer.parseInt(req.getParameter("mob"));
			pwd=req.getParameter("pwd");
			
			HttpSession session=req.getSession(true);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
			PreparedStatement ps=con.prepareStatement("SELECT * FROM DATA WHERE MOBILE=? AND PASSWORD=?");
			ps.setInt(1, mob);
			ps.setString(2,pwd);
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()==true) {
		
			session.setAttribute("mob", mob);
		
			res.sendRedirect("retrive.jsp");
			}
			else {
				res.sendRedirect("login.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	

}
