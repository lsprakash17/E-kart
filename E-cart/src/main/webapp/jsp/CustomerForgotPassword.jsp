<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot PAssword</title>
</head>
<body>
<form action="/customer/forgot-link" method="post">
EnterEMail: <input type="email" name="email"><br>
<button>Send Link</button> <button type="reset">Clear</button>
</form>
 <a href="/customer/login"><button >Back</button></a>
</body>
</html>