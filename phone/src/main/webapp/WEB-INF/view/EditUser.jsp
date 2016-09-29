 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Edit Supplier</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
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
  <form:form modelAttribute="Login" method="post" action="updateUser">
    <table>
    <tr><td><form:label path="id">User ID:</form:label></td>
               <td><form:input path="id" value="${Login.id}" text="readonly"/></td>
           </tr>
           
      <tr><td><form:label path="name">User Name :</form:label></td>
               <td><form:input path="name" value="${Login.name}" text="readonly"/></td>
           </tr>
           
           <tr><td><form:label path="password">password:</form:label></td>
               <td><form:input path="password" value="${Login.password}" text="readonly"/></td>
           </tr>
           <tr><td><form:label path="status">status:</form:label></td>
             <td><form:input path="status" value="${Login.status}"/>
               </td>
           </tr>
           <tr><td><form:label path="role">role:</form:label></td>
               <td><form:input path="role" value="${Login.role}"/>
               </td>
           </tr>
           
        
               <td><input type="submit" value="submit"/></td>
           </table>
           
                      
  </form:form>   
</body>
</html>
 