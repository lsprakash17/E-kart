<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="text-success">${fail}</h1>
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
				<form action="/merchant/signup" method="post"
					enctype="multipart/form-data">
					<div>Sign Up</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputName">Name</label> <input
							type="text" class="form-control" id="exampleInputName"
							aria-describedby="emailHelp" placeholder="Enter Name" name="name">
						<small id="NameHelp" class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputEmail1">Email</label> <input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							name="email"> <small id="emailHelp"
							class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputMobile">Mobile</label> <input
							type="mobile" class="form-control" id="exampleInputEmail1"
							aria-describedby="MobileHelp" placeholder="Enter Mobile"
							name="mobile" pattern="{0-9}[10]"> <small id="MobileHelp"
							class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputPassword">Create
							password</label> <input type="password" class="form-control"
							id="exampleInputPassword" aria-describedby="PasswordHelp"
							placeholder="Enter Password" name="password"> <small
							id="MobileHelp" class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_1" for="exampleInputPassword">Date of
							Birth</label> <input type="date" class="form-control"
							id="exampleInputdob" aria-describedby="dobeHelp" name="date">
						<small id="dobeHelp" class="form-text text-muted"></small>
					</div>
					<div class="form-group">
						<label id="words_1">Gender:</label> <input type="radio"
							name="gender" value="male">Male <input type="radio"
							name="gender" value="female">Female
					</div>
					<div class="form-group">
						<label for="exampleInputPicture">Picture:</label> <input
							type="file" name="pic" id="exampleInputPicture">
					</div>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">Address:</span>
						</div>
						<textarea class="form-control" aria-label="With textarea" name="address"></textarea>
					</div>
					<br>
					<div>
						<button type="submit" class="btn btn-warning">Signup</button>
						<button type="reset" class="btn btn-warning"
							style="margin-left: 180px;">Clear</button>
					</div>
				</form>
				<br> <a href="/merchant/login"><button type="button"
						class="btn btn-warning">Back</button></a>
			</div>
		</div>
	</div>
</body>
</html>