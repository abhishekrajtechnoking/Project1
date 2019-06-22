<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.json.simple.parser.JSONParser,java.io.BufferedReader,java.io.BufferedWriter,java.io.OutputStreamWriter,java.io.IOException,java.io.InputStreamReader,
 java.io.PrintWriter,
java.net.HttpURLConnection,
 java.net.URL,
 java.sql.*,
org.json.simple.JSONArray,
org.json.simple.JSONObject,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,
org.w3c.dom.Document,
org.w3c.dom.Element,
org.w3c.dom.Node,
org.w3c.dom.NodeList,
org.xml.sax.InputSource,java.io.StringReader,java.text.SimpleDateFormat, 
java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  width:25%;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
</style>
</head>
<body>
	<form action="roomDtls.jsp" method="post">
	
			<table border="1" style="overflow-x:auto;">
		<tr>
			<td>Hotel Name</td>
			<td>Ratings</td>
			<td>Description</td>
			<td>Attraction</td>
			<td>Address</td>
			<td>Contact No</td>
			
			</tr>
			
		<%
			try{
				
			String ip="171.79.62.10";
			String tokenId="";
			String trcId="";
			String hCode="";
			int resIndx=0;
			int nRoom=Integer.parseInt(request.getParameter("nRoom"));
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
			PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
			ResultSet rs=ps.executeQuery();
			
		
			if(rs.last()==true) {
			 tokenId=rs.getString(1);
			} 
			
			trcId=request.getParameter("traceId");
			hCode=request.getParameter("hCode");
			resIndx=Integer.parseInt(request.getParameter("resultIndex"));
			
			%>
			<input type="hidden" value="<%=resIndx%>" name="resIndx">
		<input type="hidden" value="<%=hCode%>" name="hoCode">
		<input type="hidden" value="<%=trcId%>" name="trcId">
			<% 
			
			out.println("Code:::::"+hCode);
			
			URL url=new URL("http://api.tektravels.com/BookingEngineService_Hotel/hotelservice.svc/rest/GetHotelInfo");
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			
			JSONObject jo=new JSONObject();
			
		 	jo.put("TraceId", trcId);
		 	jo.put("TokenId", tokenId);
		 	jo.put("EndUserIp", "171.79.62.10");
		 	jo.put("HotelCode", hCode);
		 	jo.put("ResultIndex", resIndx);
			
		 	String info=jo.toString();
		 	
		 	con.setDoOutput(true);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json");
			con.setRequestProperty("Accept","application/json");
			
			
			
			 BufferedWriter httpRequestBodyWriter =new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			 httpRequestBodyWriter.write(info);
			    httpRequestBodyWriter.flush();
			    httpRequestBodyWriter.close();
			 
			
		
		  BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		  
		  String hInfo=""; 
		  System.out.println("Output from Server .... \n");
		  
		  while((hInfo = br.readLine()) != null) {
		  
		 out.println(hInfo); 
		 
			  String parse=hInfo.toString();
			  
			  Object obj=new JSONParser().parse(parse);
			  JSONObject iJo=(JSONObject)obj;
			  
			  
			  JSONObject hInJo=(JSONObject)iJo.get("HotelInfoResult");
			//Hotel Details
			  JSONObject htJo=(JSONObject)hInJo.get("HotelDetails");
			  String hName=(String)htJo.get("HotelName");
			  session.setAttribute("hotName",hName);
			  String rating=(String)htJo.get("StarRating").toString();
			  String desc=(String)htJo.get("Description");
			  String adr=(String)htJo.get("Address");
			  String hCont=(String)htJo.get("HotelContactNo");
			  
			  JSONArray ja1=(JSONArray)htJo.get("Attractions");
			  //out.println(ja1);
			  for(int i=0;i<ja1.size();i++){
				  JSONObject atJo=(JSONObject)ja1.get(i);
				  String key=(String)atJo.get("Key");
				  String value=(String)atJo.get("Value");
				  
						
						%>
						
		
						<% 
					
					
			  
			  %>
			  <tr>
				<td><%=hName%></td>
				<td><%=rating%></td>
				<td><%=desc%></td>
				<td>Key<%=key%><br>Value::<%=value%></td>
				<td><%=adr%></td>
				<td><%=hCont%></td>
			<td><button>CLick to Continue Booking</button></td>
		</tr>
		
		</table>
		<table border="1">
		
		<tr>
				<td>Facilities:</td>
			</tr>
		
		<% 
		  	
		  
		  JSONArray ja2=(JSONArray)htJo.get("HotelFacilities");
		  String fac="";
			for(int j=0;j<ja2.size();j++){
				fac=(String)ja2.get(j);
				
				%>
		<tr>
			<td><%=fac%><br></td>
		</tr>
		
		
		<%} %>
		
		</table>
		<table border="1">
			<tr>
				<td><h1>Images</h1></td>
			</tr>
				<%
					JSONArray ja3=(JSONArray)htJo.get("Images");
					for(int k=0;k<ja3.size();k++){
						String img=(String)ja3.get(k).toString();
						
						%>
							<tr>
								<td>
									<img alt="" src="<%=img%>">
								</td>
							</tr>
							<input type="hidden" name="room" value="<%=nRoom%>">
							</table>
						<% 
					
				
					}
		  		}
		  	}
		}
		  catch(Exception e){
			  e.printStackTrace();
		  }
		  
		%>
		
	</form>
</body>
</html>