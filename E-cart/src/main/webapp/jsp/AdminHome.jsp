<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${name} Home</title>
</head>
<body>
<h1>${pass}</h1>
<h2>This is admin page</h2>
<a href="/admin/product-approve"><button>Approve Product</button></a>
<a href="/admin/customer-view"><button>View All Customer</button></a>
<a href="/admin/merchant-approve"><button>View all Merchant</button></a>
<a href="/admin/payment-add"><button>Add Payment Method</button></a>
<a href="/logout"><button>Logout</button></a>
</body>
</html>