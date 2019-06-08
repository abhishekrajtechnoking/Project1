<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>search</title>
</head>
<body>
	<form action="search.jsp" method="post">
		<table>
			<tr>
				<th>From</th>
				<td>
					<input type="text" placeholder="date of journey" name="from">
				</td>
			</tr>
			<tr>
				<th>To</th>
				<td>
					<input type="text" placeholder="date of journey" name="to">
				</td>
			</tr>
		
			<tr>
				<th>Date of journey</th>
				<td>
					<input type="date" placeholder="date of journey" name="date">
				</td>
			</tr>
			
			<tr>
				<td>
					<button>submit</a></button>
				</td>
			</tr>
		</table>
	
	</form>
</body>
</html>