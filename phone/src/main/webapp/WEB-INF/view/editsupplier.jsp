<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Edit</title>
 <head>
  <link rel="stylesheet" href='<x:url value="/resources/css/bootstrap.min.css"></x:url>' />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}
</style>
</head>
<body>
<h1>
		<center>
			<i>Welcome to Shopping Cart</i>
		</center>
	</h1>

<style>

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li

 

a


:hover


:not

 

(
.activ--

 

)
{
background-color


:

 

#111


;
}
.activ {
	background-color: blue;
}
</style>
</head>
<body>

	<ul>
		<li><a href="home">Home</a></li>
		<li><a href="retrieveUser">Manage users</a></li>
		<li><a href="retrive">Manage Products</a></li>
		<li><a href="retriveC">Manage Categories</a></li>
		<li><a href="RetriveSupplier">Manage Supplier</a></li>


	<li style="float: right"><a class="activ" href="${pageContext.request.contextPath}">Logout</a></li>
	</ul>
	</nav>
  <form:form  modelAttribute="Supplier" method="post" action="updatesupplier" >
  <table>
     
      <tr><td><form:label path="supid">Supplier Id :</form:label></td>
               <td><form:input path="supid" value="${Supplier.supid}"/></td>
           </tr>
           
      <tr><td><form:label path="supname">Supplier Name :</form:label></td>
               <td><form:input path="supname" value="${Supplier.supname}"/></td>
           </tr>
       <tr><tr><td><form:label path="suplocation">Supplier Location :</form:label></td>
               <td><form:input path="suplocation" value="${Supplier.suplocation}"/></td>
           </tr>
           <tr><tr><td><form:label path="categoryid">category id :</form:label></td>
               <td><form:input path="categoryid" value="${Supplier.categoryid}"/></td>
           </tr>
         <tr><tr><td><form:label path="categoryname">category name :</form:label></td>
               <td><form:input path="categoryname" value="${Supplier.categoryname}"/></td>
           </tr>
          <tr><tr><td><form:label path="productid">product id :</form:label></td>
               <td><form:input path="productid" value="${Supplier.productid}"/></td>
           </tr>
           <tr><tr><td><form:label path="productname">product name :</form:label></td>
               <td><form:input path="productname" value="${Supplier.productname}"/></td>
           </tr>
               <tr><td></td>
               <td><input type="submit" value="submit"/></td>
           </tr>
           </table>      
  </form:form>   
  <footer class="container-fluid text-center">
		<p>Copy rights</p>
		<P>2016-2020</P>
	</footer>
</body>
</html>