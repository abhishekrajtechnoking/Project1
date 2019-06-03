<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Form</title>
	
</head>
<body>
	<form action="register" method="post" id="form">
		<script type="text/javascript" src="validate.js"></script>
		<table>
			<tr>
				<th>Name</th>
				<td>
					<input type="text" id="name" name="name">
					<label style="color: red;visibility: hidden" id="lbName">Name not be blank</label>
				</td>
			</tr>
			<tr>
				<th>Age</th>
				<td>
					<input type="text" id="age" name="age">
					<label style="color: red;visibility: hidden" id="lbAge">Age not be blank</label>

				</td>
			</tr>
			<tr>
				<th>Mobile</th>
				<td>
					<input type="text" id="mobile" name="mobile">
					<label style="color: red;visibility: hidden" id="lbMobile">Mobile Number must be in number</label>

				</td>
			</tr>
			<tr>
				<th>Email</th>
				<td>
					<input type="text" id="email" name="email">
					<label style="color: red;visibility: hidden" id="lbEmail">Invalid Email</label>
				</td>
			</tr>
			<tr>
				<th>Address</th>
				<td>
					<input type="text" id="address" name="address">
				</td>
			</tr>
			<tr>
				<th>Password</th>
				<td>
					<input type="text" id="password" name="password">
				</td>
			</tr>
			<tr>
				
				<td>
					<input type="submit" value="Submit" name="">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>