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

@WebServlet("/cityList")
public class CityList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter pw=res.getWriter();
		try{
			String ip=req.getRemoteAddr();
			String clientId="ApiIntegrationNew";
			String tockenId=null;
			String countryCode=null;
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
			PreparedStatement ps1=conn.prepareStatement("SELECT CODE FROM COUNTRY");
			PreparedStatement ps2=conn.prepareStatement("SELECT token_id FROM cust_detail");
			
			ResultSet rs1=ps1.executeQuery();
			ResultSet rs2=ps2.executeQuery();
		
			if(rs2.next()==true){
				tockenId=rs2.getString(1);
				pw.println(tockenId);
			}

			
			while(rs1.next()) {
				
		
			countryCode=rs1.getString(1);
			pw.println(countryCode);
			
		
			 
		URL url=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/DestinationCityList");
		HttpURLConnection con=(HttpURLConnection)url.openConnection();
		
		JSONObject jo=new JSONObject();
		
	 	jo.put("ClientId", "ApiIntegrationNew");
	 	jo.put("TokenId", tockenId);
	 	jo.put("EndUserIp", ip);
	 	jo.put("CountryCode", countryCode);
		
	 	String city=jo.toString();
	 	
		con.setDoOutput(true);
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "application/json");
		con.setRequestProperty("Accept","application/json");
		
		
		
		 BufferedWriter httpRequestBodyWriter =new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
		 httpRequestBodyWriter.write(city);
		    httpRequestBodyWriter.flush();
		    httpRequestBodyWriter.close();
		 
		
	
	  BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
	  
	  String cityList=""; 
	  System.out.println("Output from Server .... \n");
	  
	  while((cityList = br.readLine()) != null) {
	  
	  pw.println(cityList);
	  
	  		}
	  }
				
	
	}
			catch(Exception e){
				e.printStackTrace();
			}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
