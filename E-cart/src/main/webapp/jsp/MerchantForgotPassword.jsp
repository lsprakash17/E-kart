<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<header>
		<!--Amazon Image Logo-->
		<div class="d-flex flex-row justify-content-center">
			<div class="row">
				<div class="col-md">
					<img class="img_1"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Uc6UsC7gxuxLzbVoESCDevNUeW4y0MarrA&usqp=CAU"
						alt="Amazon Logo" />
				</div>
				<!--Col 1 End-->
			</div>
			<!--Row 1 End-->
		</div>
		<!--Container End-->
		<!--Amazon Image Logo-->
	</header>
	<div class="d-flex flex-row justify-content-center">
		<div class="row">
			<div class="col-md">
			<form action="/merchant/forgotpassword" method="post">
		<div class="form-group">
			<label id="words_1" for="exampleInputEmail1">Email</label> <input
				type="email" class="form-control" id="exampleInputEmail1"
				aria-describedby="emailHelp" name="email"> <small
				id="emailHelp" class="form-text text-muted"></small>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-warning" id="sign-in"
				style="margin-right: 70px;">Send Otp</button>
			<button type="reset" class="btn btn-warning"
				style="margin-left: 110px;">Clear</button>
		</div>
	</form>
	<a href="/merchant/login"><button   class="btn btn-warning">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>