<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="org.json.simple.parser.JSONParser,java.io.BufferedReader,java.io.BufferedWriter,java.io.OutputStreamWriter,java.io.IOException,java.io.InputStreamReader,
 java.io.PrintWriter,
java.net.HttpURLConnection,
 java.net.URL,
 java.sql.*,
org.json.simple.JSONArray,
org.json.simple.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>City List</title>
</head>
<body>
	<form action="cityList" method="post">
		<%
		try{
		String ip=request.getRemoteAddr();
		String clientId="ApiIntegrationNew";
		String tockenId=null;
		String countryCode=null;
		String countryName=null;
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		PreparedStatement ps1=conn.prepareStatement("SELECT COUNTRYCODE FROM COUNTRYLIST");
		PreparedStatement ps2=conn.prepareStatement("SELECT token_id FROM cust_detail");
		
		ResultSet rs1=ps1.executeQuery();
		ResultSet rs2=ps2.executeQuery();
		
		if(rs1.next()==true){
			countryCode=rs1.getString(1);
		}
		
		if(rs2.last()==true){
			tockenId=rs2.getString(1);
		}
		
			 
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
	  
	  out.println(cityList); 
	  			
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		%>
	</form>
</body>
</html>