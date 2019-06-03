<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Form</title>
	
</head>
<body>
	<%
	String mbl="";
	if(session.getAttribute("mob")==null||session.getAttribute("mob")==""){
		response.sendRedirect("login.jsp");
		
	}
	else{
		mbl=session.getAttribute("mob").toString();
	}
	
	Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/data","root","root");
		PreparedStatement ps=con.prepareStatement("SELECT * FROM DATA WHERE MOBILE='"+mbl+"'");
		ResultSet rs=ps.executeQuery();
	%>
	
	<%
			if(rs.next()==true){
		%>

	<form action="update" method="post" id="form">
		<script type="text/javascript" src="validate.js"></script>
		<table>
			<tr>
				<th>Name</th>
				<td>
					<input type="text" id="name" name="ename" value="<%=rs.getString(1) %>">
					<label style="color: red;visibility: hidden" id="lbName">Name not be blank</label>
				</td>
			</tr>
			<tr>
				<th>Age</th>
				<td>
					<input type="text" id="age" name="eage" value="<%=rs.getInt(2) %>">
					<label style="color: red;visibility: hidden" id="lbAge">Age not be blank</label>

				</td>
			</tr>
			<tr>
				<th>Mobile</th>
				<td>
					<input type="text" id="mobile" name="emobile" value="<%=rs.getInt(3)%>" readonly>
					<label style="color: red;visibility: hidden" id="lbMobile">Mobile Number must be in number</label>

				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<input type="text" id="email" name="eemail" value="<%=rs.getString(4) %>">
					<label style="color: red;visibility: hidden" id="lbEmail">Invalid Email</label>
				</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>
					<input type="text" id="address" name="eaddress" value="<%=rs.getString(5) %>">
				</td>
			</tr>
			<% } %>
			<tr>
				
				<td>
					<input type="submit" value="Submit" name="">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>