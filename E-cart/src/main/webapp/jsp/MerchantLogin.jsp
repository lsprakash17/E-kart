<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Merchant Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="text-danger">${fail}</h1>
	<h1 class="text-success">${pass}</h1>
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
				<form action="/merchant/login" method="post">
					<div>Sign In</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputEmail1">Email</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							name="email"> <small id="emailHelp"
							class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_2" for="exampleInputPassword1">Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1"
							placeholder="Password" name="password"> <br>
						<div class="form-group">
							<button type="submit" class="btn btn-warning" id="sign-in"
								style="margin-right: 70px;">Sign In</button>
							<button type="reset" class="btn btn-warning"
								style="margin-left: 110px;">Clear</button>
						</div>
					</div>
					<div class="form-check"></div>
				</form>
				 <a href="/merchant/signup"><button type="button"
						class="btn btn-warning" id="grey-button">New?clickhere to
						signup</button></a> <br> <a href="/merchant/forgotpassword">Forgot
					PassWord </a> <a href="/"><button type="button" class="btn btn-info"
						style="margin-left: 130px;">Home</button></a>
			</div>
			<!--Col 1 End-->
		</div>
		<!--Row 1 End-->
	</div>
	<!--Container End-->
	<!--Form-->
</body>
</html>