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
	<h1>Update Successfully</h1>
	<form action="update" method="post">
	
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
	
	<table border="1">
		<tr>
			<td>Name</td>
			<td>Age</td>
			<td>Mobile</td>
			<td>Email</td>
			<td>Address</td>
			<td>Password</td>
		</tr>
		<%
			if(rs.next()==true){
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getInt(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
		</tr>
		<% } %>
		<tr>
			<td>
				<a href="edit.jsp">Edit</a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="form.jsp">New Registeration</a>
			</td>
		</tr>
		
		<tr>
			<td>
			<a href="logout.jsp">Logout</a>
			</td>
	</table>
</form>
</body>
</html>