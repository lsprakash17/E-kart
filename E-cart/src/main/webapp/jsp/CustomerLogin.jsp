<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
</head>
<body>
	<div>
		<h1>${fail}</h1>
		<h1>${pass}</h1>
		<form action="/customer/login" method="post">
			<h2>This is Customer Login</h2>
			Email: <input type="text" name="email"> <br> Password: <input
				type="text" name="password">
			<button type="submit">Login</button>
			<button type="reset">Clear</button>
		</form>	
		<br>
			<a href="/customer/forgotpassword">Forgot PassWord</a>
			<br><br>
			<a href="/customer/signup"><button type="button">New?clickhere to signup</button></a>
			<br>
		    <a href="/"><button type="button">Home</button></a>
			
	</div>
</body>
</html>