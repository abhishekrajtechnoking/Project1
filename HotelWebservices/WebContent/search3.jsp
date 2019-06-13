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
	 			  //Search Hotel
	  String strDate="";
	  Date date;
	  int night=0;
	  String prfCur="";
	  String guestNat="";
	  int nRoom=0;
	  String roomGust;
	  int[] rGuest;
	  int adlt=0;
	  int chld=0;
	  String strAge;
	  int[] chldAge;
	  String countryCode=request.getParameter("code");
	  int cityCode=Integer.parseInt(request.getParameter("cityCode"));
	  
	  strDate=request.getParameter("date");
	  SimpleDateFormat formatter=new SimpleDateFormat("dd/mm/yyyy");
	  date=formatter.parse(strDate);
	  
	  night=Integer.parseInt(request.getParameter("nights"));
	  prfCur=request.getParameter("currency");
	  guestNat=request.getParameter("national");
	  nRoom=Integer.parseInt(request.getParameter("rooms"));
	  
	  roomGust=request.getParameter("rGust");
	  rGuest=new int[roomGust.length()];
	 
	  adlt=Integer.parseInt(request.getParameter("adlt"));
	  chld=Integer.parseInt(request.getParameter("chld"));
	  
	  strAge=request.getParameter("chldAge");
	  chldAge=new int[strAge.length()];
	 
	  
	  URL urlSearch=new URL("http://api.tektravels.com/BookingEngineService_Hotel/hotelservice.svc/rest/GetHotelResult/");
		HttpURLConnection conSearch=(HttpURLConnection)urlSearch.openConnection();
		
JSONObject joSearch=new JSONObject();
		
		//joSearch.put("ClientId", "ApiIntegrationNew");
		joSearch.put("TokenId", "736a2003-3c8e-43b8-bc69-72c193a5f7a9");
		joSearch.put("EndUserIp", "171.79.62.10");
		joSearch.put("CountryCode", countryCode);
		joSearch.put("CheckInDate", date);
		joSearch.put("NoOfNights", night);
		joSearch.put("CityId", cityCode);
		joSearch.put("PreferredCurrency", "₹");
		joSearch.put("GuestNationality", guestNat);
		joSearch.put("NoOfRooms", nRoom);
		
		 for(int i=0;i<rGuest.length;i++){
			  rGuest[i]=Character.digit(roomGust.charAt(i),10);
			  //out.println("guest::"+rGuest[i]);
		joSearch.put("RoomGuests []", rGuest[i]);
		 }
		joSearch.put("NoOfAdults", adlt);
		joSearch.put("NoOfChild", chld);
		
		 for(int i=0;i<chldAge.length;i++){
			  chldAge[i]=Character.digit(strAge.charAt(i),10);
		joSearch.put("ChildAge []", chldAge[i]);
		 }
		
		String search=joSearch.toString();
	 	out.println(search);
		conSearch.setDoOutput(true);
		conSearch.setRequestMethod("POST");
		conSearch.setRequestProperty("Content-Type", "application/json");
		conSearch.setRequestProperty("Accept","application/json");
		
		
		
		 BufferedWriter httpRequestBodyWriterSearch =new BufferedWriter(new OutputStreamWriter(conSearch.getOutputStream()));
		 httpRequestBodyWriterSearch.write(search);
		    httpRequestBodyWriterSearch.flush();
		    httpRequestBodyWriterSearch.close();
		 
		
	  BufferedReader brSearch=new BufferedReader(new InputStreamReader(conSearch.getInputStream()));
	  
	  String hotSearch=""; 
	  System.out.println("Output from Server .... \n");
	  
	  while((hotSearch = brSearch.readLine()) != null) {
	  
	  out.println(search); 
	  }
	  
			 }
			 catch(Exception e){
				 e.printStackTrace();
				 out.println(e.getMessage());
			 }
	 
	%>
	</form>
</body>
</html>