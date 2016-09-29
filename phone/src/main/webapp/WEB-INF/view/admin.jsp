<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<title>Admin page</title>
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
	
	<div class="container"></div>
	<div class="container">
		<br>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
      <center>
        <img src="<c:url value="/resources/images/c2.jpg"/>" width="460" height="345">
         </center>
      </div>
     

      <div class="item">
      <center>
        <img src= "<c:url value="/resources/images/c3.jpg"/>" width="460" height="345">
         </center>
      </div>
    
      <div class="item">
       <center>
        <img src="<c:url value="/resources/images/c1.jpg"/>"  width="460" height="345">
       </center>
      </div>

      <div class="item">
       </center>
        <img src="<c:url value="/resources/images/c4.jpg"/>" width="460" height="345">
       </center>
      </div>
    </div>

<%@include file="/WEB-INF/view/footer.jsp" %>

</html>	
</ul>	
<body>