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
	<form action="blockRoom.jsp" method="post">
	
		
			<table border="1" style="overflow-x:auto;">
				<tr>
					<td>Room Index</td>
					<td>Room Type Name</td>
					<td>Rate Plan Code</td>
					<td>Rate Plan</td>
					<td>InfoSource</td>
					<td>Sequence Number</td>
					<td>Amount</td>
					<td>Date</td>
					<td>Price</td>
					<td>Last Cancellation Date</td>
					<td>Cancellation Policies</td>
					<td>Room COmbinations</td>
					
					
				</tr>
		
		<%
		try{
				
			String ip="171.79.62.10";
			String tokenId="";
			String trcId="";
			String hCode="";
			int resIndx=0;
			int nRoom=Integer.parseInt(request.getParameter("room"));
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
			PreparedStatement ps=conn1.prepareStatement("SELECT token_id FROM cust_detail");
			ResultSet rs=ps.executeQuery();
			
		
			if(rs.last()==true) {
			 tokenId=rs.getString(1);
			} 
			
			trcId=request.getParameter("trcId");
			hCode=request.getParameter("hoCode");
			resIndx=Integer.parseInt(request.getParameter("resIndx"));
			
			//out.println("Code:::::"+hCode);
			
			URL url=new URL("http://api.tektravels.com/BookingEngineService_Hotel/hotelservice.svc/rest/GetHotelRoom");
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
		  
		  String rInfo=""; 
		  System.out.println("Output from Server .... \n");
		  
		  while((rInfo = br.readLine()) != null) {
		  
		 //out.println(rInfo);
		 
		 String parse=rInfo.toString();
		 
		 Object obj=new JSONParser().parse(rInfo);
		 JSONObject rInfoJo=(JSONObject)obj;
		 
		 JSONObject hRoomResJo=(JSONObject)rInfoJo.get("GetHotelRoomResult");
		 String traceId=(String)hRoomResJo.get("TraceId");
		 //out.println(traceId);
		 JSONArray ja1=(JSONArray)hRoomResJo.get("HotelRoomsDetails");
		 
		 //out.println(ja1);
		 
		 for(int i=0;i<ja1.size();i++){
			 JSONObject hrdJo=(JSONObject)ja1.get(i);
			 
			 out.println(hrdJo);
			 
			 String roomIndex=(String)hrdJo.get("RoomIndex").toString();
			 String roomTypeCode=(String)hrdJo.get("RoomTypeCode");
			 String roomTypeName=(String)hrdJo.get("RoomTypeName");
			 String ratePlanCode=(String)hrdJo.get("RatePlanCode");
			 String ratePlan=(String)hrdJo.get("RatePlan").toString();
			 String infoSource=(String)hrdJo.get("InfoSource");
			 String seqNum=(String)hrdJo.get("SequenceNo");
			 String rProm=(String)hrdJo.get("RoomPromotion");
			 String lcanDate=(String)hrdJo.get("LastCancellationDate").toString();
			 String canPolc=(String)hrdJo.get("CancellationPolicy").toString();
			 
			 
			 JSONArray ja2=(JSONArray)hrdJo.get("DayRates");
			 for(int j=0;j<ja2.size();j++){
				 JSONObject drateJo=(JSONObject)ja2.get(j);
				 
				 String amnt=(String)drateJo.get("Amount").toString();
				 String date=(String)drateJo.get("Date").toString();
				 
				 JSONObject priceJo=(JSONObject)hrdJo.get("Price");
				 String curCode=(String)priceJo.get("CurrencyCode");
				 String rPrice=(String)priceJo.get("RoomPrice").toString();
				 String tax=(String)priceJo.get("Tax").toString();
				 String chChrg=(String)priceJo.get("ChildCharge").toString();
				 String othCharg=(String)priceJo.get("OtherCharges").toString();
				 String disc=(String)priceJo.get("Discount").toString();
				 String eGustChrg=(String)priceJo.get("ExtraGuestCharge").toString();
				 String pubsPrc=(String)priceJo.get("PublishedPrice").toString();
				 String pubsPrcRound=(String)priceJo.get("PublishedPriceRoundedOff").toString();
				 String ofrPrc=(String)priceJo.get("OfferedPrice").toString();
				 String ofrPrcRound=(String)priceJo.get("OfferedPriceRoundedOff").toString();
				 String servTax=(String)priceJo.get("ServiceTax").toString();
				 String servChrg=(String)priceJo.get("ServiceCharge").toString();
				 String tlgst=(String)priceJo.get("TotalGSTAmount").toString();
				 String agntCom=(String)priceJo.get("AgentCommission").toString();
				 String agntMrk=(String)priceJo.get("AgentMarkUp").toString();
				 String tds=(String)priceJo.get("TDS").toString();
				 
				 JSONArray ja3=(JSONArray)hrdJo.get("CancellationPolicies");
				 for(int k=0;k<ja3.size();k++){
					 JSONObject cancJo=(JSONObject)ja3.get(k);
					 
					 String chrg=(String)cancJo.get("Charge").toString();
					 String chrgTpe=(String)cancJo.get("ChargeType").toString();
					 String cur=(String)cancJo.get("Currency");
					 String fDate=(String)cancJo.get("FromDate").toString();
					 String tDate=(String)cancJo.get("ToDate").toString();
					 
					 JSONObject roComJo=(JSONObject)hRoomResJo.get("RoomCombinations");
				 		JSONArray roComJa=(JSONArray)roComJo.get("RoomCombination");
				 		
				 		for(int l=0;l<roComJa.size();l++){
				 			JSONObject jo1=(JSONObject)roComJa.get(l);
				 			
				 			JSONArray roInJa=(JSONArray)jo1.get("RoomIndex");
				 			
				 			for(int m=0;m<roInJa.size();m++){
				 			String index=(String)roInJa.get(m).toString();
				 
			 
			 
			 %>
			 	<tr>
					<td><%=roomIndex%></td>
					<td><%=roomTypeName%></td>
					<td><%=ratePlanCode%></td>
					<td><%=ratePlan%></td>
					<td><%=infoSource%></td>
					<td><%=seqNum%></td>
					<td><%=amnt%></td>
					<td><%=date%></td>
					<td>Currency:<%=curCode%><br>Room Price:<%=rPrice%><br>Tax:<%=tax%>
								<br>Child Charge:<%=chChrg%><br>Other Charge:<%=othCharg%><br>Discount:<%=disc%>
								<br>Extra Guest Charge:<%=eGustChrg%><br>Published Price:<%=pubsPrc%><br>Published Price RoundedOff:<%=pubsPrcRound%>
								<br>Offer Price:<%=ofrPrc%><br>Offer Price RoundedOff:<%=ofrPrcRound%>
								<br>Service Tax:<%=servTax%><br>Service Charge:<%=servChrg%><br>TotalGSTAmount:<%=tlgst%>
					</td>
					<td><%=lcanDate%></td>
					<td>
						Charge:<%=chrg%><br>Charge Type:<%=chrgTpe%><br>Currency:<%=cur%><br>From Date:<%=fDate%>
						<br>To Date:<%=tDate%><br>Cancellation Details:<%=canPolc%>
					</td>
					<td><%=index%></td>
					
					<input type="hidden" value="<%=roomIndex%>" name="roomIndex">
					<input type="hidden" value="<%=roomTypeCode%>" name="roomTypeCode">
					<input type="hidden" value="<%=roomTypeName%>" name="roomTypeName">
					<input type="hidden" value="<%=ratePlanCode%>" name="ratePlanCode">
					<input type="hidden" value="<%=curCode%>" name="curCode">
					<input type="hidden" value="<%=rPrice%>" name="roomPrice">
					<input type="hidden" value="<%=chChrg%>" name="chldChrg">
					<input type="hidden" value="<%=othCharg%>" name="othChrg">
					<input type="hidden" value="<%=disc%>" name="discount">
					<input type="hidden" value="<%=eGustChrg%>" name="eGustChrg">
					<input type="hidden" value="<%=pubsPrc%>" name="publPrice">
					<input type="hidden" value="<%=pubsPrcRound%>" name="pubsPrcRound">
					<input type="hidden" value="<%=ofrPrc%>" name="ofrPrc">
					<input type="hidden" value="<%=ofrPrcRound%>" name="ofrPrcRound">
					<input type="hidden" value="<%=agntCom%>" name="agntCom">
					<input type="hidden" value="<%=agntMrk%>" name="agntMark">
					<input type="hidden" value="<%=servTax%>" name="servTax">
					<input type="hidden" value="<%=tds%>" name="tds">
					
				</tr>
			 	
			 	<%			}
				 		}
				 	}
				 }	
			 } 
			 	
		 		
		 			//String ind1=index
		 		//out.println(index);
		 		
			 %>
			 
			 	
			 	
			 	</table>
			 <input type="hidden" value="<%=trcId%>" name="tracId">
			 <input type="hidden" value="<%=resIndx%>" name="resIndx">
			 <input type="hidden" value="<%=hCode%>" name="hotCode">
			 <input type="hidden" value="<%=trcId%>" name="tracId">
			 <input type="hidden" value="<%=nRoom%>" name="noRoom">
			 
			 
			 <%
		 			
		 		
		 	}
		 }
		catch(Exception e){
			e.printStackTrace();
		}
		%>
		<tr>
			<td><button>Block Room Details</button></td>
		</tr>
	</form>
</body>
</html>