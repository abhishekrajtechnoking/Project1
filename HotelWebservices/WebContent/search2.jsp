<%@page import="com.technoking.hotel.CityList"%>
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
		<%
		
		String ip=request.getRemoteAddr();
		String clientId="ApiIntegrationNew";
		String tokenId="";
		String countryCode=request.getParameter("code");
		String countryName;
		String cityCode;
		String cityName;
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
		ResultSet rs=ps.executeQuery();
		
	
		if(rs.last()==true) {
		 tokenId=rs.getString(1);
		} 
		
		URL url=new URL("http://api.tektravels.com/SharedServices/SharedData.svc/rest/DestinationCityList");
		HttpURLConnection con=(HttpURLConnection)url.openConnection();
		
		JSONObject jo=new JSONObject();
		
	 	jo.put("ClientId", "ApiIntegrationNew");
	 	jo.put("TokenId", tokenId);
	 	jo.put("EndUserIp", "171.79.62.10");
	 	jo.put("CountryCode", countryCode);
		
	 	String city=jo.toString();
	 	//out.println(city);
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
	  
	 // out.println(cityList); 
	  
	  String parse=cityList.toString();
	  
	  Object obj1=new JSONParser().parse(parse);
	  JSONObject jo1=(JSONObject)obj1;
	  String cList=(String)jo1.get("DestinationCityList");
	  
	  //out.println("CountryList::"+cList);
	  
	  DocumentBuilderFactory dbf=DocumentBuilderFactory.newInstance();
	  DocumentBuilder db=dbf.newDocumentBuilder();
	  Document doc = db.parse(new InputSource(new StringReader(cList)));
	  //Document doc=db.parse(document.getElementsByTagName("Country"));
	  doc.getDocumentElement();
	 //out.println("RootElement:"+doc.getDocumentElement().getNodeName());
	  
	  NodeList nl=doc.getElementsByTagName("Cities");
	  
	 //out.println("..........");
		
		for(int i=0;i<nl.getLength();i++) {
			Node node=nl.item(i);
			//out.println("Current Element:"+node.getNodeName());
			if(node.getNodeType()==Node.ELEMENT_NODE) {
				Element element=(Element)node;
				NodeList nl1=doc.getElementsByTagName("City");
				
				%>
				
					Select City:<select id="cityCode1" name="cityCode">
				
				<%
				
				for(int j=0;j<nl1.getLength();j++) {
				//out.println("Country : " + element.getAttribute("CityId"));
				//pw.println("Code : " + element.getElementsByTagName("Code").item(j).getTextContent());
				cityCode=element.getElementsByTagName("CityId").item(j).getTextContent();
				//req.setAttribute("countryList",countryCode);
				//pw.println("Name : " + element.getElementsByTagName("Name").item(j).getTextContent());
				cityName=element.getElementsByTagName("CityName").item(j).getTextContent(); 
				
				//out.println("City Code :: "+cityCode);
				//out.println("City Name :: "+cityName); 
				%>
				<option value="<%=cityCode%>"><%=cityName%></option>
				
			<% 
			
				}
					
				%></select><%
			}
		}
	  }
	  
	 %>
	
		
</body>
</html>