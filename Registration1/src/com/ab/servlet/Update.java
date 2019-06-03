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
import javax.servlet.http.HttpSession;

@WebServlet("/update")
public class Update extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String name;
			int age;
			String mob;
			String email;
			String addr;
			
			name=req.getParameter("ename");
			age=Integer.parseInt(req.getParameter("eage"));
			email=req.getParameter("eemail");
			addr=req.getParameter("eaddress");
			
			HttpSession session=req.getSession();
			mob= session.getAttribute("mob").toString();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
			PreparedStatement ps=con.prepareStatement("UPDATE DATA SET NAME=?,AGE=?,EMAIL=?,ADDRESS=? WHERE MOBILE='"+mob+"'");
			ps.setString(1, name);
			ps.setInt(2,age);
			ps.setString(3,email);
			ps.setString(4, addr);
			
			int result=ps.executeUpdate();
			
			if(result>0) {
				res.sendRedirect("update.jsp");
			}
			else {
				res.sendRedirect("ufailed.jsp");
			}
	}
		catch(Exception e) {
			e.printStackTrace();
		}
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, res);
	}
	
	

}
