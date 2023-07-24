<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ForgotOtp</title>
</head>
<body>
<div class="d-flex flex-row justify-content-center">
<h1  class="text-success">${pass}</h1>
<h1   class="text-danger">${fail}</h1>
<h1>Hello ${merchant.getName()} Enter OTP ${extra} </h1>
<form action="/merchant/forgot-otp/${merchant.getEmail()}" method="post">
<input type="text" name="otp" placeholder="Enter OTP">
<button>Verify</button><button type="reset">Cancel</button>
</form><br>
<a href="/merchant/resend-forgot-otp/${merchant.getEmail()}">click here to Resend OTP</a>
</div>
</body>
</html>