<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>home</title>
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
					


					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>

			</center>
		</div>
</body>

<%@include file="/WEB-INF/view/footer.jsp" %>

</html>