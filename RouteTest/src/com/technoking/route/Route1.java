package com.technoking.route;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/route")
public class Route1 extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		resp.setContentType("appliction/json");
		PrintWriter pw=resp.getWriter();
		try {
			
		
			URL url = new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/route?username=javatest&password=123456");
	        URLConnection urlcon = url.openConnection();
	        InputStream stream = urlcon.getInputStream();

	        int i;
	        String response="";
	        while ((i = stream.read()) != -1) {
	            response+=(char)i;
	        }
	        //pw.print(response);
			
			  if(response.contains("message"))
			  
			  {
				  pw.print("Successfully find route");
			  
			  } 
			  else{
			  
			  pw.print(response); }
			 
		}
		catch(IOException io) {
			pw.print(io.getMessage());
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}
	
	

}
