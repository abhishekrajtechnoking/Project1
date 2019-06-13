package com.technoking.hotel;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

@WebServlet("/countryList")
public class CountryList extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter pw=res.getWriter();
		try {
			
			String ip=req.getRemoteAddr();
			String clientId="ApiIntegrationNew";
			String tockenId=null;
			String countryCode=null;
			String countryName=null;
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
			PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
			ResultSet rs=ps.executeQuery();
			
			URL url=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/CountryList");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			
			//URL url1=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/DestinationCityList");
			//HttpURLConnection con1=(HttpURLConnection)url1.openConnection();
			
			if(rs.next()==true) {
			 
			 tockenId=rs.getString(1);
			 //req.setAttribute("tockenId",tockenId);
			}
			
			JSONObject jo=new JSONObject();
			
		 	jo.put("ClientId", "ApiIntegrationNew");
		 	jo.put("TokenId", "736a2003-3c8e-43b8-bc69-72c193a5f7a9");
		 	jo.put("EndUserIp", "171.79.62.10");
			
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
		  
		  String parse=cityList.toString();
		  
		  Object obj1=new JSONParser().parse(parse);
		  JSONObject jo1=(JSONObject)obj1;
		  String cList=(String)jo1.get("CountryList");
		  
		  //pw.println("CountryList::"+cList);
		  
		  DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
		  DocumentBuilder db=dbf.newDocumentBuilder();
		  Document doc = db.parse(new InputSource(new StringReader(cList)));
		  //Document doc=db.parse(document.getElementsByTagName("Country"));
		  doc.getDocumentElement();
		 pw.println("RootElement:"+doc.getDocumentElement().getNodeName());
		  
		  NodeList nl=doc.getElementsByTagName("Countries");
		  
		 pw.println("..........");
		 
		 
			
			for(int i=0;i<nl.getLength();i++) {
				Node node=nl.item(i);
				pw.println("Curren Element:"+node.getNodeName());
				if(node.getNodeType()==Node.ELEMENT_NODE) {
					Element element=(Element)node;
					NodeList nl1=doc.getElementsByTagName("Country");
					for(int j=0;j<nl1.getLength();j++) {
					pw.println("Country : " + element.getAttribute("Country"));
					//pw.println("Code : " + element.getElementsByTagName("Code").item(j).getTextContent());
					countryCode=element.getElementsByTagName("Code").item(j).getTextContent();
					//req.setAttribute("countryList",countryCode);
					//pw.println("Name : " + element.getElementsByTagName("Name").item(j).getTextContent());
					countryName=element.getElementsByTagName("Name").item(j).getTextContent();
					
					pw.println("Code : "+countryCode);
					pw.println("Name : "+countryName);
				
					
					
			
					PreparedStatement ps1=conn1.prepareStatement("INSERT INTO COUNTRY VALUES(?,?)");
					ps1.setString(1, countryCode);
					ps1.setString(2, countryName);
					
					int result=ps1.executeUpdate();
					
					if(result>0) {
						pw.println("Insert successfully");
					}
					else {
						pw.println("Insertion Failed");
					}
			}
				
		}
			
			
			
		  
		  		}
			}
		}
		  catch(Exception e) {
			  e.printStackTrace();
			  //pw.println(e.getMessage());
		  }
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	

}
