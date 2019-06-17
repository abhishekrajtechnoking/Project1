<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
		String tockenId=null;
		String countryCode=null;
		String countryName="";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel","root","root");
		PreparedStatement ps=conn1.prepareStatement("SELECT code,name FROM country");
		ResultSet rs1=ps.executeQuery();
		//ResultSet rs2=ps.executeQuery();
		%>
		<%
		if(rs1.next()==true) {
			tockenId=rs1.getString(1);
			}
		%> 
	<form action="search3.jsp" method="post"">
	<script type="text/javascript" src="validate.js"></script>
	<div>
	
		Select Country: <select value="<%=rs1.getString(1) %>" name="code" id="country" onchange="countryList()">
		
		<option value="">Select</option>
		<% 
		while(rs1.next()==true) { 
		%>
		
			<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
			
			<% }%>
			
		</select>
		<br> 
	
		 <div id="city">
		 	
		 </div>
		 
			
			<div>
			<table>
			<tr>
				<th>CheckInDate</th>
				<td>
					<input type="text" placeholder="dd/mm/yyyy" name="date">
				</td>
			</tr>
			
			<tr>
				<th>No of Nights</th>
				<td>
					<input type="number" placeholder="" name="nights">
				</td>
			</tr>
			
			<tr>
				<th>Nationality</th>
				<td>
					<input type="text" placeholder="Nationality" name="national">
				</td>
			</tr>
			
			<tr>
				<th>No of Rooms</th>
				<td>
					<input type="number" placeholder="" name="rooms">
				</td>
			</tr>
			
			<tr>
				<th>No of adults</th>
				<td>
					<input type="text" placeholder="" name="adlt">
				</td>
			</tr>
			
			<tr>
				<th>No of Child</th>
				<td>
					<input type="text" placeholder="" name="chld">
				</td>
			</tr>
			
			<tr>
				<th>Child Age</th>
				<td>
					<input type="text" placeholder="" name="chldAge">
				</td>
			</tr>
			
			<tr>
				<th>Total number of Guest</th>
				<td>
					<input type="text" placeholder="" name="nadlt">
				</td>
				<td>
					<input type="text" placeholder="" name="nchld">
				</td>
				<td>
					<input type="text" placeholder="" name="chldAge">
				</td>
			</tr>
		</table>
		</div>
		
		<input type="submit">
	</form>
</body>
</html>