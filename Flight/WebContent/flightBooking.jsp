<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=" org.json.simple.parser.JSONParser,java.io.BufferedReader,java.io.BufferedWriter,
	java.io.OutputStreamWriter,java.io.IOException,java.io.InputStreamReader,
	java.net.HttpURLConnection,java.net.URL,java.sql.*,org.json.simple.JSONArray,org.json.simple.JSONObject,
	java.text.DateFormat,java.text.SimpleDateFormat,java.time.LocalDateTime,java.time.format.DateTimeFormatter,
 	java.util.Calendar,java.util.Date,java.time.LocalDate,java.util.Random"
	 %>
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
			

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flight","root","root");
			
			 Random rand = new Random(); 
			  
		         
		        int num = rand.nextInt(10000); 
		        String tid=Integer.toString(num);
		       
		        // Print random integers 
		        //System.out.println("Random Integers: "+tid);
			
			DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		    Date date = new Date();
	        //System.out.println(sdf.format(date));

	        Calendar cal = Calendar.getInstance();
	        String dt=sdf.format(cal.getTime());
			
			String flightBooking="";
			String parse=flightBooking.toString();
			  
			  Object obj=new JSONParser().parse(parse);
			  JSONObject Jo=(JSONObject)obj;
			  
			  JSONObject resRootJO=(JSONObject)Jo.get("Response");
			  
			  JSONObject resChldJO=(JSONObject)resRootJO.get("Response");
			  String pnr=(String)resChldJO.get("PNR");
			  String refId=(String)resChldJO.get("BookingId");
			  
			  JSONObject fltItnrJO=(JSONObject)resChldJO.get("FlightItinerary");
			  String from=(String)fltItnrJO.get("Origin");
			  String to=(String)fltItnrJO.get("Destination");
			  String airCode=(String)fltItnrJO.get("AirlineCode");
			  String llc=(String)fltItnrJO.get("IsLCC").toString();
			  String nRefund=(String)fltItnrJO.get("NonRefundable").toString();
			  String invAmnt=(String)fltItnrJO.get("InvoiceAmount").toString();
			  String status=(String)fltItnrJO.get("Status");
			  String rmrk=(String)fltItnrJO.get("Remarks");
			  
			  JSONObject fareJO=(JSONObject)fltItnrJO.get("Fare");
			  String pubFare=(String)fareJO.get("PublishedFare").toString();
			  String ofrFare=(String)fareJO.get("OfferedFare").toString();
			  String comErn=(String)fareJO.get("CommissionEarned").toString();
			  String servFee=(String)fareJO.get("ServiceFee").toString();
			  String bagg=(String)fareJO.get("TotalBaggageCharges").toString();
			  String meal=(String)fareJO.get("TotalMealCharges").toString();
			  
				PreparedStatement ps1=con.prepareStatement("INSERT INTO FLIGHT_BOOKING VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps1.setString(1, tid);
				ps1.setString(2,refId);
				ps1.setString(3, pnr);
				ps1.setString(4,airCode);
				ps1.setString(5, from);
				ps1.setString(6, to);
				ps1.setString(7, llc);
				ps1.setString(8, nRefund);
				ps1.setString(9, pubFare);
				ps1.setString(10, ofrFare);
				ps1.setString(11, comErn);
				ps1.setString(12, servFee);
				ps1.setString(13, bagg);
				ps1.setString(14, meal);
				ps1.setString(15, invAmnt);
				ps1.setString(16, status);
				ps1.setString(17, dt);
				ps1.setString(18, rmrk);
				
				int res1=ps1.executeUpdate();
				
				if(res1>0){
					out.println("Insertd successfully");
				}
				else
				{
					out.println("Insertion Failed");
				}
				
			//.................Passenger Details...................
			  
			  JSONArray psnJA=(JSONArray)fltItnrJO.get("Passenger");
			  for(int i=0;i<psnJA.size();i++){
				  JSONObject psnObj=(JSONObject)psnJA.get(i);
				  
				  String paxId=(String)psnObj.get("PaxId").toString();
				  String title=(String)psnObj.get("Title");
				  String fName=(String)psnObj.get("FirstName");
				  String lName=(String)psnObj.get("LastName");
				  String paxType=(String)psnObj.get("PaxType").toString();
				  String dob=(String)psnObj.get("DateOfBirth");
				  String gndr=(String)psnObj.get("Gender").toString();
				  String passNo=(String)psnObj.get("PassportNo");
				  String addr1=(String)psnObj.get("AddressLine1");
				  String addr2=(String)psnObj.get("AddressLine2");
				  String city=(String)psnObj.get("City");
				  String cntry=(String)psnObj.get("CountryName");
				  String national=(String)psnObj.get("Nationality");
				  String contNo=(String)psnObj.get("ContactNo");
				  String email=(String)psnObj.get("Email");
				  String isLeadPax=(String)psnObj.get("IsLeadPax");
				  String ffAirCode=(String)psnObj.get("FFAirLineCode");
				  String ffNo=(String)psnObj.get("FFNumber");
				  
				  JSONObject frJo=(JSONObject)psnObj.get("Fare");
				  String curr=(String)frJo.get("Currency");
				  String baseFare=(String)frJo.get("BaseFare").toString();
				  String tax=(String)frJo.get("Tax").toString();
				  String yqTax=(String)frJo.get("YQTax").toString();
				  String addTxnFeOfr=(String)frJo.get("AdditionalTxnFeeOfrd").toString();
				  String addTxnFePub=(String)frJo.get("AdditionalTxnFeePub").toString();
				  String pgChrg=(String)frJo.get("PGCharge").toString();
				  String othChrg=(String)frJo.get("OtherCharges").toString();
				  String disc=(String)frJo.get("Discount").toString();
				  String pubFr=(String)frJo.get("PublishedFare").toString();
				  String comEarn=(String)frJo.get("CommissionEarned").toString();
				  String plbEarn=(String)frJo.get("PLBEarned").toString();
				  String incEarn=(String)frJo.get("IncentiveEarned").toString();
				  String ofrFr=(String)frJo.get("OfferedFare").toString();
				  String tdsOnCom=(String)frJo.get("TdsOnCommission").toString();
				  String tdsOnPlb=(String)frJo.get("TdsOnPLB").toString();
				  String tdsOnInc=(String)frJo.get("TdsOnIncentive").toString();
				  String serFee=(String)frJo.get("ServiceFee").toString();
				  String tlBagChrg=(String)frJo.get("TotalBagageCharges").toString();
				  String tlMealChrg=(String)frJo.get("TotalMealCharges").toString();
				  String tlSeatChrg=(String)frJo.get("TotalSeatCharges").toString();
				  String tlsplSerChrg=(String)frJo.get("TotalSpecialServiceCharges").toString();
				  
				  JSONArray bagJa=(JSONArray)psnObj.get("Baggage");
				  for(int j=0;j<bagJa.size();j++){
					  JSONObject bagJo=(JSONObject)bagJa.get(j);
					  
					  String airLineCode=(String)bagJo.get("AirlineCode");
					  String fltNo=(String)bagJo.get("FlightNumber");
					  String wayType=(String)bagJo.get("WayType");
					  String code=(String)bagJo.get("Code");
					  String desc=(String)bagJo.get("Description");
					  String weight=(String)bagJo.get("Weight");
					  String prc=(String)bagJo.get("Price").toString();
					  String orig=(String)bagJo.get("Origin");
					  String dest=(String)bagJo.get("Destination");
					  
					  JSONObject tktObj=(JSONObject)psnObj.get("Ticket");
					  String tktId=(String)tktObj.get("TicketId").toString();
					  String tktNo=(String)tktObj.get("TicketNumber");
					  String isuDate=(String)tktObj.get("IssueDate");
					  String vldAir=(String)tktObj.get("ValidatingAirline");
					  String remark=(String)tktObj.get("Remarks");
					  String servFeeDisType=(String)tktObj.get("ServiceFeeDisplayType");
					  String stus=(String)tktObj.get("Status");
					  String conjNo=(String)tktObj.get("ConjuctionNumber");
					  String tktType=(String)tktObj.get("TicketType");
					  
					  JSONArray segAdJa=(JSONArray)psnObj.get("SegmentAdditionalInfo");
					  for(int k=0;k<segAdJa.size();k++){
						  JSONObject segAdJo=(JSONObject)segAdJa.get(k);
						  String frBasis=(String)segAdJo.get("FareBasis");
						  String nva=(String)segAdJo.get("NVA");
						  String nvb=(String)segAdJo.get("NVB");
						  String bag=(String)segAdJo.get("Baggage");
						  String mel=(String)segAdJo.get("Meal");
						  String seat=(String)segAdJo.get("Seat");
						  String splServ=(String)segAdJo.get("SpecialService");
						  
						  PreparedStatement ps2=con.prepareStatement("INSERT INTO PASSENGER_DTLS VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					  		
						  ps2.setString(1,paxId);
						  ps2.setString(2,title);
						  ps2.setString(3,fName);
						  ps2.setString(4,lName);
						  ps2.setString(5,paxType);
						  ps2.setString(6,dob);
						  ps2.setString(7,gndr);
						  ps2.setString(8,passNo);
						  ps2.setString(9,addr1);
						  ps2.setString(10,addr2);
						  ps2.setString(11,city);
						  ps2.setString(12,cntry);
						  ps2.setString(13,national);
						  ps2.setString(14,contNo);
						  ps2.setString(15,email);
						  ps2.setString(16,isLeadPax);
						  ps2.setString(17,ffAirCode);
						  ps2.setString(18,ffNo);
						  ps2.setString(19,curr);
						  ps2.setString(20,baseFare);
						  ps2.setString(21,tax);
						  ps2.setString(22,yqTax);
						  ps2.setString(23,addTxnFeOfr);
						  ps2.setString(24,addTxnFePub);
						  ps2.setString(25,pgChrg);
						  ps2.setString(26,othChrg);
						  ps2.setString(27,disc);
						  ps2.setString(28,pubFr);
						  ps2.setString(29,comEarn);
						  ps2.setString(30,plbEarn);
						  ps2.setString(31,incEarn);
						  ps2.setString(32,ofrFr);
						  ps2.setString(33,tdsOnCom);
						  ps2.setString(34,tdsOnPlb);
						  ps2.setString(35,tdsOnInc);
						  ps2.setString(36,serFee);
						  ps2.setString(37,tlBagChrg);
						  ps2.setString(38,tlMealChrg);
						  ps2.setString(39,tlSeatChrg);
						  ps2.setString(40,tlsplSerChrg);
						  ps2.setString(41,airLineCode);
						  ps2.setString(42,fltNo);
						  ps2.setString(43,wayType);
						  ps2.setString(44,code);
						  ps2.setString(45,desc);
						  ps2.setString(46,weight);
						  ps2.setString(47,prc);
						  ps2.setString(48,orig);
						  ps2.setString(49,dest);
						  ps2.setString(50,tktId);
						  ps2.setString(51,tktNo);
						  ps2.setString(52,isuDate);
						  ps2.setString(53,vldAir);
						  ps2.setString(54,remark);
						  ps2.setString(55,servFeeDisType);
						  ps2.setString(56,stus);
						  ps2.setString(57,conjNo);
						  ps2.setString(58,tktType);
						  ps2.setString(59,frBasis);
						  ps2.setString(60,nva);
						  ps2.setString(61,nvb);
						  ps2.setString(62,bag);
						  ps2.setString(63,mel);
						  ps2.setString(64,seat);
						  ps2.setString(65,splServ);
						  ps2.setString(66, tid);
						  
						  int res2=ps2.executeUpdate();
						  
						  if(res2>0){
							  out.println("passng inserted");
						  }
						  else{
							  out.println("passng failed");
						  }
						    
					  }
					  
				  }
				   	  
			  }
			  
			  //.................Fare....................
			  
			  JSONObject fareJo=(JSONObject)fltItnrJO.get("Fare");
			  String currItr=(String)fareJo.get("Currency");
			  String baseFareItr=(String)fareJo.get("BaseFare").toString();
			  String taxItr=(String)fareJo.get("Tax").toString();
			  String yqTaxItr=(String)fareJo.get("YQTax").toString();
			  String addTxnFeOfrItr=(String)fareJo.get("AdditionalTxnFeeOfrd").toString();
			  String addTxnFePubItr=(String)fareJo.get("AdditionalTxnFeePub").toString();
			  String pgChrgItr=(String)fareJo.get("PGCharge").toString();
			  String othChrgItr=(String)fareJo.get("OtherCharges").toString();
			  String discItr=(String)fareJo.get("Discount").toString();
			  String pubFrItr=(String)fareJo.get("PublishedFare").toString();
			  String comEarnItr=(String)fareJo.get("CommissionEarned").toString();
			  String plbEarnItr=(String)fareJo.get("PLBEarned").toString();
			  String incEarnItr=(String)fareJo.get("IncentiveEarned").toString();
			  String ofrFrItr=(String)fareJo.get("OfferedFare").toString();
			  String tdsOnComItr=(String)fareJo.get("TdsOnCommission").toString();
			  String tdsOnPlbItr=(String)fareJo.get("TdsOnPLB").toString();
			  String tdsOnIncItr=(String)fareJo.get("TdsOnIncentive").toString();
			  String serFeeItr=(String)fareJo.get("ServiceFee").toString();
			  String tlBagChrgItr=(String)fareJo.get("TotalBagageCharges").toString();
			  String tlMealChrgItr=(String)fareJo.get("TotalMealCharges").toString();
			  String tlSeatChrgItr=(String)fareJo.get("TotalSeatCharges").toString();
			  String tlsplSerChrgItr=(String)fareJo.get("TotalSpecialServiceCharges").toString();
			  
			PreparedStatement ps3=con.prepareStatement("INSERT INTO FARE VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			ps3.setString(1,currItr);
			ps3.setString(2,baseFareItr);
			ps3.setString(3,taxItr);
			ps3.setString(4,yqTaxItr);
			ps3.setString(5,addTxnFeOfrItr);
			ps3.setString(6,addTxnFePubItr);
			ps3.setString(7,pgChrgItr);
			ps3.setString(8,othChrgItr);
			ps3.setString(9,discItr);
			ps3.setString(10,pubFrItr);
			ps3.setString(11,comEarnItr);
			ps3.setString(12,plbEarnItr);
			ps3.setString(13,incEarnItr);
			ps3.setString(14,ofrFrItr);
			ps3.setString(15,tdsOnComItr);
			ps3.setString(16,tdsOnPlbItr);
			ps3.setString(17,tdsOnIncItr);
			ps3.setString(18,serFeeItr);
			ps3.setString(19,tlBagChrgItr);
			ps3.setString(20,tlMealChrgItr);
			ps3.setString(21,tlSeatChrgItr);
			ps3.setString(22,tlsplSerChrgItr);
			ps3.setString(23,tid);
			
			int res3=ps3.executeUpdate();
			
			if(res3>0){
				out.println("fare inserted");
			}
			else{
				out.println("fare insert filed");
			}
			
			//...............Segments....................
			
			JSONArray segJa=(JSONArray)fltItnrJO.get("Segments");
			for(int l=0;l<segJa.size();l++){
				
				JSONObject segJo=(JSONObject)segJa.get(l);
				
				String bagSeg=(String)segJo.get("Baggage");
				String CabBagSeg=(String)segJo.get("CabinBaggage");
				String trpIndSeg=(String)segJo.get("TripIndicator").toString();
				String segIndSeg=(String)segJo.get("SegmentIndicator").toString();
				String airPnrSeg=(String)segJo.get("AirlinePNR");
				String durSeg=(String)segJo.get("Duration").toString();
				String grndTmSeg=(String)segJo.get("GroundTime").toString();
				String mileSeg=(String)segJo.get("Mile").toString();
				String stpOvrSeg=(String)segJo.get("StopOver").toString();
				String fltInfoIndxSeg=(String)segJo.get("FlightInfoIndex");
				String stpPntSeg=(String)segJo.get("StopPoint");
				String stpPntArvTmeSeg=(String)segJo.get("StopPointArrivalTime").toString();
				String stpPntDptTmeSeg=(String)segJo.get("StopPointDepartureTime").toString();
				String crftSeg=(String)segJo.get("Craft");
				String remarkSeg=(String)segJo.get("Remark");
				String eTktElgSeg=(String)segJo.get("IsETicketEligible");
				String fltStusSeg=(String)segJo.get("FlightStatus");
				String stusSeg=(String)segJo.get("Status");
				
				JSONObject airLnSegJo=(JSONObject)segJo.get("Airline");
				
				String airCdSeg=(String)airLnSegJo.get("AirlineCode");
				String airNmSeg=(String)airLnSegJo.get("AirlineName");
				String fltNoSeg=(String)airLnSegJo.get("FlightNumber");
				String freClsSeg=(String)airLnSegJo.get("FareClass");
				String optCarSeg=(String)airLnSegJo.get("OperatingCarrier");
				
				JSONObject orgSegJo=(JSONObject)segJo.get("Origin");
				String dptTmeSeg=(String)orgSegJo.get("DeptTime");
				
				JSONObject arOrgPrtSeg=(JSONObject)orgSegJo.get("Airport");
				
				String arOrgprtCdSeg=(String)arOrgPrtSeg.get("AirportCode");
				String arOrgprtNmSeg=(String)arOrgPrtSeg.get("AirportName");
				String termOrgSeg=(String)arOrgPrtSeg.get("Terminal");
				String ctyCdOrgSeg=(String)arOrgPrtSeg.get("CityCode");
				String ctyNmOrgSeg=(String)arOrgPrtSeg.get("CityName");
				String cntryNmOrgSeg=(String)arOrgPrtSeg.get("CountryName");
				
				JSONObject dstSegJo=(JSONObject)segJo.get("Destination");
				String arvTmeSeg=(String)orgSegJo.get("ArrTime");
				
				JSONObject arDstPrtSeg=(JSONObject)dstSegJo.get("Airport");
				
				String arDstprtCdSeg=(String)arDstPrtSeg.get("AirportCode");
				String arDstprtNmSeg=(String)arDstPrtSeg.get("AirportName");
				String termDstSeg=(String)arDstPrtSeg.get("Terminal");
				String ctyCdDstSeg=(String)arDstPrtSeg.get("CityCode");
				String ctyNmDstSeg=(String)arDstPrtSeg.get("CityName");
				String DstcntryNmSeg=(String)arDstPrtSeg.get("CountryName");
				
				PreparedStatement ps4=con.prepareStatement("INSERT INTO SEGMENTS VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				
				ps4.setString(1, bagSeg);
				ps4.setString(2, CabBagSeg);
				ps4.setString(3, trpIndSeg);
				ps4.setString(4, segIndSeg);
				ps4.setString(5, airPnrSeg);
				ps4.setString(6, durSeg);
				ps4.setString(7, grndTmSeg);
				ps4.setString(8, mileSeg);
				ps4.setString(9, stpOvrSeg);
				ps4.setString(10, fltInfoIndxSeg);
				ps4.setString(11, stpPntSeg);
				ps4.setString(12, stpPntArvTmeSeg);
				ps4.setString(13, stpPntDptTmeSeg);
				ps4.setString(14, crftSeg);
				ps4.setString(15, remarkSeg);
				ps4.setString(16, eTktElgSeg);
				ps4.setString(17, fltStusSeg);
				ps4.setString(18, stusSeg);
				ps4.setString(19, airCdSeg);
				ps4.setString(20, airNmSeg);
				ps4.setString(21, fltNoSeg);
				ps4.setString(22, freClsSeg);
				ps4.setString(23, optCarSeg);
				ps4.setString(24, arOrgprtCdSeg);
				ps4.setString(25, arOrgprtNmSeg);
				ps4.setString(26, termOrgSeg);
				ps4.setString(27, ctyCdOrgSeg);
				ps4.setString(28, ctyNmOrgSeg);
				ps4.setString(29, cntryNmOrgSeg);
				ps4.setString(30, dptTmeSeg);
				ps4.setString(31, arvTmeSeg);
				ps4.setString(32, arDstprtCdSeg);
				ps4.setString(33, arDstprtNmSeg);
				ps4.setString(34, termDstSeg);
				ps4.setString(35, ctyCdDstSeg);
				ps4.setString(36, ctyNmDstSeg);
				ps4.setString(37, DstcntryNmSeg);
				ps4.setString(38, tid);
				
				int res4=ps4.executeUpdate();
				
				if(res4>0){
					out.println("segments inserted");
				}
				else{
					out.println("segment not inserted");
				}
				
				
			}
			
			//.................Fare Rules.................
			
			JSONArray frRuleJa=(JSONArray)fltItnrJO.get("FareRules");
			for(int m=0;m<frRuleJa.size();m++){
				JSONObject frRuleJo=(JSONObject)frRuleJa.get(m);
				
				String orgnFrRule=(String)frRuleJo.get("Origin");
				String dstnFrRule=(String)frRuleJo.get("Destination");
				String airLnFrRule=(String)frRuleJo.get("Airline");
				String frBsCdFrRule=(String)frRuleJo.get("FareBasisCode");
				String frDtlFrRule=(String)frRuleJo.get("FareRuleDetail");
				String frRestFrRule=(String)frRuleJo.get("FareRestriction");
				
				PreparedStatement ps5=con.prepareStatement("INSERT INTO FARE_RULES VALUES(?,?,?,?,?,?,?)");
				
				ps5.setString(1, orgnFrRule);
				ps5.setString(2, dstnFrRule);
				ps5.setString(3, airLnFrRule);
				ps5.setString(4, frBsCdFrRule);
				ps5.setString(5, frDtlFrRule);
				ps5.setString(6, frRestFrRule);
				ps5.setString(7, tid);
				
				int res5=ps5.executeUpdate();
				
				if(res5>0){
					out.println("fareRule inserted");
				}
				else{
					out.println("fareRule insert failed");
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