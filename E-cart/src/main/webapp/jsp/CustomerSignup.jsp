<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer SignUp</title>
</head>
<body>
<form action="/customer/signup" method="post"><br>
Name:<input  type="text" name="name"><br>
Email:<input  type="text" name="email"><br>
Mobile:<input  type="number" name="mobile" pattern="{0-9}[10]"><br>
Create Password: <input type="password" name="password"><br>
Date of Birth:<input  type="date" name="date"><br>
Gender:
<input  type="radio" name="gender" value="male">Male
<input  type="radio" name="gender" value="female">FeMale<br>
Address:<textarea rows="5" cols="30" name="address"></textarea><br>
<button>Signup</button><button type="reset">Clear</button>
</form>
<a href="/customer/login"><button>Back</button></a>
</body>
</html>