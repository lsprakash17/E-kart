<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="/merchant/product-add" method="post" enctype="multipart/form-data">
Name: <input type="text" name="name"> <br>
Price: <input type="text" name="price"> <br>
Quality: <input type="text" name="stock"> <br>
Image: <input type="file" name="pic"> <br>
Description: <input type="text" name="description"><br>
<button>Add Product</button> <button type="reset">Cancel</button>
</form>
<br>
<a href="/jsp/MerchantHome.jsp"><button>Back</button> </a>
</body>
</html>