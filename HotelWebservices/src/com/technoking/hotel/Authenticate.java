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

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

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
			 	jo.put("EndUserIp", "182.68.0.109");
			 	
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
			  
			  String parse=authent.toString();
			  
			  Object obj1=new JSONParser().parse(parse);
			  JSONObject jo1=(JSONObject)obj1;
			  
			  Object status=(Object)jo1.get("Status");
				pw.println("Status::"+status);
				
				String tokenId=(String)jo1.get("TokenId");
				pw.println("Token Id::"+tokenId);
				
				Object obj2=(Object)jo1.get("Error");
				JSONObject jo2=(JSONObject)obj2;
				
				Object errCode=(Object)jo2.get("ErrorCode");
				pw.println("ErrorCode::"+errCode);
				
				String errMsg=(String)jo2.get("ErrorMessage");
				pw.println("ErrorMessage::"+errMsg);
				
				Object obj3=(Object)jo1.get("Member");
				JSONObject jo3=(JSONObject)obj3;
				
				String fName=(String)jo3.get("FirstName");
				pw.println("First Name::"+fName);
				
				String lName=(String)jo3.get("LastName");
				pw.println("Last Name::"+lName);
				
				String email=(String)jo3.get("Email");
				pw.println("Email::"+email);
				
				Object mbrId=(Object)jo3.get("MemberId");
				pw.println("Member Id::"+mbrId);
				
				Object agcId=(Object)jo3.get("AgencyId");
				pw.println("Agency Id::"+agcId);
				
				String loginName=(String)jo3.get("LoginName");
				pw.println("Login Name::"+loginName);
				
				String loginDetails=(String)jo3.get("LoginDetails");
				pw.println("Login Details::"+loginDetails);
				
				Object isPrimaryAgent=(Object)jo3.get("isPrimaryAgent");
				pw.println("isPrimaryAgent::"+isPrimaryAgent);
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
				PreparedStatement ps=conn.prepareStatement("INSERT INTO CUST_DETAIL VALUES(?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setObject(1,status);
				ps.setString(2,tokenId);
				ps.setObject(3,errCode);
				ps.setString(4,errMsg);
				ps.setString(5,fName);
				ps.setString(6,lName);
				ps.setString(7,email);
				ps.setObject(8,mbrId);
				ps.setObject(9,agcId);
				ps.setString(10,loginName);
				ps.setString(11,loginDetails);
				ps.setObject(12,isPrimaryAgent);
				
				int result=ps.executeUpdate();
				
				if(result>0) {
					res.sendRedirect("custReg.jsp");
				}
				else {
					res.sendRedirect("custRegFailed.jsp");
				}
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
