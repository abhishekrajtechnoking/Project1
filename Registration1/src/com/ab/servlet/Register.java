package com.ab.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet{

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String name;
		String age;
		String mob;
		String email;
		String addr;
		String pwd;
		
		name=req.getParameter("name");
		age=req.getParameter("age");
		mob=req.getParameter("mobile");
		email=req.getParameter("email");
		addr=req.getParameter("address");
		pwd=req.getParameter("password");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
			PreparedStatement ps=con.prepareStatement("INSERT INTO DATA VALUES(?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2, age);
			ps.setString(3,mob);
			ps.setString(4,email);
			ps.setString(5,addr);
			ps.setString(6, pwd);
			
			int result=ps.executeUpdate();
			
			if(result>0) {
				res.sendRedirect("register.jsp");
			}
			else {
				res.sendRedirect("failed.jsp");
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
