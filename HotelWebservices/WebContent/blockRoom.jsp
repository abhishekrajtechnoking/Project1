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
				int nRoom=0;
				boolean isVoucherBooking=false;
				int roomIndex=0;
				String ratPlnCode="";
				String roomTypeCode="";
				String roomTypeName="";
				String bedTypeCode="";
				int smokPref=3;
				String supplements="";
				String currCode="";
				double roomPrc=0.0;
				double tax=0.0;
				double exGustChrg=0.0;
				double chldChrg=0.0;
				double othChrg=0.0;
				double disc=0.0;
				double publsPrc=0.0;
				int publsPrcRndOff=0;
				double ofrPrc=0;
				int ofrPrcRndOff=0;
				double agntCom=0.0;
				double agntMrkUp=0.0;
				double servTax=0.0;
				double tds=0.0;
				
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
				nRoom=Integer.parseInt(request.getParameter("noRoom"));
				
				out.println(tokenId);
				out.println("....."+traceId);
				out.println("....."+resIndx);
				out.println("....."+hotCode);
				out.println("....."+hotName);
				out.println("....."+gustNat);
				out.println("....."+nRoom);
				
				roomIndex=Integer.parseInt(request.getParameter("roomIndex"));
				ratPlnCode=request.getParameter("ratePlanCode");
				roomTypeCode=request.getParameter("roomTypeCode");
				roomTypeName=request.getParameter("roomTypeName");
				
				JSONArray hotDtlsArr=new JSONArray();
				JSONObject hotObj=new JSONObject();
				hotObj.put("RoomIndex", roomIndex);
				hotObj.put("RatePlanCode", ratPlnCode);
				hotObj.put("RoomTypeCode", roomTypeCode);
				hotObj.put("RoomTypeName", roomTypeName);
				hotObj.put("BedTypeCode", bedTypeCode);
				hotObj.put("SmokePreference", smokPref);
				hotObj.put("Supplements", supplements);
				
				currCode=request.getParameter("curCode");
				roomPrc=Double.parseDouble(request.getParameter("roomPrice"));
				tax=Double.parseDouble(request.getParameter("tax"));
				exGustChrg=Double.parseDouble(request.getParameter("eGustChrg"));
				chldChrg=Double.parseDouble(request.getParameter("chldChrg"));
				othChrg=Double.parseDouble(request.getParameter("othChrg"));
				disc=Double.parseDouble(request.getParameter("discount"));
				publsPrc=Double.parseDouble(request.getParameter("publPrice"));
				publsPrcRndOff=Integer.parseInt(request.getParameter("pubsPrcRound"));
				ofrPrc=Double.parseDouble(request.getParameter("ofrPrc"));
				ofrPrcRndOff=Integer.parseInt(request.getParameter("ofrPrcRound"));
				agntCom=Double.parseDouble(request.getParameter("agntCom"));
				agntMrkUp=Double.parseDouble(request.getParameter("agntMark"));
				servTax=Double.parseDouble(request.getParameter("servTax"));
				tds=Double.parseDouble(request.getParameter("tds"));
				
				JSONObject prcJo=new JSONObject();
				prcJo.put("CurrencyCode", currCode);
				prcJo.put("RoomPrice", roomPrc);
				prcJo.put("Tax", tax);
				prcJo.put("ExtraGuestCharge", exGustChrg);
				prcJo.put("ChildCharge", chldChrg);
				prcJo.put("OtherCharges", othChrg);
				prcJo.put("Discount", disc);
				prcJo.put("PublishedPrice", publsPrc);
				prcJo.put("PublishedPriceRoundedOff", publsPrcRndOff);
				prcJo.put("OfferedPrice", ofrPrc);
				prcJo.put("OfferedPriceRoundedOff", ofrPrcRndOff);
				prcJo.put("AgentCommission", agntCom);
				prcJo.put("AgentMarkUp", agntMrkUp);
				prcJo.put("ServiceTax", servTax);
				prcJo.put("TDS", tds);
				
				hotDtlsArr.add(hotObj);
				hotDtlsArr.add(prcJo);
				out.println("....."+hotDtlsArr);
				
				
				/* JSONArray bedDtls=new JSONArray();
				bedDtls.add(bedTypeCode);
				out.println("....."+bedTypeCode); */
			}
		catch(Exception e){
			e.printStackTrace();
		}
		%>
	</form>
</body>
</html>