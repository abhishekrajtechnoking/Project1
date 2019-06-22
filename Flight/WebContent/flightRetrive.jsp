<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="#" method="post">
	<h1>Login Successful</h1>
	
	<%
		
	String tid="";
	
	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/flight","root","root");
		
		//...............flight_booking data retrive........................
		
		PreparedStatement ps1=con.prepareStatement("SELECT * FROM flight_booking WHERE TID='"+tid+"'");
		ResultSet rs1=ps1.executeQuery();
		
	%>
	
		<%
			if(rs1.next()==true){
		%>
		
			<%=rs1.getString(1) %>
			<%=rs1.getString(2) %>
			<%=rs1.getString(3) %>
			<%=rs1.getString(4) %>
			<%=rs1.getString(5) %>
			<%=rs1.getString(6) %>
			<%=rs1.getString(7) %>
			<%=rs1.getString(8) %>
			<%=rs1.getString(9) %>
			<%=rs1.getString(10) %>
			<%=rs1.getString(11) %>
			<%=rs1.getString(12) %>
			<%=rs1.getString(13) %>
			<%=rs1.getString(14) %>
			<%=rs1.getString(15) %>
			<%=rs1.getString(16) %>
			<%=rs1.getString(17) %>
			<%=rs1.getString(18) %>
		
		<% } %>
		<%
		//...............Passenger Details...............
		
		PreparedStatement ps2=con.prepareStatement("SELECT * FROM PASSENGER_DTLS WHERE TID='"+tid+"'");
		ResultSet rs2=ps2.executeQuery();
		
		%>
		
		<%
			if(rs2.next()==true){
		%>
		
			<%=rs2.getString(1) %>
			<%=rs2.getString(2) %>
			<%=rs2.getString(3) %>
			<%=rs2.getString(4) %>
			<%=rs2.getString(5) %>
			<%=rs2.getString(6) %>
			<%=rs2.getString(7) %>
			<%=rs2.getString(8) %>
			<%=rs2.getString(9) %>
			<%=rs2.getString(10) %>
			<%=rs2.getString(11) %>
			<%=rs2.getString(12) %>
			<%=rs2.getString(13) %>
			<%=rs2.getString(14) %>
			<%=rs2.getString(15) %>
			<%=rs2.getString(16) %>
			<%=rs2.getString(17) %>
			<%=rs2.getString(18) %>
			<%=rs2.getString(19) %>
			<%=rs2.getString(20) %>
			<%=rs2.getString(21) %>
			<%=rs2.getString(22) %>
			<%=rs2.getString(23) %>
			<%=rs2.getString(24) %>
			<%=rs2.getString(25) %>
			<%=rs2.getString(26) %>
			<%=rs2.getString(27) %>
			<%=rs2.getString(28) %>
			<%=rs2.getString(29) %>
			<%=rs2.getString(30) %>
			<%=rs2.getString(31) %>
			<%=rs2.getString(32) %>
			<%=rs2.getString(33) %>
			<%=rs2.getString(34) %>
			<%=rs2.getString(35) %>
			<%=rs2.getString(36) %>
			<%=rs2.getString(37) %>
			<%=rs2.getString(38) %>
			<%=rs2.getString(39) %>
			<%=rs2.getString(40) %>
			<%=rs2.getString(41) %>
			<%=rs2.getString(42) %>
			<%=rs2.getString(43) %>
			<%=rs2.getString(44) %>
			<%=rs2.getString(45) %>
			<%=rs2.getString(46) %>
			<%=rs2.getString(47) %>
			<%=rs2.getString(48) %>
			<%=rs2.getString(49) %>
			<%=rs2.getString(50) %>
			<%=rs2.getString(51) %>
			<%=rs2.getString(52) %>
			<%=rs2.getString(53) %>
			<%=rs2.getString(54) %>
			<%=rs2.getString(55) %>
			<%=rs2.getString(56) %>
			<%=rs2.getString(57) %>
			<%=rs2.getString(58) %>
			<%=rs2.getString(59) %>
			<%=rs2.getString(60) %>
			<%=rs2.getString(61) %>
			<%=rs2.getString(62) %>
			<%=rs2.getString(63) %>
			<%=rs2.getString(64) %>
			<%=rs2.getString(65) %>
			<%=rs2.getString(66) %>
		
		<% } %>
		
		<%
		//.............Fare...................
		
			PreparedStatement ps3=con.prepareStatement("SELECT * FROM FARE WHERE TID='"+tid+"'");
			ResultSet rs3=ps3.executeQuery();
			
			
			if(rs3.next()==true){
		%>
		
			<%=rs3.getString(1) %>
			<%=rs3.getString(2) %>
			<%=rs3.getString(3) %>
			<%=rs3.getString(4) %>
			<%=rs3.getString(5) %>
			<%=rs3.getString(6) %>
			<%=rs3.getString(7) %>
			<%=rs3.getString(8) %>
			<%=rs3.getString(9) %>
			<%=rs3.getString(10) %>
			<%=rs3.getString(11) %>
			<%=rs3.getString(12) %>
			<%=rs3.getString(13) %>
			<%=rs3.getString(14) %>
			<%=rs3.getString(15) %>
			<%=rs3.getString(16) %>
			<%=rs3.getString(17) %>
			<%=rs3.getString(18) %>
			<%=rs3.getString(19) %>
			<%=rs3.getString(20) %>
			<%=rs3.getString(21) %>
			<%=rs3.getString(22) %>
			<%=rs3.getString(23) %>
		
		<% } %>
		
		<%
			//...............Segments........................
			
				PreparedStatement ps4=con.prepareStatement("SELECT * FROM SEGEMENTS WHERE TID='"+tid+"'");
			ResultSet rs4=ps4.executeQuery();
			
			
			if(rs4.next()==true){
		%>
		
			<%=rs4.getString(1) %>
			<%=rs4.getString(2) %>
			<%=rs4.getString(3) %>
			<%=rs4.getString(4) %>
			<%=rs4.getString(5) %>
			<%=rs4.getString(6) %>
			<%=rs4.getString(7) %>
			<%=rs4.getString(8) %>
			<%=rs4.getString(9) %>
			<%=rs4.getString(10) %>
			<%=rs4.getString(11) %>
			<%=rs4.getString(12) %>
			<%=rs4.getString(13) %>
			<%=rs4.getString(14) %>
			<%=rs4.getString(15) %>
			<%=rs4.getString(16) %>
			<%=rs4.getString(17) %>
			<%=rs4.getString(18) %>
			<%=rs4.getString(19) %>
			<%=rs4.getString(20) %>
			<%=rs4.getString(21) %>
			<%=rs4.getString(22) %>
			<%=rs4.getString(23) %>
			<%=rs4.getString(24) %>
			<%=rs4.getString(25) %>
			<%=rs4.getString(26) %>
			<%=rs4.getString(27) %>
			<%=rs4.getString(28) %>
			<%=rs4.getString(29) %>
			<%=rs4.getString(30) %>
			<%=rs4.getString(31) %>
			<%=rs4.getString(32) %>
			<%=rs4.getString(33) %>
			<%=rs4.getString(34) %>
			<%=rs4.getString(35) %>
			<%=rs4.getString(36) %>
			<%=rs4.getString(37) %>
			<%=rs4.getString(38) %>
		
		<% } %>
		<% 
		
			//...............Fare_Rule...............
			
			PreparedStatement ps5=con.prepareStatement("SELECT * FROM FARE_RULES WHERE TID='"+tid+"'");
			ResultSet rs5=ps5.executeQuery();
			
			
			if(rs5.next()==true){
		%>
		
			<%=rs5.getString(1) %>
			<%=rs5.getString(2) %>
			<%=rs5.getString(3) %>
			<%=rs5.getString(4) %>
			<%=rs5.getString(5) %>
			<%=rs5.getString(6) %>
			<%=rs5.getString(7) %>

		
		<% } %>
		
</form>
</body>
</html>