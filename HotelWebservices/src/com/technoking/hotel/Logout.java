package com.technoking.hotel;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/logout")
public class Logout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		try {
			String tcknAgcId;
			String tcknMbrId;
			String tcknId;
			
			PrintWriter pw=res.getWriter();
			String ip = req.getRemoteAddr();
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
			PreparedStatement ps=conn.prepareStatement("SELECT agency_id,member_id,token_id FROM cust_detail");
			ResultSet rs=ps.executeQuery();
			
			URL url=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/Logout");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			
			if(rs.next()==true) {
			 tcknAgcId=rs.getString(1);
			 tcknMbrId=rs.getString(2);
			 tcknId=rs.getString(3);
			
			JSONObject jo=new JSONObject();
			
		 	jo.put("ClientId", "ApiIntegrationNew");
		 	jo.put("TokenAgencyId", tcknAgcId);
		 	jo.put("TokenMemberId ", tcknMbrId);
		 	jo.put("TokenId", tcknId);
		 	jo.put("EndUserIp", "122.162.28.213");
			
		 	String log=jo.toString();
			
		 	pw.println(jo);
			
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Accept","application/json");
			
			
			
			 BufferedWriter httpRequestBodyWriter =new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			 httpRequestBodyWriter.write(log);
			    httpRequestBodyWriter.flush();
			    httpRequestBodyWriter.close();
			 
			
		
		  BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		  
		  String logout=""; 
		  System.out.println("Output from Server .... \n");
		  
		  while((logout = br.readLine()) != null) {
		  
		  pw.println(logout);
		  }
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
