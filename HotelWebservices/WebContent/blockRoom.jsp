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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post">
		<%
			try{
				String ip="171.79.62.10";
				String tokenId="";
				String traceId="";
				int resIndx=0;
				String hotCode="";
				String hotName="";
				String gustNat="";
				String noOfRooms="";
				int nRoom=0;
				boolean isBoucherBooking;
				
				
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
				PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
				ResultSet rs=ps.executeQuery();
				
			
				if(rs.last()==true) {
				 tokenId=rs.getString(1);
				} 
				
				traceId=request.getParameter("tracId");
				resIndx=Integer.parseInt(request.getParameter("resIndx"));
				hotCode=request.getParameter("hotCode");
				hotName=(String)session.getAttribute("hotName");
				gustNat=(String)session.getAttribute("national");
				
				
				out.println(tokenId);
				out.println("....."+traceId);
				out.println("....."+resIndx);
				out.println("....."+hotCode);
				out.println("....."+hotName);
				out.println("....."+gustNat);
				out.println("....."+noOfRooms);
			}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
	</form>
</body>
</html>