
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
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
	<div class="container" ng-app="imgApp" ng-controller="imgCtrl">
		<c:url var="addproduct" value="addproduct"></c:url>
		<form:form commandName="Product" method="post" action="storecar" enctype="multipart/form-data">
			<table class="table table-bordered">
			
				<tr>
					<td><form:label path="Name"> Name :</form:label></td>
					<td><form:input path="Name" /> <font color="red"><form:errors
								path="Name"></form:errors></font></td>
				<tr>
					<td><form:label path="Description">Description :</form:label></td>
					<td><form:input path="Description" /> <font color="red"><form:errors
								path="Description"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="quantity">Quantity :</form:label></td>
					<td><form:input path="quantity" /> <font color="red"><form:errors
								path="quantity"></form:errors></font></td>
				</tr>
				<tr>
					<td><form:label path="Price">Price :</form:label></td>
					<td><form:input path="Price" /> <font color="red"><form:errors
								path="Price"></form:errors></font></td>
				</tr>
				          
           <tr><td><form:label path="img"> Image :</form:label></td>
               <td><form:input path="img" type="file"/>
               <font color="red"><form:errors path="img"></form:errors></font></td>
               
           </tr>
               <tr><td><form:label path="supplier">Supplier Name:</form:label></td>
               <td><select name="Supplier.id" >
   				 <option value="">---Select---</option>
   				 <c:forEach var="Supplier" items="${suppliers}">
   				 <option value="${Supplier.id}">${Supplier.supname}</option>
    		</c:forEach>
    		</select></td></tr>
       

				<td><input type="submit" value="submit" class="btn" /></td>

			</table>
		</form:form>
</body>
</html>