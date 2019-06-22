<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import=" org.json.simple.parser.JSONParser,java.io.BufferedReader,java.io.BufferedWriter,
	java.io.OutputStreamWriter,java.io.IOException,java.io.InputStreamReader,
	java.net.HttpURLConnection,java.net.URL,java.sql.*,org.json.simple.JSONArray,org.json.simple.JSONObject,java.util.Random"
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
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		
		 Random rand = new Random(); 
		  
         
	        int num = rand.nextInt(10000); 
	        String tid=Integer.toString(num);
	        
	        String hotelBooking="";
			String parse=hotelBooking.toString();
			  
			  Object obj=new JSONParser().parse(parse);
			  JSONObject Jo=(JSONObject)obj;
			  
			  JSONObject resRootJO=(JSONObject)Jo.get("BookResult");
			 
			  String vchrStus=(String)resRootJO.get("VoucherStatus");
			  String resStus=(String)resRootJO.get("ResponseStatus");
			  String trsId=(String)resRootJO.get("TraceId");
			  String stus=(String)resRootJO.get("Status");
			  String htlBookStus=(String)resRootJO.get("HotelBookingStatus");
			  String cnfNo=(String)resRootJO.get("ConfirmationNo");
			  String bookRefNo=(String)resRootJO.get("BookingRefNo");
			  String bookId=(String)resRootJO.get("BookingId");
			  String isPrcChng=(String)resRootJO.get("IsPriceChanged");
			  String isCncPolChng=(String)resRootJO.get("IsCancellationPolicyChanged");
			  
			  JSONObject errJo=(JSONObject)resRootJO.get("Error");
			  String errCd=(String)errJo.get("ErrorCode");
			  String errMsg=(String)errJo.get("ErrorMessage");
			  
			  PreparedStatement ps1=con.prepareStatement("INSERT INTO HOTEL_BOOKING VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			  
			  ps1.setString(1, vchrStus);
			  ps1.setString(2, resStus);
			  ps1.setString(3, trsId);
			  ps1.setString(4, stus);
			  ps1.setString(5, htlBookStus);
			  ps1.setString(6, cnfNo);
			  ps1.setString(7, bookRefNo);
			  ps1.setString(8, bookId);
			  ps1.setString(9, isPrcChng);
			  ps1.setString(10,isCncPolChng);
			  ps1.setString(11, errCd);
			  ps1.setString(12, errMsg);
			  ps1.setString(13, tid);
			  
			  int res1=ps1.executeUpdate();
			  
			  if(res1>0){
				  out.println("hotel insertd");
			  }
			  else{
				  out.println("hotel insertion failed");
			  }
			  
		
		%>
	
	</form>
</body>
</html>