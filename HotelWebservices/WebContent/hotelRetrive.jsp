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
	<%
	
		
	String tid="";
	
	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		
		//...............Hotel_booking data retrive........................
		
		PreparedStatement ps1=con.prepareStatement("SELECT * FROM hotel_booking WHERE TID='"+tid+"'");
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
			
			<% 
			}
	%>
	</form>
</body>
</html>