<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form action="login" method="post">
		<table>
			<tr>
				<th>Mobile Number</th>
				<td>
					<input type="text" placeholder="Mobile number" name="mob">
				</td>
			</tr>
			
			<tr>
				<th>Password</th>
				<td>
					<input type="password" placeholder="Password" name="pwd">
				</td>
			</tr>
			<tr>
			<td>
			<button>Login</button>
			</td>
			</tr>
			
			<tr>
			<td>
			<a href="form.jsp">Register</a>
			</td>
			</tr>
		</table>
	</form>
</body>
</html>