<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
 <%@ page import="org.json.simple.parser.JSONParser,java.io.BufferedReader,java.io.IOException,java.io.InputStreamReader,
 java.io.PrintWriter,
java.net.HttpURLConnection,
 java.net.URL,
org.json.simple.JSONArray,
org.json.simple.JSONObject" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="result.jsp" method="post">

<table border="1">
		<tr>
			<td>From</td>
			<td>Departure Time</td>
			<td>Service Number</td>
			<td>Journey Time</td>
			<td>Operator Service Tax</td>
			<td>Boarding Points Details</td>
			<td>Available Seat</td>
			<td>Operator Code</td>
			<td>Operator Name</td>
			<td>Cancellation Terms</td>
			<td>Operator Details</td>
			<td>Partial Cancellation Allowed</td>
			<td>Alter Mobile Required</td>
			<td>Maximum Seats</td>
			<td>Id Proof Required</td>
			<td>Passenger Details</td>
			<td>Mobile Ticket</td>
			<td>Ratings</td>
			<td>Schedule Code</td>
			<td>AC Bus</td>
			<td>Bus Type</td>
			<td>Fare</td>
			
		</tr>
		
	<%
	String date=null;
	try {
		date=request.getParameter("date");
		
		URL url=new URL("http://devapp.ticketgoose.com/bookbustickets/rest/json/2.0/search?username=javatest&password=123456&travelDate="+date+"&fromStationCode=72&toStationCode=76");
		HttpURLConnection con=(HttpURLConnection)url.openConnection();
		con.setDoOutput(true);
		con.setRequestMethod("POST");
		con.setRequestProperty("Content-Type", "text/json");
		//res.setContentType("appliction/json");
		PrintWriter pw=response.getWriter();
		
		BufferedReader br=new BufferedReader(new InputStreamReader(con.getInputStream()));
		
		String output="";
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) {
			//pw.println(output);
			
			String parse=output.toString();
			
			Object obj=new JSONParser().parse(parse);
			JSONObject jo=(JSONObject)obj;
			
			String from=(String)jo.get("fromStationCode");
			//pw.println("FROM::"+from);
			
			%>
			<%
			//for(int i=0;i<=from.length();i++){
			%>
				<tr><td><%=from%></td>
			<%	
			//}
			%>
			
			<% 
			JSONArray ja=(JSONArray)jo.get("searchResult");
			
			for(Object search:ja) {
				//pw.println(search);
			%>
			<% 	
				JSONObject jo1=(JSONObject)search;
				String deptTime=(String)jo1.get("departureTime");
				//pw.println("Departure Time::"+deptTime);
				
			
				String servNum=(String)jo1.get("serviceNumber");
				//pw.println("Service Number::"+servNum);
				
				
				String jourTime=(String)jo1.get("journeyTime");
				//pw.println("Journey Time::"+jourTime);
				
				
				String optServTax=(String)jo1.get("operatorServiceTax");
				//pw.println("Operator Service Tax::"+optServTax);
				
				
				
				%>
					<td><%=deptTime%><br></td>
					<td><br><%=servNum%></td>
					<td><br><%=jourTime%></td>
					<td><br><%=optServTax%></td>
				<%	
				%>
				<% 
				Object board=(Object)jo1.get("boardingPointDetails");
				//JSONArray  arr1Check;
				if(board instanceof JSONArray) {
				JSONArray ja1=(JSONArray)jo1.get("boardingPointDetails");
				for(int i=0;i<ja1.size();i++) {
					
					JSONObject jsonobj_1 = (JSONObject)ja1.get(i);
					//JSONObject jsonobj_2 = (JSONObject) jsonobj_1.get("boardingPointDetails");
					String code=(String)("CODE::" +jsonobj_1.get("code"));
					String name=(String)("NAME::" +jsonobj_1.get("name"));
					String time=(String)("Time::" +jsonobj_1.get("time"));
					%>
						<td><%=code%>
						<%=name%>
						<%=time%><br></td>
					<% 
					//pw.println("CODE::" +jsonobj_1.get("code"));
					//pw.println("Name::" +jsonobj_1.get("name"));
					//pw.println("TIME::" +jsonobj_1.get("time"));
					
				}
			}
				else if(board instanceof JSONObject) {
					
					Object brd=(Object)jo1.get("boardingPointDetails");
					JSONObject jobj1=(JSONObject)brd;
					String code=(String)jobj1.get("code");
					String name=(String)jobj1.get("name");
					String time=(String)jobj1.get("time");
					//pw.println("BoardingPoint Details::"+" Code::"+code+" Name::"+name+" Time::"+time);
					%>
					<td><%=code%>
					<%=name%>
					<%=time%></td>
				<% 
				}
				else {
					String code=(String)jo1.get("code");
					//pw.println("CODE::"+code);
					String name=(String)jo1.get("name");
					//pw.println("NAME::"+name);
					String time=(String)jo1.get("time");
					//pw.println("Time::"+time);
					%>
					<td><%=code%>
					<%=name%>
					<%=time%></td>
				<% 
					
				}
				String avlSeats=(String)jo1.get("availableSeats");
				//pw.println("Available Seats::"+avlSeats);
				
				String optrCode=(String)jo1.get("operatorCode");
				//pw.println("Oprator Code::"+optrCode);
				
				String optrName=(String)jo1.get("operatorName");
				//pw.println("Oprator Name::"+optrName);
				
				%>
				<td><%=avlSeats%>
				<%=optrCode%>
				<%=optrName%></td>
			<% 
				
				Object cancl=(Object)jo1.get("cancellationTerms");
				
				if(cancl instanceof JSONArray) {
				JSONArray ja2=(JSONArray)jo1.get("cancellationTerms");
				for(int j=0;j<ja2.size();j++) {
					//pw.println("Cancelation Term::"+ja2.get(j));
					%>
					<td><%=ja2.get(j)%></td>
					
				<% 
				}
				}
				else if(cancl instanceof JSONObject) {
					
					Object brd=(Object)jo1.get("cancellationTerms");
					JSONObject can=(JSONObject)brd;
					//pw.println("Cancellation Terms::"+can);
					%>
					<td><%=can%><br>
					
				<% 
				}
				else {
					String cancel=(String)jo1.get("cancellationTerms");
					//pw.println("Cancellation Terms::"+cancel);
					%>
					<td><%=cancel%><br>
					
				<% 
				}
				
				Object oprtorDtls=(Object)jo1.get("operatorDetails");
				JSONObject jo3=(JSONObject)oprtorDtls;
				String adrReq=(String)jo3.get("addressRequired");
				//pw.println("ADDRESS REQUIRED::"+adrReq);
				%>
					<td><%=adrReq%><br>
					
				<% 
				String partCanc=(String)jo3.get("partialCancelAllowed");
				//pw.println("Partial Cancellation::"+partCanc);
				%>
					<td><%=partCanc%><br>
					
				<% 
				String altMob=(String)jo3.get("alternateMobileRequired");
				//pw.println("Alternate mobile number REQUIRED::"+altMob);
				%>
					<td><%=altMob%><br>
					
				<% 
				String mxSeat=(String)jo3.get("maxSeat");
				//pw.println("Maximum Seat::"+mxSeat);
				%>
					<td><%=mxSeat%><br>
					
				<% 
				String idPrf=(String)jo3.get("idProofRequired");
				//pw.println("ID Proof Required::"+idPrf);
				%>
					<td><%=idPrf%><br>
					
				<% 
				String psngDetails=(String)jo3.get("passengerDetails");
				//pw.println("Passenger Details::"+psngDetails);
				%>
					<td><%=psngDetails%><br>
					
				<% 
				String mobTcktAllo=(String)jo3.get("mobileTicketAllowed");
				//pw.println("Mobile Ticket Allowed::"+mobTcktAllo);
				%>
					<td><%=mobTcktAllo%><br>
					
				<% 
				
				String arvTime=(String)jo1.get("arrivalTime");
				//pw.println("Arrival Time::"+arvTime);
				%>
					<td><%=arvTime%><br>
					
				<% 
				
				Object ratings=(Object)jo1.get("ratings");
				JSONObject jo4=(JSONObject)ratings;
				String stfPvr=(String)jo4.get("staffBehavior");
				//pw.println("Staff Behaviour::"+stfPvr);
				String punch=(String)jo4.get("punctuality");
				//pw.println("Punctuality::"+punch);
				String busQlt=(String)jo4.get("busQuality");
				//pw.println("Bus Quality::"+busQlt);
				%>
					<td><%=stfPvr%></td>
					<td><%=punch%></td>
					<td><%=busQlt%></td>
					
				<% 
				
				String scCode=(String)jo1.get("scheduleCode");
				//pw.println("Schedule Code::"+scCode);
				%>
					<td><%=scCode%></td>
					
				<%
				
				String acBus=(String)jo1.get("acBus");
				//pw.println("AC Bus::"+acBus);
				%>
					<td><%=acBus%></td>
					
				<%
				
				String busType=(String)jo1.get("busType");
				//pw.println("Bus Type::"+busType);
				%>
					<td><%=busType%></td>
					
				<%
				
				String ticketFare=(String)jo1.get("ticketFare");
				//pw.println("Ticket Fare::"+ticketFare);
				%>
					<td><%=ticketFare%></td></tr>
					
				<%
				
				pw.println(".............................");
			}
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	%>
	
	
		
		
			
			
			<td>${optServTax}</td>
			<td>${code1},${name1},${time1}</td>
		
		</table>
</form>
</body>
</html>