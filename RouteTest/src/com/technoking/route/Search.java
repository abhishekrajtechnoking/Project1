package com.technoking.route;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/search")
public class Search extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String date;
		try {
			date=req.getParameter("date");
			
			URL url=new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/search?username=javatest&password=123456&travelDate="+date+"&fromStationCode=72&toStationCode=76");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "text/json");
			//res.setContentType("appliction/json");
			PrintWriter pw=res.getWriter();
			
			BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
			
			String output="";
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				//pw.println(output);
				
				String parse=output.toString();
				
				Object obj=new JSONParser().parse(parse);
				JSONObject jo=(JSONObject)obj;
				
				String from=(String)jo.get("fromStationCode");
				pw.println("FROM::"+from);
				
				JSONArray ja=(JSONArray)jo.get("searchResult");
				for(Object search:ja) {
					pw.println(search);
					
					JSONObject jo1=(JSONObject)search;
					
					String deptTime=(String)jo1.get("departureTime");
					pw.println("Departure Time::"+deptTime);
					
					String servNum=(String)jo1.get("serviceNumber");
					pw.println("Service Number::"+servNum);
					
					String jourTime=(String)jo1.get("journeyTime");
					pw.println("Journey Time::"+jourTime);
					
					String optServTax=(String)jo1.get("operatorServiceTax");
					pw.println("Operator Service Tax::"+optServTax);
					
					
					
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
