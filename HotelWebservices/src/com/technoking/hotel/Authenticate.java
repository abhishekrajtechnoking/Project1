package com.technoking.hotel;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/authet")
public class Authenticate extends HttpServlet{
	
	
	 @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		 PrintWriter pw=res.getWriter();
			
		 try{
			 	String ip = req.getRemoteAddr();
			 	
			 	/*JSONObject json_object = new JSONObject();
				json_object.put("ClientId", "ApiIntegrationNew");
				json_object.put("UserName", "BTBTRAVEL");
				json_object.put("Password", "BTb@1234");
				json_object.put("EndUserIp", ip);
				URL url22 = new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate");
				
						HttpURLConnection conn = (HttpURLConnection) url22.openConnection();
						conn.setDoOutput(true);
						conn.setRequestMethod("POST");
						conn.setRequestProperty("Content-Type", "application/json");
						conn.setRequestProperty("Accept", "application/json");
										
									
						String urlParameters = json_object.toString();
						DataOutputStream wr = new DataOutputStream(conn.getOutputStream());
						wr.writeBytes(urlParameters);
						wr.flush();
						wr.close();
						BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
						String inputLine;
						StringBuffer respon = new StringBuffer();
						while ((inputLine = in.readLine()) != null) {
							System.out.println(inputLine);
						respon.append(inputLine);
							}
						in.close();*/
			 	
			 	JSONObject jo=new JSONObject();
			 	jo.put("ClientId", "ApiIntegrationNew");
			 	jo.put("UserName", "BTBTRAVEL");
			 	jo.put("Password", "BTb@1234");
			 	jo.put("EndUserIp", "47.30.244.183");
			 	
			 	String auth=jo.toString();
			 	//pw.println(jo);
				URL url=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate");
				HttpURLConnection con=(HttpURLConnection)url.openConnection();
				con.setDoOutput(true);
				con.setRequestMethod("POST");
				con.setRequestProperty("Content-Type", "application/json");
				con.setRequestProperty("Accept","application/json");
				
				
				
				 BufferedWriter httpRequestBodyWriter =new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
				 httpRequestBodyWriter.write(auth);
				    httpRequestBodyWriter.flush();
				    httpRequestBodyWriter.close();
				 
				
			
			  BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
			  
			  String authent=""; 
			  System.out.println("Output from Server .... \n");
			  while((authent = br.readLine()) != null) {
			  
			  pw.println(authent); 
			  }
			 
			}
			catch(Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
			}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	
	
	}

}
