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
		<table border="1">
		<tr>
			<td>Result Index</td>
			<td>Hotel Picture</td>
			<td>Hotel Code</td>
			<td>Hotel Name</td>
			<td>Hotel Description</td>
			<td>Ratings</td>
			<td>Price Details</td>
			<td>Hotel Address</td>
			<td>Contact No</td>
			
			</tr>
	
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
	  String rGuest;
	  int adlt=0;
	  int chld=0;
	  String strAge;
	  int chldAge;
	  int maxRat;
	  int minRat;
	  String tokenId="";
	  
	  Class.forName("com.mysql.jdbc.Driver");
		Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
		ResultSet rs=ps.executeQuery();
		
	
		if(rs.last()==true) {
		 tokenId=rs.getString(1);
		} 
	  
	  nRoom=Integer.parseInt(request.getParameter("rooms"));
	  session.setAttribute("nRoom", nRoom);
	  adlt=Integer.parseInt(request.getParameter("adlt"));
	  chld=Integer.parseInt(request.getParameter("chld"));
	  
	  JSONArray arrayChld=new JSONArray();
	  JSONObject joChld = new JSONObject();
	  chldAge=Integer.parseInt(request.getParameter("chldAge"));
	  if(chld>0){
		  for(int i=0;i<chld;i++){
			  arrayChld.add(i, chldAge);
		  }
	  }
	  
	  JSONArray arrayGuest=new JSONArray();
	
	  
	  int arr[]=new int[nRoom];
	  for(int i=0;i<arr.length;i++){
	  JSONObject joGust = new JSONObject();
	  //int tlAdlts=adlt+chld;
	  //rGuest=request.getParameter("rGust");
	  joGust.put("NoOfAdults", adlt);
	  joGust.put("NoOfChild", chld);
	  joGust.put("ChildAge", arrayChld);
	  
	  arrayGuest.add(joGust);
	//out.println("guest::"+arrayGuest.add(joGust));
	 
	  }
	  
	  //chldAge=request.getParameter("chld");
	  
	  String countryCode=request.getParameter("code");
	  int cityCode=Integer.parseInt(request.getParameter("cityCode"));
	  
	  strDate=request.getParameter("date");
	  //SimpleDateFormat formatter=new SimpleDateFormat("dd/mm/yyyy");
	  
	  
	  SimpleDateFormat dateFormat = new SimpleDateFormat("dd/mm/yyyy");
	  Date dat1 = new Date();
	  date=dateFormat.parse(strDate);
	  String stDat=dateFormat.format(date);
	 // out.println("Date  "+stDat);
	  
	  night=Integer.parseInt(request.getParameter("nights"));
	  prfCur=request.getParameter("currency");
	  guestNat=request.getParameter("national");
	  session.setAttribute("national", guestNat);
	  
	 // roomGust=request.getParameter("rGust");
	  //rGuest=new int[roomGust.length()];
	 
	  
	  //strAge=request.getParameter("chldAge");
	  //chldAge=new int[strAge.length()];
	 
	  
	  URL urlSearch=new URL("http://api.tektravels.com/BookingEngineService_Hotel/hotelservice.svc/rest/GetHotelResult/");
		HttpURLConnection conSearch=(HttpURLConnection)urlSearch.openConnection();
		
JSONObject joSearch=new JSONObject();
		
		//joSearch.put("ClientId", "ApiIntegrationNew");
		joSearch.put("TokenId", tokenId);
		joSearch.put("EndUserIp", "171.79.62.10");
		joSearch.put("CountryCode", countryCode);
		joSearch.put("CheckInDate", strDate);
		joSearch.put("NoOfNights", night);
		joSearch.put("CityId", cityCode);
		joSearch.put("PreferredCurrency", "INR");
		joSearch.put("GuestNationality", guestNat);
		joSearch.put("NoOfRooms", nRoom);
		joSearch.put("RoomGuests", arrayGuest);
		//joSearch.put("NoOfAdults", adlt);
		//joSearch.put("NoOfChild", chld);
		//joSearch.put("ChildAge[]", arrayChld);
		joSearch.put("MaxRating", 5);
		joSearch.put("MinRating", 2);
		
		
		
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
	  
	  //out.println(hotSearch); 
	  
	  String parse=hotSearch.toString();
	  
	  Object obj=new JSONParser().parse(parse);
	  JSONObject jo=(JSONObject)obj;
	  //hotel Search
	  Object hotRes=(Object)jo.get("HotelSearchResult");
	 // out.println("HOTEL RESULT::"+hotRes);
	 
	  //hotel result
	   JSONObject hJo=(JSONObject)hotRes;
	  JSONArray ja=(JSONArray)hJo.get("HotelResults");
	  String tracId=(String)hJo.get("TraceId");
	  for(int i=0;i<ja.size();i++) {
	  JSONObject jo1 = (JSONObject)ja.get(i);
	  //out.println(jo1);
		//JSONObject jsonobj_2 = (JSONObject) jsonobj_1.get("boardingPointDetails");
		
		String resIndx=(String)jo1.get("ResultIndex").toString();
		String hPic=(String)jo1.get("HotelPicture");
		String hCode=(String)jo1.get("HotelCode");
		String hName=(String)jo1.get("HotelName");
		String hDes=(String)jo1.get("HotelDescription");
		String hRating=(String)jo1.get("StarRating").toString();
		
		JSONObject pJo=(JSONObject)jo1.get("Price");
		String curCode=(String)("Currency Code:"+pJo.get("CurrencyCode"));
		String roomPrc=(String)("Room Price:"+pJo.get("RoomPrice"));
		String tax=(String)("Tax:"+pJo.get("Tax"));
		String othrCharg=(String)("Other Charges:"+pJo.get("OtherCharges"));
		String disc=(String)("Discount:"+pJo.get("Discount"));
		String pubPrice=(String)("Published Price:"+pJo.get("PublishedPrice"));
		String offrPrice=(String)("Offered Price:"+pJo.get("OfferedPriceRoundedOff"));
		String serTax=(String)("Service Tax:"+pJo.get("ServiceTax"));
		String gst=(String)("Total GST Amount:"+pJo.get("TotalGSTAmount"));
		
		String hAddrs=(String)jo1.get("HotelAddress");
		String hCont=(String)jo1.get("HotelContactNo");
		
		
		%>
		</form>
		<form action="hotelInfo.jsp" method="post">
		<tr>
		<td><%=resIndx %></td>
		<td><img alt="" src="<%=hPic%>"></td>
		<td><%=hCode%></td>
		<td><%=hName%></td>
		<td><%=hDes%></td>
		<td><%=hRating %></td>
		<td><%=curCode %><br><%=roomPrc %><br><%=tax%><br><%=othrCharg %><br><%=disc%><br><%=pubPrice%><br>
			<%=offrPrice%><br><%=serTax%><br><%=gst%></td>
		<td><%=hAddrs %></td>
		<td><%=hCont %></td>
		
		<input type="hidden" name="resultIndex" value="<%=resIndx %>">
		<input type="hidden" name="traceId" value="<%=tracId %>">
		<input type="hidden" name="hCode" value="<%=hCode %>">
		
		<td><button>Book</button></td>
		</tr>
		
		<% 
		out.println(tracId);
	  }
	  
	  
	  
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