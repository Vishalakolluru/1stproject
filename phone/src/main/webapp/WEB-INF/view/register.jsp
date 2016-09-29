<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
    <%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <style type="text/css">
.errStyle {
	color:red;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>
<h1>
		<center>
			<i>Welcome to Shopping Cart</i>
		</center>
	</h1>
	<center>
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

li a:hover {
	background-color: #111;
}
</style>

		<ul>
		<li><a class="active" href="home">Home</a></li>
			<li><a class="active" href="news">News</a></li>
			<li><a href="#contact">View all Products</a></li>
			


			<li style="float: right"><a class="active" href="login">Login</a></li>
			<li style="float: right"><a class="activ" href="register">Register now</a></li>
	</center>

    </div>
   
  </div>
      
</nav>
<div class="container">

<c:url var="register" value="register"></c:url>
   <form:form commandName="Register" method="post" action="storeuser">
   <form:errors path="*" cssClass="errStyle" element="div" />
<tr>
				<td><form:label path="name">
						<spring:message text="User Name" />
					</form:label></td>

				<td><form:input path="name" required="true"
						title="name should not be empty" /></td><br>
			</tr>
 <tr>
				<td><form:label path="email">
						<spring:message text="Email"
						 />
						
					</form:label></td>

				<td><form:input type="email" path="email" /></td><br>
			</tr>
 
  <tr>
				<td><form:label path="mobile">
						<spring:message text="Mobile" />
					</form:label></td>

				<td><form:input type="tel" path="mobile" pattern="^\d{10}$" required="true"
						title="Please enter valid mobile number" /></td><br>
			</tr>
  <tr>
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>

				<td><form:input path="address" required="true" /></td><br>
			</tr>

  <tr>
				<td><form:label  path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input type="password" path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td><br>
			<tr>
				<td><form:label path="confirm_Password">
						<spring:message text="confirm_password" />
					</form:label></td>

				<td><form:input type="password" path="confirm_Password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td><br>
			</tr>
 
  <button type="submit" class="btn btn-default">Submit</button>
</form:form>
</div>

</body>
<%@include file="/WEB-INF/view/footer.jsp" %>
</html>